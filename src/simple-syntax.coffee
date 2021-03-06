
class SimpleSyntax

    singleQuotePattern = """(?:'(?:\\\\.|[^'])*')""" # value within '-quotes
    doubleQuotePattern = """(?:"(?:\\\\.|[^"])*")""" # value within "-quotes

    ###
    # imagine the following html:
    # <sometag abc='asd' asd>hello world</sometag>
    # Tag match would match the following items of the above html with the following params:
    # - 0: the whole tag match plus the following content: `<sometag abc='asd' asd>hello world`
    # - 1: the opening tag plus its name: `<sometag`
    # - 2: the tag name: `sometag`
    # - 3: the attributes of the tag: ` abc='asd' asd`
    # - 4: the end tag: `>`
    # - 5: the content after the tag untill the next tag: `hello world`
    ###
    tagsRegexp = ///
        (<)(script) # opening script tag
            ((?:\\.|[^>])*)? # attributes
        (/?>) # closing of a tag
        ((?:[^<]|<(?!/script))*) #everything after the script tag
        |
        (<)(style) # opening script tag
            ((?:\\.|[^>])*)? # attributes
        (>) # closing of a tag
        ((?:[^<]|<(?!/style))*) #everything after the script tag
        |
        (</?) # opening of a tag
        ([a-zA-Z0-9_-]+) # name of the tag
            ((?:\\.|[^/>]|/(?!>))*)? # attributes
        (/?>) # closing of a tag
        ([^<]*) #everything after the tag
    ///g

    ###
    # imagine the following attribute string:
    # ` abc='asd' asd`
    # Attribute match would match the following items of the above string with the following params:
    # - 0: the whole attribute: `abc='asd'`
    # - 1: the attribute name: `abc`
    # - 2: the equal sign: `=`
    # - 3: the attribute value: `'asd'`
    ###
    attributesRegexp = ///
        ([-A-Za-z0-9_]+) # attribute name
        (?: # optional attribute value start
            (\s*=\s*) # the equal sign
            (
                #{singleQuotePattern} # value within '-quotes
                |
                #{doubleQuotePattern} # value within "-quotes
                |
                (?:[^\s]+) # value without quotes
            )
        )?
    ///g


    javascriptRegexps =
        string: ///
            #{singleQuotePattern} # value within '-quotes
            |
            #{doubleQuotePattern} # value within "-quotes
        ///

        comment: ///
            (?:
                //[^\n]+ # single line comment
            |
                /\* # start with /*
                    (?:
                        [^*] # allow anything that is not a *
                    |
                        \*(?!/) # allow * if its not followed by /
                    )*
                \*/ # end with */
            )
        ///

        ###
        # matches for constructors
        # e.g.: `new Foobar`
        # 0: full match: `new Foobar`
        # 1: the `new` keyword: `new`
        # 1: the name of the constructor: `Foobar`
        ###
        constructor: ///
            \b(new)\s*([^\s\(])+\b
        ///

        regexp: ///
            /(?:\\.|[^/])+/
        ///

        number: ///
            \b\d(?:\.\d+)?\b # number either a digit or a decimal
        ///

        keywords: ///
            \b(case|break|continue|do|undefined|null|void|delete|tyepof|instanceof|with|for|while|var|function|throw|return|if|else|switch)\b # a bunch of reserved words for javascript
        ///

    cssSelectorRegexp = ///
        ([^{]+) #any selector
        (\{) #opening brackets
            ( #the content
                (?:
                    #{singleQuotePattern} # value within '-quotes
                    |
                    #{doubleQuotePattern} # value within "-quotes
                    |
                    (?:[^{}]|\\.)* #anything but a '- or "-quote or a closing bracket (this should
                    |
                    (?:\{(?:\\.|[^}])*\}) # value within '-quotes
                )*
            )
        (\}) #closing brackets

    ///g

    cssValueRegexp = ///
        (
            \s*
            [^:]+ # the key
            \s*
        )
        (:) # the colon
        ([^;\n]+) # the value
        (\n|;)? # the end
    ///g

    textAreaHelper = document.createElement('textarea')
    esc = (str)->
        textAreaHelper.innerHTML = str
        return textAreaHelper.innerHTML

    matchToSpan = (val, color)->
        "<span style='color:#{color}'>#{esc(val)}</span>"

    constructor: (options)->

    # ugly non performant way to highlight javascript
    # \o/
    renderJavascript: (js)->
        # we check step by step
        subJs = js
        searchPointer = 0

        # aaahhh im always afraid of endless loops :(
        loop
            index = null
            key = null

            for rkey, regex of javascriptRegexps
                ri = subJs.search regex
                if ri > -1 and (!index? or ri < index)
                    index = ri
                    key = rkey

            if !index?
                return js
            else
                match = subJs.match(javascriptRegexps[key])
                fullmatch = match[0]

                # add index to searchPointer offset
                searchPointer += index

                subJs = subJs.substring(fullmatch.length + index)

                renderedJsString = ""
                switch key
                    when "string"
                        renderedJsString = matchToSpan(match[0], 'Teal')
                    when "comment"
                        renderedJsString = matchToSpan(match[0], 'LightSteelBlue')
                    when "constructor"
                        renderedJsString = matchToSpan(match[0], 'Navy')
                    when "regexp"
                        renderedJsString = matchToSpan(match[0], 'LimeGreen')
                    when "number"
                        renderedJsString = matchToSpan(match[0], 'DodgerBlue')
                    when "keywords"
                        renderedJsString = matchToSpan(match[0], 'Purple')

                js = js.substr(0, searchPointer) +
                        renderedJsString +
                        js.substr(searchPointer + fullmatch.length)
                # set new searchPointer
                searchPointer += renderedJsString.length

    # ugly non performant way to highlight javascript
    # \o/
    renderCss: (css)->
        # we check step by step

        renderCssValueBlob = (valueBlob)->
            valueBlob.replace cssValueRegexp, (all, key, colon, value, end)->
                res = ""
                res += matchToSpan(key, '#999')
                res += matchToSpan(colon, 'blue')
                res += matchToSpan(value, 'green')
                res += matchToSpan(end, '#ababab') if end?
                return res

        renderCssBlob = (cssBlob)->
            cssBlob.replace cssSelectorRegexp, (all, selector, openingBracket, content, closingBracket)=>

                contentHtml = ""
                if selector.search(/\s*@/) is 0
                    console.log arguments
                    contentHtml += renderCssBlob(content)
                else if !/^\s*$/.test content
                    contentHtml = content.replace cssValueRegexp, (all, key, colon, value, end)->
                        res = ""
                        res += matchToSpan(key, '#999')
                        res += matchToSpan(colon, 'blue')
                        res += matchToSpan(value, 'green')
                        res += matchToSpan(end, '#ababab') if end?
                        return res
                else
                    contentHtml = content

                res = ""
                res += matchToSpan(selector, 'DarkRed')
                res += matchToSpan(openingBracket, 'black')
                res += contentHtml
                res += matchToSpan(closingBracket, 'black')

                return res

        return renderCssBlob(css)


    renderHtml: (str)->


        return str.replace tagsRegexp, (all, opening, tagname, attributes, ending, content)=>
            args = [].slice.call(arguments)
            if args[7]?
                args.splice(1,5)
            else if args[12]?
                args.splice(1,10)

            [all, opening, tagname, attributes, ending, content] = args

            attributeHtml = ""

            if attributes?
                attributeHtml = attributes.replace attributesRegexp, (attrib, name, equals, value)->
                    res = ""
                    res += matchToSpan(name, 'blue')
                    res += matchToSpan(equals, 'blue') if equals?
                    res += matchToSpan(value, 'red') if value?
                    return res

            res = ""
            res += matchToSpan(opening, 'green')
            res += matchToSpan(tagname, 'green')
            res += attributeHtml
            res += matchToSpan(ending, 'green')
            if tagname is 'script' and opening is '<'
                res += @renderJavascript(content)
            else if tagname is 'style' and opening is '<'
                res += @renderCss(content)
            else
                res += matchToSpan(content, 'gray')

            return res

