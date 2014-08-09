/*!
* simple-syntax - simple syntax highlighter for html documents (incl. inline css and javascript)
* v0.0.0 - 2014-08-09 12:24:46 PM UTC
* Copyright (c) 2014 timse; Licensed 
*/
 var SimpleSyntax;

SimpleSyntax = (function() {
  var attributesRegexp, doubleQuotePattern, esc, javascriptRegexps, matchToSpan, singleQuotePattern, tagsRegexp, textAreaHelper;

  singleQuotePattern = "(?:\"(?:\\\\.|[^\"])*\")";

  doubleQuotePattern = "(?:'(?:\\\\.|[^'])*')";


  /*
   * imagine the following html:
   * <sometag abc='asd' asd>hello world</sometag>
   * Tag match would match the following items of the above html with the following params:
   * - 0: the whole tag match plus the following content: `<sometag abc='asd' asd>hello world`
   * - 1: the opening tag plus its name: `<sometag`
   * - 2: the tag name: `sometag`
   * - 3: the attributes of the tag: ` abc='asd' asd`
   * - 4: the end tag: `>`
   * - 5: the content after the tag untill the next tag: `hello world`
   */

  tagsRegexp = /(<)(script)((?:\\.|[^>])*)?(\/?>)((?:[^<]|<(?!\/script))*)|(<)(style)((?:\\.|[^>])*)?(>)((?:[^<]|<(?!\/style))*)|(<\/?)([a-zA-Z0-9_-]+)((?:\\.|[^\/>]|\/(?!>))*)?(\/?>)([^<]*)/g;


  /*
   * imagine the following attribute string:
   * ` abc='asd' asd`
   * Attribute match would match the following items of the above string with the following params:
   * - 0: the whole attribute: `abc='asd'`
   * - 1: the attribute name: `abc`
   * - 2: the equal sign: `=`
   * - 3: the attribute value: `'asd'`
   */

  attributesRegexp = RegExp("([-A-Za-z0-9_]+)(?:(\\s*=\\s*)(" + singleQuotePattern + "|" + doubleQuotePattern + "|(?:[^\\s]+)))?", "g");

  javascriptRegexps = {
    string: RegExp("" + singleQuotePattern + "|" + doubleQuotePattern),
    comment: /(?:\/\/[^\n]+|\/\*(?:[^*]|\*(?!\/))*\*\/)/,

    /*
     * matches for constructors
     * e.g.: `new Foobar`
     * 0: full match: `new Foobar`
     * 1: the `new` keyword: `new`
     * 1: the name of the constructor: `Foobar`
     */
    constructor: /\b(new)\s*([^\s\(])+\b/,
    regexp: /\/(?:\\.|[^\/])+\//,
    number: /\d(?:\.\d+)?/,
    keywords: /\b(case|break|continue|do|undefined|null|void|delete|tyepof|instanceof|with|for|while|var|function|throw|return|if|else|switch)\b/
  };

  textAreaHelper = document.createElement('textarea');

  esc = function(str) {
    textAreaHelper.innerHTML = str;
    return textAreaHelper.innerHTML;
  };

  matchToSpan = function(val, color) {
    return "<span style='color:" + color + "'>" + (esc(val)) + "</span>";
  };

  function SimpleSyntax(options) {}

  SimpleSyntax.prototype.renderJavascript = function(js) {
    var fullmatch, index, key, match, regex, renderedJsString, ri, rkey, searchPointer, subJs;
    subJs = js;
    searchPointer = 0;
    while (true) {
      index = null;
      key = null;
      for (rkey in javascriptRegexps) {
        regex = javascriptRegexps[rkey];
        ri = subJs.search(regex);
        if (ri > -1 && ((index == null) || ri < index)) {
          index = ri;
          key = rkey;
        }
      }
      if (index == null) {
        return js;
      } else {
        match = subJs.match(javascriptRegexps[key]);
        fullmatch = match[0];
        searchPointer += index;
        subJs = subJs.substring(fullmatch.length + index);
        renderedJsString = "";
        switch (key) {
          case "string":
            renderedJsString = matchToSpan(match[0], 'Teal');
            break;
          case "comment":
            renderedJsString = matchToSpan(match[0], 'LightSteelBlue');
            break;
          case "constructor":
            renderedJsString = matchToSpan(match[0], 'Navy');
            break;
          case "regexp":
            renderedJsString = matchToSpan(match[0], 'LimeGreen');
            break;
          case "number":
            renderedJsString = matchToSpan(match[0], 'DodgerBlue');
            break;
          case "keywords":
            renderedJsString = matchToSpan(match[0], 'Purple');
        }
        js = js.substr(0, searchPointer) + renderedJsString + js.substr(searchPointer + fullmatch.length);
        searchPointer += renderedJsString.length;
      }
    }
  };

  SimpleSyntax.prototype.renderHtml = function(str) {
    return str.replace(tagsRegexp, (function(_this) {
      return function(all, opening, tagname, attributes, ending, content) {
        var args, attributeHtml, res;
        args = [].slice.call(arguments);
        if (args[7] != null) {
          args.splice(1, 5);
        } else if (args[12] != null) {
          args.splice(1, 10);
        }
        all = args[0], opening = args[1], tagname = args[2], attributes = args[3], ending = args[4], content = args[5];
        res = "";
        attributeHtml = "";
        if (attributes != null) {
          attributeHtml = attributes.replace(attributesRegexp, function(attrib, name, equals, value) {
            res = "";
            res += matchToSpan(name, 'blue');
            if (equals != null) {
              res += matchToSpan(equals, 'blue');
            }
            if (value != null) {
              res += matchToSpan(value, 'red');
            }
            return res;
          });
        }
        res += matchToSpan(opening, 'green');
        res += matchToSpan(tagname, 'green');
        res += attributeHtml;
        res += matchToSpan(ending, 'green');
        if (tagname === 'script' && opening === '<') {
          res += _this.renderJavascript(content);
        } else {
          res += matchToSpan(content, 'gray');
        }
        return res;
      };
    })(this));
  };

  return SimpleSyntax;

})();
