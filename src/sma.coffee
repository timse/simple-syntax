
    sma = (str)->
        #give all html tags a color
        tagsRegexp = ///
            (</?) # opening of a tag
            ([a-zA-Z0-9_-]+) # name of the tag
                ((?:[^/>]|/(?!>))*)? # attributes
            (/?>) # closing of a tag
            ([^<]*) #everything after the tag
        ///g

        attributesRegexp = ///
            ([-A-Za-z0-9_]+) # attribute name
            (?: # optional attribute value start
                (\s*=\s*) # the equal sign
                (
                    (?:"(?:\\.|[^"])*") # value within "-quotes
                    |
                    (?:'(?:\\.|[^'])*') # value within '-quotes
                    |
                    (?:[^\s]+) # value without quotes
                )
            )?
        ///g

        textAreaHelper = document.createElement('textarea')
        esc = (str)->
            textAreaHelper.innerHTML = str
            return textAreaHelper.innerHTML

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
        return str.replace tagsRegexp, (all, opening, tagname, attributes, ending, content)->

            attributeHtml = ""
            if attributes?
                ###
                # imagine the following attribute string:
                # ` abc='asd' asd`
                # Attribute match would match the following items of the above string with the following params:
                # - attrib: the whole attribute: `abc='asd'`
                # - name: the attribute name: `abc`
                # - equals: the equal sign: `=`
                # - value: the attribute value: `'asd'`
                ###
                attributeHtml = attributes.replace attributesRegexp, (attrib, name, equals, value)->
                    res = ""
                    res += "<span style='color:blue'>#{esc(name)}</span>"
                    res += "<span style='color:blue'>#{esc(equals)}</span>" if equals?
                    res += "<span style='color:red'>#{esc(value)}</span>" if value?
                    return res
            res = ""
            res += "<span style='color:green'>#{esc(opening)}</span>"
            res += "<span style='color:green'>#{esc(tagname)}</span>"
            res += attributeHtml
            res += "<span style='color:green'>#{esc(ending)}</span>"
            #res += "<span style='color:black'>#{esc(content)}</span>"
            res += content

            return res
            #return res.replace /\n/g, ->
            #    return "<br/>"


    document.write("<pre>" + sma("""

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"><html>
<head>
    <title>SPIEGEL ONLINE - Nachrichten</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="author" content="SPIEGEL ONLINE, Hamburg, Germany" />
<meta name="copyright" content="SPIEGEL ONLINE, Hamburg, Germany" />
<meta name="email" content="spiegel_online@spiegel.de" />
<meta name="MSSmartTagsPreventParsing" content="true" />
<meta http-equiv="imagetoolbar" content="no" />
<meta name="keywords" content="SPIEGEL ONLINE, DER SPIEGEL, Nachrichten, News, Home" />
<meta name="news_keywords" content="SPIEGEL ONLINE, DER SPIEGEL, Nachrichten, News, Home" />
<meta name="description" content="Deutschlands führende Nachrichtenseite. Alles Wichtige aus Politik, Wirtschaft, Sport, Kultur, Wissenschaft, Technik und mehr." /><meta name="verify-v1" content="2lPZiw22dOKqJU1fIWXbiUzm3T/qiHzJlBL+87ZOfF8=" />
    <meta name="msvalidate.01" content="0EE91CCF2745FAE5C53BFE9A010D3C79" />
    <meta property="fb:page_id" content="38246844868" />
    <meta property="twitter:account_id" content="2834511" />

    <link rel="alternate" type="application/rss+xml" title="SPIEGEL ONLINE RSS Schlagzeilen" href="http://www.spiegel.de/schlagzeilen/index.rss" />
<link rel="alternate" type="application/rss+xml" title="SPIEGEL ONLINE RSS Nachrichten" href="http://www.spiegel.de/index.rss" />
<script type="text/javascript">
    <!--
        var spMobilePlusUrl="/index.html";
        var spOldMobileUrl="/";
        var spSkipDelegation=true;
        // -->
    </script>
    <link rel="shortcut icon" href="/favicon.ico" type="image/ico" />
<link rel="apple-touch-icon" sizes="57x57"   href="/static/sys/v10/icons/touch-icon-iphone.png" />
<link rel="apple-touch-icon" sizes="72x72"   href="/static/sys/v10/icons/touch-icon72.png" />
<link rel="apple-touch-icon" sizes="76x76"   href="/static/sys/v10/icons/touch-icon76.png" />
<link rel="apple-touch-icon" sizes="114x114" href="/static/sys/v10/icons/touch-icon114.png" />
<link rel="apple-touch-icon" sizes="120x120" href="/static/sys/v10/icons/touch-icon120.png" />
<link rel="apple-touch-icon" sizes="144x144" href="/static/sys/v10/icons/touch-icon144.png" />
<link rel="apple-touch-icon" sizes="152x152" href="/static/sys/v10/icons/touch-icon152.png" />
<!-- ##SPONTAG: CSS## -->
        <link rel="stylesheet" type="text/css" href="/layout/css/style-V5-4-1.css" />
    <!--[if IE 7]>
    <link rel="stylesheet" type="text/css" href="/layout/css/ie7-V5-4-1.css" />
    <![endif]-->
    <!--[if IE 8]>
    <link rel="stylesheet" type="text/css" href="/layout/css/ie8-V5-4-1.css" />
    <![endif]-->
    <script src="/layout/jscfg/http/global-V5-4-1.js" type="text/javascript"></script>
        <script src="/layout/js/http/javascript-V5-4-1.js" type="text/javascript"></script>
        <script type="text/javascript" id="spIpadScript">
        if (spUA.isIPad()) {
            if ("https:" == window.location.protocol){
                document.write('<scr' + 'ipt src="/layout/js/https/ipad-V5-4-1.js" type="text/javascript"><\/scr' + 'ipt>');
            } else
                document.write('<scr' + 'ipt src="/layout/js/http/ipad-V5-4-1.js" type="text/javascript"><\/scr' + 'ipt>');
        }
        </script>
        <script src="/layout/js/http/interface-V5-4-1.js" type="text/javascript"></script>
    <script src="/layout/js/http/netmind-V5-4-1.js" type="text/javascript"></script>
        <script type="text/javascript" src="https://script.ioam.de/iam.js"></script>
    <!--[if lte IE 8]>
        <script src="/layout/js/http/respond_min-V5-4-1.js" type="text/javascript"></script>
    <![endif]-->
    <script type="text/javascript">


    $(document).ready(function(){
        $().hpColumnExpander().spAddColumnBox();
    });
    </script>
</head>

<body id="home" class="dt-www">
<iframe src="/static/sys/pixel.gif" name="spon_vdz_countframe" width="0" height="0" frameborder="0" style="display:none;"></iframe><div id="spSZM">
<!-- SZM VERSION="2.0" -->
<script type="text/javascript">
var iam_data = {
"st":"spiegel", // site/domain
"cp":"spon-www-18-0", // code
"sv":"ke"
}
iom.c(iam_data);
</script>
<!-- /SZM -->
<!-- SZM VERSION="1.3" -->
<script type="text/javascript">
<!--
var IVW="http://spiegel.ivwbox.de/cgi-bin/ivw/CP/1001;/home/c-18/be-PB64-aG9tZXBhZ2UvY2VudGVy/szwprofil-1001";
document.write('<img src="'+IVW+'?r='+escape(document.referrer)+'&d='+(Math.random()*100000)+'" width="1" height="1" border="0" align="right" id="spIvwPixel" alt="" />');
// -->
</script>
<noscript>
<img src="http://spiegel.ivwbox.de/cgi-bin/ivw/CP/1001;/home/c-18/be-PB64-aG9tZXBhZ2UvY2VudGVy/szwprofil-1001?d=89669923" width="1" height="1" border="0" align="right" id="spIvwPixel" alt="" />
</noscript>
<!-- /SZM -->
</div>

<div style="position:absolute;top: -100px;left: 0px;">
<script type="text/javascript">
<!--
spNm({
    'sp.site': '1',
    'sp.atyp': '1000',
    'sp.szw': '1001',
    'sp.aid': '18',
    'sp.channel': '18',
    'sp.be': 'homepage/center'
});
// -->
</script>
<noscript>
    <img src="https://count.spiegel.de/nm_trck.gif?sp.site=9999" width="1" height="1" border="0" align="right" alt="" />
</noscript>
</div>
<script type="text/javascript">
<!--
OAS_url = 'http://adserv.quality-channel.de/RealMedia/ads/';
OAS_listpos = 'Bottom,Bottom1,Bottom2,Bottom3,Left,Middle,Middle1,Middle2,Middle3,Middle4,Position1,Position2,Right,Right1,Right2,Right3,Right4,Right5,RightAut,RightEin,RightGes,RightKar,RightKul,RightNet,RightPan,RightPol,RightRei,RightSpa,RightSpo,RightUni,RightWir,RightWis,Spezial,Sub1,Sub2,Top1,Top2,TopRight,VMiddle2,VMiddle,VRight,x01,x02,x03,x04,x05,x06,x07,x08,x09,x10,x11,x12,x20,x21,x22,x23,x70';
OAS_allposlist  = 'Bottom,Bottom1,Bottom2,Bottom3,Left,Middle,Middle1,Middle2,Middle3,Middle4,Position1,Position2,Right,Right1,Right2,Right3,Right4,Right5,RightAut,RightEin,RightGes,RightKar,RightKul,RightNet,RightPan,RightPol,RightRei,RightSpa,RightSpo,RightUni,RightWir,RightWis,Spezial,Sub1,Sub2,Top1,Top2,TopRight,VMiddle2,VMiddle,VRight,x01,x02,x03,x04,x05,x06,x07,x08,x09,x10,x11,x12,x20,x21,x22,x23,x70';
OAS_query = '';
OAS_sitepage = 'www.spiegel.de/homepage/center';
OAS_rn = '001234567890'; OAS_rns = '1234567890';
OAS_rn = new String (Math.random()); OAS_rns = OAS_rn.substring (2, 11);
OAS_ce_restricted = false;

var spHashParams=spGetHashParams();
if (spHashParams["oas.belegung"] != null) {
    OAS_belegung = spHashParams["oas.belegung"];
    OAS_sitepage = (OAS_belegung.indexOf('.') == -1 ? 'www.spiegel.de/' : '') + spHashParams["oas.belegung"];
}

OAS_mjxscripturl = OAS_url + 'adstream_mjx.ads/' + OAS_sitepage + '/1' + OAS_rns + '@' + OAS_listpos + OAS_query;
var dsabl_sad_hp,dsabl_sad;
try {
    dsabl_sad_hp=sp_webcfg_global.dsabl_sad_hp;
    dsabl_sad=sp_webcfg_global.dsabl_sad;
}
catch (e) {}
var isHp=true;
var sw_dsabl_sad=(isHp && dsabl_sad_hp == true) || (!isHp && dsabl_sad == true);
function OAS_RICH(pos) {
    if (pos != '_' && !sw_dsabl_sad) {
        document.write('<a href="' + OAS_url + 'click_nx.ads/' + OAS_sitepage + '/1' + OAS_rns + '@' + OAS_listpos + '!' + pos + OAS_query + '" target="_blank" ><img src="' + OAS_url + 'adstream_nx.ads/' + OAS_sitepage + '/1' + OAS_rns + '@' + OAS_listpos + '!' + pos + OAS_query + '" border="0" alt=""><\/a>');
    }
    return 'NX';
}


    if (navigator.userAgent.indexOf('Mozilla/3') == -1 && !sw_dsabl_sad) {
        document.write('<scr' + 'ipt type="text/javascript" language="JavaScript1.1" src="' + OAS_mjxscripturl + '"><\/scr' + 'ipt' + '>');
    }


//-->
</script>
 <div id="spOasTop">
<script type="text/javascript">
<!--
    OAS_RICH('Top1');
// -->
</script><br class="clearfix" />

<div style="position:absolute;top:-100px;left:0px;">
    <script type="text/javascript">
    <!--
        OAS_RICH('Middle');
    // -->
    </script>
</div>
<br class="clearfix" />
</div><div id="wrapper">
    <div id="wrapper-shadow">
        <div id="wrapper-content" class="inline-pic-credit">

            <div id="header" class="spCenterpage">

                <div class="header-top">

            <div class="nav-main">

                <ul>
                    <li>
                                <a href="/">Home</a></li>
                            <li>
                                <a href="/video/">Video</a></li>
                            <li>
                                <a href="/thema/index-a.html">Themen</a></li>
                            <li>
                                <a href="/forum/">Forum</a></li>
                            <li>
                                <a href="/international/">English</a></li>
                            <li>
                                <a href="/spiegel/">DER SPIEGEL</a></li>
                            <li>
                                <a href="/sptv/">SPIEGEL TV</a></li>
                            <li>
                                <a href="http://abo.spiegel.de/?b=SPOHNAVABO&amp;utm_source=spon&amp;utm_medium=text&amp;utm_content=SPOHNAVABO&amp;utm_campaign=navigationsleiste">Abo</a></li>
                            <li>
                                <a href="/shop/">Shop</a></li>
                            </ul>

            </div> <div class="nav-service">
                <ul>
                    <li><a href="/schlagzeilen/">Schlagzeilen</a></li>
                            <li><a href="http://wetter.spiegel.de/spiegel/"><img src="/static/sys/v10/icons/ic_sonne.png" width="18" height="18" alt="Wetter" />Wetter</a></li>
                            <li><a href="http://tvprogramm.spiegel.de/">TV-Programm</a></li>
                            <li><a class="link-more" href="javascript:return false;">mehr &#9660;</a>
                                <ul class="nav-service-sub">
                                    <li><a href="/dienste/a-637773.html">Hilfe</a></li>
                                    <li><a href="/dienste/a-634260.html">RSS</a></li>
                                    <li><a href="/dienste/a-902432.html">Newsletter</a></li>
                                    <li><a href="/dienste/a-634549.html">Mobil</a></li>
                                </ul>
                            </li>
                        </ul>
            </div> </div> <div class="header-main">

            <a href="/" class="header-logo"><img src="/static/sys/v10/logo/spiegel_online_logo_460_64.png" alt="SPIEGEL ONLINE" title="SPIEGEL ONLINE" width="230" height="32" /></a>
                    <h1 class="channel-name">SPIEGEL ONLINE</h1>
                            <div class="header-search">

                                <form action="/suche/index.html" method="get" name="suchform" class="search-form-single">

                                        <input name="suchbegriff" type="text" />
                                        <input class="search-form-submit" type="submit" value="Suche starten" />

                                    </form>

                                </div> <ul class="login-links">
                    <noscript><li><a href="/meinspiegel/">Mein SPIEGEL</a></li></noscript>
                </ul>
                <script type="text/javascript">
                    <!--
                        spUpdateMSLoginLinks();
                    // -->
                </script>
            </div> <div class="nav-channel" lang="de">

            <ul class="clearfix">

                        <li class="channel-politik-border-bottom">
                                        <a href="/politik/" class="nav-channel-name ">Politik</a><div class="auto-width nav-channel-sub">

                                                <ul style="z-index:1000001;"><li>
                <a href="/politik/deutschland/"><span class="nav-channel-sub-entry">Deutschland</span></a></li>

        <li>
                <a href="/politik/ausland/"><span class="nav-channel-sub-entry">Ausland</span></a></li>

        <li>
                <a href="http://www.spiegel.de/thema/meinung/" target="_self" title="" class="spNaviLevel2Last"><span class="nav-channel-sub-entry">Meinung</span></a></li>

        </ul>
                                                </div>

                                        </li>

                                <li class="channel-wirtschaft-border-bottom">
                                        <a href="/wirtschaft/" class="nav-channel-name ">Wirtschaft</a><div class="auto-width nav-channel-sub">

                                                <ul style="z-index:1000001;"><li>
                <a href="http://boersen.manager-magazin.de/spon/" target="_blank" title="" class=""><span class="nav-channel-sub-entry">Börse</span></a></li>

        <li>
                <a href="/wirtschaft/service/"><span class="nav-channel-sub-entry">Verbraucher & Service</span></a></li>

        <li>
                <a href="/wirtschaft/service/versicherung-check-fuer-haftpflicht-hausrat-berufsunfaehigkeit-a-960380.html" title="" class=""><span class="nav-channel-sub-entry">Versicherungen</span></a></li>

        <li>
                <a href="/wirtschaft/unternehmen/"><span class="nav-channel-sub-entry">Unternehmen & Märkte</span></a></li>

        <li>
                <a href="/wirtschaft/soziales/"><span class="nav-channel-sub-entry">Staat & Soziales</span></a></li>

        <li class="spDivideNaviAd">
<div>
<div></div>
</div>
</li>
<li>
<a href="http://adserv.quality-channel.de/5c/www.spiegel.de/partner/987654/x21/qc/ON52X5997XCLICK/zaehler.gif/1456789012" rel="nofollow" title="Anzeige">Jobsuche</a>
</li>
<li>
<a href="http://adserv.quality-channel.de/5c/www.spiegel.de/partner/987654/x21/qc/ON52X5993XCLICK/zaehler.gif/1456789012" rel="nofollow" title="Anzeige">Immowelt</a>
</li>
<li>
<a href="http://adserv.quality-channel.de/5c/www.spiegel.de/partner/987654/x21/qc/ON09X20161XNAVIREITER/zaehler.gif/1352749516" rel="nofollow" title="Anzeige">Tarifvergleiche</a>
</li>
<li>
<a href="http://adserv.quality-channel.de/5c/www.spiegel.de/partner/987654/x21/qc/ON16X20239XNAVI/zaehler.gif/98745289" rel="nofollow" title="Anzeige">Kreditvergleich</a>
</li></ul>
                                                </div>

                                        </li>

                                <li class="channel-panorama-border-bottom">
                                        <a href="/panorama/" class="nav-channel-name ">Panorama</a><div class="auto-width nav-channel-sub">

                                                <ul style="z-index:1000001;"><li>
                <a href="/panorama/justiz/"><span class="nav-channel-sub-entry">Justiz</span></a></li>

        <li>
                <a href="/panorama/leute/"><span class="nav-channel-sub-entry">Leute</span></a></li>

        <li>
                <a href="/panorama/gesellschaft/"><span class="nav-channel-sub-entry">Gesellschaft</span></a></li>

        <li class="spDivideNaviAd">
<div>
<div></div>
</div>
</li>
<li>
<a href="http://adserv.quality-channel.de/5c/www.spiegel.de/partner/987654/x21/qc/ON52X5958XCLICK/zaehler.gif/1456789012" title="Anzeige">Partnersuche</a>
</li>
<li>
<a href="http://lotto.spiegel.de/">LOTTO 6aus49</a>
</li>
<li>
<a href="http://adserv.quality-channel.de/5c/www.spiegel.de/partner/987654/x21/qc/ON47XWESTLOTTOX1CLICK/zaehler.gif/1456789012" title="Anzeige">Eurojackpot</a>
</li></ul>
                                                </div>

                                        </li>

                                <li class="channel-sport-border-bottom">
                                        <a href="/sport/" class="nav-channel-name ">Sport</a><div class="auto-width nav-channel-sub">

                                                <ul style="z-index:1000001;"><li>
                <a href="/sport/fussball/fussball-live-1-bundesliga-liveticker-spielplan-statistik-a-842988.html" title="" class=""><span class="nav-channel-sub-entry">Fußball-Liveticker</span></a></li>

        <li>
                <a href="/sport/fussball/"><span class="nav-channel-sub-entry">Fußball-News</span></a></li>

        <li>
                <a href="/sport/fussball/fussball-live-die-champions-league-im-liveticker-a-851014.html" title="" class=""><span class="nav-channel-sub-entry">Champions League</span></a></li>

        <li>
                <a href="http://tippspiel.spiegel.de" target="_self" title="" class=""><span class="nav-channel-sub-entry">Fußball-Tippspiel</span></a></li>

        <li>
                <a href="/sport/sonst/liveticker-teams-und-wertungen-der-tour-de-france-2014-a-901485.html" title="" class=""><span class="nav-channel-sub-entry">Tour de France</span></a></li>

        <li>
                <a href="/sport/formel1/"><span class="nav-channel-sub-entry">Formel 1</span></a></li>

        <li>
                <a href="/sport/formel1/formel-1-liveticker-a-958409.html" title="" class=""><span class="nav-channel-sub-entry">Formel-1-Liveticker</span></a></li>

        <li>
                <a href="http://sportal.spiegel.de/spiegel/ergebnisse/" target="_self" title="" class=""><span class="nav-channel-sub-entry">Ergebnisse</span></a></li>

        <li>
                <a href="http://sportal.spiegel.de/spiegel/liveticker/" target="_self" title="" class="spNaviLevel2Last"><span class="nav-channel-sub-entry">Live-Kalender</span></a></li>

        </ul>
                                                </div>

                                        </li>

                                <li class="channel-kultur-border-bottom">
                                        <a href="/kultur/" class="nav-channel-name ">Kultur</a><div class="auto-width nav-channel-sub">

                                                <ul style="z-index:1000001;"><li>
                <a href="/kultur/kino/"><span class="nav-channel-sub-entry">Kino</span></a></li>

        <li>
                <a href="/kultur/musik/"><span class="nav-channel-sub-entry">Musik</span></a></li>

        <li>
                <a href="/kultur/tv/"><span class="nav-channel-sub-entry">TV</span></a></li>

        <li>
                <a href="http://www.spiegel.de/thema/tageskarte" target="_self" title="" class=""><span class="nav-channel-sub-entry">KulturSPIEGEL</span></a></li>

        <li>
                <a href="/kultur/literatur/"><span class="nav-channel-sub-entry">Literatur</span></a></li>

        <li>
                <a href="http://gutenberg.spiegel.de" target="_self" title="" class=""><span class="nav-channel-sub-entry">Gutenberg</span></a></li>

        <li>
                <a href="/kultur/uebersicht-bestseller-a-458623.html" title="" class="spNaviLevel2Last"><span class="nav-channel-sub-entry">Bestseller</span></a></li>

        </ul>
                                                </div>

                                        </li>

                                <li class="channel-netzwelt-border-bottom">
                                        <a href="/netzwelt/" class="nav-channel-name ">Netzwelt</a><div class="auto-width nav-channel-sub">

                                                <ul style="z-index:1000001;"><li>
                <a href="/netzwelt/netzpolitik/"><span class="nav-channel-sub-entry">Netzpolitik</span></a></li>

        <li>
                <a href="/netzwelt/web/"><span class="nav-channel-sub-entry">Web</span></a></li>

        <li>
                <a href="/netzwelt/gadgets/"><span class="nav-channel-sub-entry">Gadgets</span></a></li>

        <li>
                <a href="/netzwelt/games/"><span class="nav-channel-sub-entry">Games</span></a></li>

        <li>
                <a href="/netzwelt/apps/"><span class="nav-channel-sub-entry">Apps</span></a></li>

        </ul>
                                                </div>

                                        </li>

                                <li class="channel-wissenschaft-border-bottom">
                                        <a href="/wissenschaft/" class="nav-channel-name ">Wissenschaft</a><div class="auto-width nav-channel-sub">

                                                <ul style="z-index:1000001;"><li>
                <a href="/wissenschaft/mensch/"><span class="nav-channel-sub-entry">Mensch</span></a></li>

        <li>
                <a href="/wissenschaft/natur/"><span class="nav-channel-sub-entry">Natur</span></a></li>

        <li>
                <a href="/wissenschaft/technik/"><span class="nav-channel-sub-entry">Technik</span></a></li>

        <li>
                <a href="/wissenschaft/weltall/"><span class="nav-channel-sub-entry">Weltall</span></a></li>

        <li>
                <a href="/wissenschaft/medizin/"><span class="nav-channel-sub-entry">Medizin</span></a></li>

        </ul>
                                                </div>

                                        </li>

                                <li class="channel-gesundheit-border-bottom">
                                        <a href="/gesundheit/" class="nav-channel-name ">Gesundheit</a><div class="auto-width nav-channel-sub">

                                                <ul style="z-index:1000001;"><li>
                <a href="/gesundheit/diagnose/"><span class="nav-channel-sub-entry">Diagnose & Therapie</span></a></li>

        <li>
                <a href="/gesundheit/ernaehrung/"><span class="nav-channel-sub-entry">Ernährung & Fitness</span></a></li>

        <li>
                <a href="/gesundheit/psychologie/"><span class="nav-channel-sub-entry">Psychologie</span></a></li>

        <li>
                <a href="/gesundheit/sex/"><span class="nav-channel-sub-entry">Sex & Partnerschaft</span></a></li>

        <li>
                <a href="/gesundheit/schwangerschaft/"><span class="nav-channel-sub-entry">Schwangerschaft & Kind</span></a></li>

        <li><a title="" href="/gesundheit/ernaehrung/bmi-rechner-so-ermitteln-sie-ihren-body-mass-index-a-824673.html">BMI-Rechner</a></li>
<li><a title="" href="/gesundheit/ernaehrung/kalorienrechner-so-ermitteln-sie-ihren-optimalen-kalorienverbrauch-a-832713.html">Kalorienrechner</a></li>
<li><a title="Anzeige" href="http://adserv.quality-channel.de/5c/www.spiegel.de/partner/584796/x21/qc/ON22X20319XNAVILINK/zaehler.gif/1456789012">Hörgeräte</a></li></ul>
                                                </div>

                                        </li>

                                <li class="channel-einestages-border-bottom">
                                        <a href="/einestages/" class="nav-channel-name ">einestages</a><div class="auto-width nav-channel-sub">

                                                <ul style="z-index:1000001;"><li>
                <a href="http://forum.spiegel.de/forumdisplay.php?f=27 " target="_self" title="" class=""><span class="nav-channel-sub-entry">Fundbüro</span></a></li>

        <li>
                <a href="/einestages/thema/zeitzeugen/" target="_self" title="" class=""><span class="nav-channel-sub-entry">Zeitzeugen</span></a></li>

        <li>
                <a href="/einestages/thema/erster_weltkrieg/" target="_self" title="" class=""><span class="nav-channel-sub-entry">Erster Weltkrieg</span></a></li>

        <li>
                <a href="http://www.spiegel.de/einestages/thema/zweiter_weltkrieg/" target="_self" title="" class=""><span class="nav-channel-sub-entry">Zweiter Weltkrieg</span></a></li>

        <li>
                <a href="http://www.spiegel.de/einestages/thema/ddr/" target="_self" title="" class=""><span class="nav-channel-sub-entry">DDR</span></a></li>

        <li>
                <a href="http://www.spiegel.de/einestages/thema/fotografie/" target="_self" title="" class=""><span class="nav-channel-sub-entry">Fotografie</span></a></li>

        <li>
                <a href="http://www.spiegel.de/einestages/thema/film/" target="_self" title="" class=""><span class="nav-channel-sub-entry">Film</span></a></li>

        <li>
                <a href="http://www.spiegel.de/einestages/thema/musik/ " target="_self" title="" class=""><span class="nav-channel-sub-entry">Musik</span></a></li>

        <li>
                <a href="http://www.spiegel.de/einestages/archiv.html" target="_self" title="" class="spNaviLevel2Last"><span class="nav-channel-sub-entry">Archiv</span></a></li>

        </ul>
                                                </div>

                                        </li>

                                <li class="channel-karriere-border-bottom">
                                        <a href="/karriere/" class="nav-channel-name ">Karriere</a><div class="auto-width nav-channel-sub">

                                                <ul style="z-index:1000001;"><li>
                <a href="/karriere/berufsstart/"><span class="nav-channel-sub-entry">Berufsstart</span></a></li>

        <li>
                <a href="/karriere/berufsleben/"><span class="nav-channel-sub-entry">Berufsleben</span></a></li>

        <li>
                <a href="/karriere/ausland/"><span class="nav-channel-sub-entry">Ausland</span></a></li>

        <li>
                <a href="http://stellensuche.karriere.spiegel.de/" target="_self" title="" class="spNaviLevel2Last"><span class="nav-channel-sub-entry">Stellensuche</span></a></li>

        </ul>
                                                </div>

                                        </li>

                                <li class="channel-unispiegel-border-bottom">
                                        <a href="/unispiegel/" class="nav-channel-name ">Uni</a><div class="auto-width nav-channel-sub">

                                                <ul style="z-index:1000001;"><li>
                <a href="/unispiegel/studium/"><span class="nav-channel-sub-entry">Studium</span></a></li>

        <li>
                <a href="/unispiegel/jobundberuf/"><span class="nav-channel-sub-entry">Job & Beruf</span></a></li>

        <li>
                <a href="/unispiegel/wunderbar/"><span class="nav-channel-sub-entry">WunderBAR</span></a></li>

        </ul>
                                                </div>

                                        </li>

                                <li class="channel-schulspiegel-border-bottom">
                                        <a href="/schulspiegel/" class="nav-channel-name ">Schule</a><div class="auto-width nav-channel-sub">

                                                <ul style="z-index:1000001;"><li>
                <a href="/schulspiegel/abi/"><span class="nav-channel-sub-entry">Abi - und dann?</span></a></li>

        <li>
                <a href="/schulspiegel/ausland/"><span class="nav-channel-sub-entry">Querweltein</span></a></li>

        <li>
                <a href="/schulspiegel/leben/"><span class="nav-channel-sub-entry">Leben U21</span></a></li>

        <li>
                <a href="/schulspiegel/wissen/"><span class="nav-channel-sub-entry">Wissen</span></a></li>

        </ul>
                                                </div>

                                        </li>

                                <li class="channel-reise-border-bottom">
                                        <a href="/reise/" class="nav-channel-name ">Reise</a><div class="auto-width nav-channel-sub">

                                                <ul style="z-index:1000001;"><li>
                <a href="/reise/karte/"><span class="nav-channel-sub-entry">Weltkarte</span></a></li>

        <li>
                <a href="/reise/staedte/"><span class="nav-channel-sub-entry">Städtereisen</span></a></li>

        <li>
                <a href="/reise/deutschland/"><span class="nav-channel-sub-entry">Deutschland</span></a></li>

        <li>
                <a href="/reise/europa/"><span class="nav-channel-sub-entry">Europa</span></a></li>

        <li>
                <a href="/reise/fernweh/"><span class="nav-channel-sub-entry">Fernweh</span></a></li>

        </ul>
                                                </div>

                                        </li>

                                <li class="channel-auto-border-bottom">
                                        <a href="/auto/" class="nav-channel-name ">Auto</a><div class="auto-width nav-channel-sub">

                                                <ul style="z-index:1000001;"><li>
                <a href="/auto/fahrberichte/"><span class="nav-channel-sub-entry">Tests</span></a></li>

        <li>
                <a href="/auto/fahrkultur/"><span class="nav-channel-sub-entry">Fahrkultur</span></a></li>

        <li class="spDivideNaviAd">
<div>
<div></div>
</div>
</li>
<li>
<a href="http://adserv.quality-channel.de/5c/www.spiegel.de/partner/987654/x21/qc/ON05X20025XNAVILINK/zaehler.gif/1456789012" rel="nofollow" title="Anzeige">Neu-/Gebraucht-Fahrzeuge</a>
</li></ul>
                                                </div>

                                        </li>

                                <script type="text/javascript">
                            <!--
                                OAS_RICH('Sub2');
                            // -->
                        </script>
                    </ul>


            </div> <div id="js-popup-layer" class="clearfix"></div>

<div id="breadcrumb">

    <span class="date">
                7. August 2014</span>
        <div class="nav-toptopics">
<h2 class="toptopics-title">Themen:</h2>
<ul>
<li>
<a href="/thema/edward_snowden/">Edward Snowden</a> |</li>
<li>
<a href="/thema/irak/">Irak</a> |</li>
<li>
<a href="/oscar_pistorius/">Oscar Pistorius</a> |</li>
<li>
<a href="/thema/donezk/">Donezk</a> |</li>
<li>
<a href="/thema/ebola/">Ebola</a> |</li>
<li>
<a href="/thema/gaza_konflikt_2014/">Gaza-Krieg</a>
</li>
</ul>
</div><div class="nav-extra">
        <div class="breadcrumb-social">
                    <span>Folgen:</span>
                    <a target="_blank" href="http://www.facebook.com/spiegelonline" title="Facebook"><img src="/static/sys/v10/icons/facebook_14.png" width="14" height="14" alt="Facebook" /></a>
                    <a target="_blank" href="https://twitter.com/intent/follow?screen_name=SPIEGELONLINE" title="Twitter"><img src="/static/sys/v10/icons/twitter_14.png" width="14" height="14" alt="Twitter" /></a>
                    <a target="_blank" href="https://plus.google.com/106419678219919655169/posts" title="Google+"><img src="/static/sys/v10/icons/googleplus_14.png" width="14" height="14" alt="Google+" /></a>
                </div>
            </div> </div> <br class="clearfix" /></div> <div id="content-main" class="grid-homepage spSmallScreen clearfix">

                <script type="text/javascript">
                <!--
                    OAS_RICH('Top2');
                // -->
                </script>
                <br class="clearfix" />

                <div class="top-poster">
                    <div class="top-poster-ai">
                        <div class="closer"></div>
                    </div>

                    <div class="top-poster-startpage">
                        <div class="top-poster-startpage-content clearfix">
                            <div class="closer" onclick="topPosterOff();" title="Schlie&szlig;en und nicht wieder zeigen"></div>
                            <a class="top-poster-startpage-content-startpage" href="/artikel/a-861010.html">SPIEGEL ONLINE zur Startseite machen</a>
                            <a class="top-poster-startpage-content-notifier" href="/artikel/a-937596.html">Bei neuen Top-Meldungen benachrichtigen</a>
                        </div>
                    </div>
                    <div class="top-poster-redirect">
                        <div id="top-poster-redirect-content">
                            <a href='http://m.spiegel.de/#spRedirectedFrom=www' onclick='javascript:spMobileRedirect();return false'> Hier geht es zur Mobil-Version &#9654;</a>
                        </div>
                    </div>
                </div>
                <script type="text/javascript">
                    <!--
                    topPosterInit(spGetHashParams());
                    $(".top-poster-ai .closer").click(function(){$('.top-poster, .top-poster-ai').hide();topPosterInit();});
                    // -->
                </script>

                <div class="teaser hp-first-article pano_xxl clearfix">
                        <h2 class="article-title">
    <a href="/politik/ausland/gaza-krieg-hamas-chef-maschaal-verliert-kontrolle-ueber-kassam-brigade-a-984952.html" title="Islamisten in Gaza: Hamas-Führung entgleitet die Kontrolle"><span class="headline-intro">Islamisten in Gaza</span> <span class="headline">Hamas-Führung entgleitet die Kontrolle</span></a></h2>


<div class="article-image-box box-position breitwandaufmacher asset-align-center">
        <div class="image-buttons-panel clearfix">
                    <a href="/politik/ausland/gaza-krieg-hamas-chef-maschaal-verliert-kontrolle-ueber-kassam-brigade-a-984952.html" title="Islamisten in Gaza: Hamas-Führung entgleitet die Kontrolle"><img src="http://cdn3.spiegel.de/images/image-734116-breitwandaufmacher-hflr.jpg" width="860" height="320" border="0" title="Islamisten in Gaza: Hamas-Führung entgleitet die Kontrolle" alt="Islamisten in Gaza: Hamas-Führung entgleitet die Kontrolle" /></a><span class="image-buttons">
                        <a href="/fotostrecke/hamas-fuehrer-in-doha-glitzerpalaeste-und-voellige-zerstoerung-fotostrecke-117753.html" title="Hamas-Führer in Doha: Glitzerpaläste und völlige Zerstörung"><img src="/static/sys/v10/buttons/but_foto_2_big.png"    alt="Fotos" class="btn-photo-text-large" /></a></span>
                </div>
            </div><p class="article-intro clearfix">
            Die Exilführung der Hamas verliert offenbar die Kontrolle über ihre Kämpfer in Gaza. Während des Waffengangs mit Israel haben die Kassam-Brigaden wohl mehrfach Befehle von Politbürochef Maschaal ignoriert.  <span class="author">Aus Tel Aviv berichtet Christoph Sydow</span> <a href="/politik/ausland/gaza-krieg-hamas-chef-maschaal-verliert-kontrolle-ueber-kassam-brigade-a-984952.html" title="Islamisten in Gaza: Hamas-Führung entgleitet die Kontrolle" class="more-link">mehr...</a> </p>
    <ul class="article-list">
        <li>
                    <a href="/politik/ausland/gaza-israels-aussenminister-fordert-deutsche-inspektoren-a-984861.html" title=" Nahost-Konflikt:   Israel fordert deutsche Inspektoren in Gaza "><span class="asset-headline-intro">Nahost-Konflikt:</span> <span class="asset-headline">Israel fordert deutsche Inspektoren in Gaza</span></a></li>
            <li>
                    <a href="/politik/ausland/gaza-krieg-israelis-fuerchten-trotz-waffenruhe-angriffe-der-hamas-a-984775.html" title=" Israel im Waffenstillstand:   Die Panzer weichen, die Angst bleibt "><span class="asset-headline-intro">Israel im Waffenstillstand:</span> <span class="asset-headline">Die Panzer weichen, die Angst bleibt</span></a></li>
            </ul>
    </div>
                    <div class="hp-teasers-box clearfix">
    <div class="column-small pano_xxl" id="js-column-dynamic"><script type="text/javascript">
<!--
 OAS_RICH('Right1');
// -->
</script><div class="asset-box video-asset">
        <div class="asset-title"><a href="/video/">VIDEO</a></div>

        <div class="js-module-box-image box-position asset-align-center" style="width: 230px">
                <a href="/video/youtube-video-lastwagen-in-pakistan-ist-hit-im-netz-video-1513210.html" onclick="return spOpenVideo(this,'1513210')" title="Gib' Gummi, Brummi!" class="image-buttons-panel"><img src="http://cdn4.spiegel.de/images/image-734017-hpcolumnright-npls.jpg" width="230" height="129" />
                    <span class="image-buttons">
                        <img src="/static/sys/v10/buttons/but_video_2.png" alt="Video abspielen..." />
                    </span>
                </a><div class="asset-credit">YouTube/moment news</div>
                </div>
        <ul class="hp-video-news-list">
            <li>
                    <a href="/video/youtube-video-lastwagen-in-pakistan-ist-hit-im-netz-video-1513210.html" onclick="return spOpenVideo(this,'1513210')" title="Gib' Gummi, Brummi!"><span class="asset-headline-intro">Gewusst wie:</span> <span class="asset-headline">Gib' Gummi, Brummi!</span></a></li>
            <li>
                    <a href="/video/fallschirmsprung-von-segelflugzeug-in-polen-video-1512963.html" onclick="return spOpenVideo(this,'1512963')" title="Fallschirmsprung mit Extra-Nervenkitzel"><span class="asset-headline-intro">Tragfläche als Sprungbrett:</span> <span class="asset-headline">Fallschirmsprung mit Extra-Nervenkitzel</span></a></li>
            </ul>
        <div class="link-right"><a href="/video/">alle Videos</a></div>
    </div><div class="asset-box asset-list-box clearfix">
            <div class="asset-title"><a href="http://www.spiegel.tv/" target="_blank" title="SPIEGEL.TV">SPIEGEL.TV</a></div><ul class="list-flashvideo clearfix"><li><div class="video-pic image-buttons-panel article-image-box box-position" style="width: 230px; margin-bottom:5px;">
                <a href="http://www.spiegel.tv/filme/vermietungsverbot-ferienwohnungen-rerik/" target="_blank"><img src="http://cdn1.spiegel.de/images/image-733728-hpcolumnright-jhrp.jpg" width="230" height="134" border="0" title="" alt="" style="float: none;" /><span class="image-buttons"><img src="/static/sys/v10/buttons/but_video_2.png"       alt="Video" class="btn-video-text" /></span></a><div style="width:230px;" class="asset-credit">SPIEGEL TV</div></div>

        <a href="http://www.spiegel.tv/filme/vermietungsverbot-ferienwohnungen-rerik/" target="_blank" title="Ruiniert durch Richterspruch? Ferienwohnungs-Verbot an der Ostsee"><span class="asset-headline-intro">Ruiniert durch Richterspruch?</span> <span class="asset-headline">Ferienwohnungs-Verbot an der Ostsee</span></a></li>
        </ul>
            </div>
    <div class="column-hidden" id="js-column-dynamic-content" style="top:-5000px; left:-5000px;">
                    <div class="asset-box asset-list-box clearfix">
            <ul class="list-flashvideo clearfix"><li><div class="video-pic image-buttons-panel article-image-box box-position" style="width: 230px; margin-bottom:5px;">
                <a href="http://www.spiegel.tv/filme/ausbildung-zum-flugbegleiter-3/" target="_blank"><img src="http://cdn1.spiegel.de/images/image-733730-hpcolumnright-iurb.jpg" width="230" height="134" border="0" title="" alt="" style="float: none;" /><span class="image-buttons"><img src="/static/sys/v10/buttons/but_video_2.png"       alt="Video" class="btn-video-text" /></span></a><div style="width:230px;" class="asset-credit">SPIEGEL TV</div></div>

        <a href="http://www.spiegel.tv/filme/ausbildung-zum-flugbegleiter-3/" target="_blank" title="Ballermann-Training für Flugbegleiter: Es wird laut und fröhlich!"><span class="asset-headline-intro">Ballermann-Training für Flugbegleiter:</span> <span class="asset-headline">"Es wird laut und fröhlich!"</span></a></li>
        </ul>
            </div>
    <div class="asset-box asset-list-box clearfix">
            <div class="asset-title">Wahl-O-Mat</div><ul class="list-ilink clearfix"><li><div class="article-image-box box-position" style="width: 230px; margin-bottom:5px;">
                <a href="/politik/deutschland/wahl-o-mat-sachsen-2014-wen-sie-wirklich-waehlen-wollen-a-984383.html" title=" Wen Sie in Sachsen wirklich wählen wollen "><img src="http://cdn2.spiegel.de/images/image-732065-hpcolumnright-mocm.jpg" width="230" height="134" border="0" title="" alt="" style="float: none;" /></a></div>

        <a href="/politik/deutschland/wahl-o-mat-sachsen-2014-wen-sie-wirklich-waehlen-wollen-a-984383.html" title=" Wen Sie in Sachsen wirklich wählen wollen "><span class="asset-headline-intro">Wen Sie in Sachsen wirklich wählen wollen</span></a></li>
        </ul>
            </div>
    <div class="asset-box asset-tab-box">
    <div class="asset-title">Top</div>

    <div class="tabs">

        <ul class="clearfix list-float multi-box-tabs">
            <li class="list-float-left"><a href="/fragments/hitlist/hitlist-read.json">Gelesen</a></li>
            <li class="list-float-left"><a href="#tabs-2">Verschickt</a></li>
            <li class="list-float-left"><a href="/fragments/hitlist/hitlist-video.json">Gesehen</a></li>
        </ul>
        <div id="tabs-2">
            <ul class="numbered-list">
    <li>
                <div class="item-number">1</div>
                <div class="item-text">
                    <a href="/gesundheit/diagnose/alzheimer-vitamin-d-mangel-koennte-demenzrisiko-erhoehen-a-984548.html" title="Neue US-Studie: Vitamin D könnte Demenzrisiko reduzieren"><span class="asset-headline-intro">Neue US-Studie:</span><span class="asset-headline"> Vitamin D könnte Demenzrisiko reduzieren</span></a></div>
            </li>
            <li>
                <div class="item-number">2</div>
                <div class="item-text">
                    <a href="/panorama/ottolenghis-rezept-zaalouk-mit-schnittlauch-a-982578.html" title="Ottolenghis Rezept: Zaalouk gibt's nie genug"><span class="asset-headline-intro">Ottolenghis Rezept:</span><span class="asset-headline"> Zaalouk gibt's nie genug</span></a></div>
            </li>
            <li>
                <div class="item-number">3</div>
                <div class="item-text">
                    <a href="/gesundheit/diagnose/psa-test-screening-weniger-prostatakrebs-tote-viele-ueberdiagnosen-a-984605.html" title="Prostatakrebs-Screening: Vorsorge mit schweren Nebenwirkungen"><span class="asset-headline-intro">Prostatakrebs-Screening:</span><span class="asset-headline"> Vorsorge mit schweren Nebenwirkungen</span></a></div>
            </li>
            <li class="is-hidden">
                <div class="item-number">4</div>
                <div class="item-text">
                    <a href="/gesundheit/diagnose/aspirin-zur-krebsvorsorge-forscher-befuerworten-acetylsalicylsaeure-a-984727.html" title="Studienüberblick: Forscher befürworten Aspirin zur Krebsvorsorge"><span class="asset-headline-intro">Studienüberblick:</span><span class="asset-headline"> Forscher befürworten Aspirin zur Krebsvorsorge</span></a></div>
            </li>
            <li class="is-hidden">
                <div class="item-number">5</div>
                <div class="item-text">
                    <a href="/wirtschaft/soziales/sovaldi-warum-eine-pille-700-euro-kosten-darf-a-984738.html" title="700-Euro-Pille von Sovaldi: &quot;Unmoralische Gewinnzahlen&quot;"><span class="asset-headline-intro">700-Euro-Pille von Sovaldi:</span><span class="asset-headline"> "Unmoralische Gewinnzahlen"</span></a></div>
            </li>
            <li class="is-hidden">
                <div class="item-number">6</div>
                <div class="item-text">
                    <a href="/netzwelt/web/tipps-zum-passwortwechsel-reaktion-auf-die-hold-security-meldung-a-984669.html" title="1,2 Milliarden Login-Daten geklaut: Vier Regeln, wie sich Schaden abwenden lässt"><span class="asset-headline-intro">1,2 Milliarden Login-Daten geklaut:</span><span class="asset-headline"> Vier Regeln, wie sich Schaden abwenden lässt</span></a></div>
            </li>
            <li class="is-hidden">
                <div class="item-number">7</div>
                <div class="item-text">
                    <a href="/spam/spam-cartoon-mario-lars-ebola-a-984882.html" title="Humor für Leute mit Humor"><span class="asset-headline-intro">SATIRE@SPIEGEL ONLINE:</span><span class="asset-headline"> Humor für Leute mit Humor</span></a></div>
            </li>
            <li class="is-hidden">
                <div class="item-number">8</div>
                <div class="item-text">
                    <a href="/panorama/trennung-von-staat-und-kirche-ein-plaedoyer-a-984850.html" title="Glaube und Moral: Plädoyer für eine Trennung von Staat und Kirche"><span class="asset-headline-intro">Glaube und Moral:</span><span class="asset-headline"> Plädoyer für eine Trennung von Staat und Kirche</span></a></div>
            </li>
            <li class="is-hidden">
                <div class="item-number">9</div>
                <div class="item-text">
                    <a href="/einestages/lost-place-fotograf-sven-fennema-tales-of-yesteryear-a-982072.html" title="Fotografie-Schätze von Sven Fennema: Die Schönheit der vergessenen Orte"><span class="asset-headline-intro">Fotografie-Schätze von Sven Fennema:</span><span class="asset-headline"> Die Schönheit der vergessenen Orte</span></a></div>
            </li>
            <li class="is-hidden">
                <div class="item-number">10</div>
                <div class="item-text">
                    <a href="/international/world/interview-with-sociologist-eva-illouz-about-gaza-and-israeli-society-a-984536.html" title="Gaza Crisis: 'The Real Danger to Israel Comes from Within'"><span class="asset-headline-intro">Gaza Crisis:</span><span class="asset-headline"> 'The Real Danger to Israel Comes from Within'</span></a></div>
            </li>
            </ul>
</div>
        <div class="load-icon"><img src="/static/sys/v10/icons/ani-loader_small.gif" alt="loading..." /></div>

    </div> </div><div class="asset-box video-asset">
        <div class="asset-title"><a href="/video/">KICKER TV</a></div>

        <div class="js-module-box-image box-position asset-align-center" style="width: 230px">
                <a href="/video/fc-bayern-muenchen-rummenigge-will-klub-zur-weltmarke-aufbauen-video-1513227.html" onclick="return spOpenVideo(this,'1513227')" title="Rekordmeister Bayern im Globalisierungsprozess" class="image-buttons-panel"><img src="http://cdn2.spiegel.de/images/image-734135-hpcolumnright-vmsu.jpg" width="230" height="129" />
                    <span class="image-buttons">
                        <img src="/static/sys/v10/buttons/but_video_2.png" alt="Video abspielen..." />
                    </span>
                </a><div class="asset-credit">Imago</div>
                </div>
        <ul class="hp-video-news-list">
            <li>
                    <a href="/video/fc-bayern-muenchen-rummenigge-will-klub-zur-weltmarke-aufbauen-video-1513227.html" onclick="return spOpenVideo(this,'1513227')" title="Rekordmeister Bayern im Globalisierungsprozess"><span class="asset-headline-intro">Auf dem Weg zur Weltmarke:</span> <span class="asset-headline">Rekordmeister Bayern im Globalisierungsprozess</span></a></li>
            <li>
                    <a href="/video/schweinsteiger-verletzung-am-knoechel-nicht-so-schwer-video-1513193.html" onclick="return spOpenVideo(this,'1513193')" title="Ich habe Glück gehabt"><span class="asset-headline-intro">Entwarnung bei Schweinsteiger:</span> <span class="asset-headline">"Ich habe Glück gehabt"</span></a></li>
            <li>
                    <a href="/video/wm-2014-julian-draxler-fuehlt-sich-als-weltmeister-video-1512975.html" onclick="return spOpenVideo(this,'1512975')" title="Die BVB-Kollegen werden dennoch keine Kumpel"><span class="asset-headline-intro">Weltmeister Draxler:</span> <span class="asset-headline">Die BVB-Kollegen werden dennoch keine Kumpel</span></a></li>
            </ul>
        <div class="link-right"><a href="/video/">alle Videos</a></div>
    </div><div class="asset-box asset-list-box clearfix">
            <div class="asset-title">Überblick</div><ul class="list-ilink clearfix"><li><a href="http://www.spiegel.de/schlagzeilen/tops/index.html" target="_self" title=" Die Nachrichten der letzten 24 Stunden "><span class="asset-headline-intro">Die Nachrichten der letzten 24 Stunden</span></a></li>
        </ul>
            </div>
    <script type="text/javascript">
                            <!--
                            OAS_RICH('x21');
                            // -->
                            </script><br class="clearfix" />
                        <div class="asset-box asset-list-box clearfix">
            <div class="asset-title">Film-Doku</div><ul class="list-flashvideo clearfix"><li><div class="video-pic image-buttons-panel article-image-box box-position" style="width: 230px; margin-bottom:5px;">
                <a href="http://www.spiegel.tv/filme/wdr-die-story-vorsicht-mafia/" target="_blank"><img src="http://cdn2.spiegel.de/images/image-733499-hpcolumnright-zegs.jpg" width="230" height="134" border="0" title="" alt="" style="float: none;" /><span class="image-buttons"><img src="/static/sys/v10/buttons/but_video_2.png"       alt="Video" class="btn-video-text" /></span></a><div style="width:230px;" class="asset-credit">WDR</div></div>

        <a href="http://www.spiegel.tv/filme/wdr-die-story-vorsicht-mafia/" target="_blank" title=" Wie die Mafia Deutschland erobert "><span class="asset-headline-intro">Wie die Mafia Deutschland erobert</span></a></li>
        </ul>
            </div>
    <div class="asset-box asset-list-box clearfix">
            <div class="asset-title"><a href="http://www.spiegel.de/international/" target="_self" title="English Site">English Site</a></div><ul class="list-ilink clearfix"><li><div class="article-image-box box-position" style="width: 230px; margin-bottom:5px;">
                <a href="/international/europe/more-popular-than-ever-way-of-st-james-still-offers-enlightenment-a-983670.html" title=" Pilgrims Inc.:   Soul Searching and Commerce on the Way of St. James "><img src="http://cdn4.spiegel.de/images/image-731137-hpcolumnright-yqth.jpg" width="230" height="134" border="0" title="" alt="" style="float: none;" /></a><div style="width:230px;" class="asset-credit">Maria Feck/DER SPIEGEL</div></div>

        <a href="/international/europe/more-popular-than-ever-way-of-st-james-still-offers-enlightenment-a-983670.html" title=" Pilgrims Inc.:   Soul Searching and Commerce on the Way of St. James "><span class="asset-headline-intro">Pilgrims Inc.:</span> <span class="asset-headline">Soul Searching and Commerce on the Way of St. James</span></a></li>
        <li><a href="/international/world/erdogan-set-to-cement-power-by-winning-presidential-election-a-984581.html" title=" One-Man State:   Presidential Election Set to Seal Erdogan's Supremacy "><span class="asset-headline-intro">One-Man State:</span> <span class="asset-headline">Presidential Election Set to Seal Erdogan's Supremacy</span></a></li>
        <li><a href="/international/germany/turks-in-germany-allowed-to-vote-for-first-time-a-984624.html" title=" For Erdogan, or Against Him:   Turks in Germany Get the Vote "><span class="asset-headline-intro">For Erdogan, or Against Him:</span> <span class="asset-headline">Turks in Germany Get the Vote</span></a></li>
        </ul>
            </div>
    <script type="text/javascript">
<!--
 OAS_RICH('Right2');
// -->
</script><div class="asset-box asset-list-box clearfix">
            <div class="asset-title">Wiederentdeckt</div><ul class="list-ilink clearfix"><li><div class="article-image-box box-position" style="width: 230px; margin-bottom:5px;">
                <a href="/einestages/30-jahre-anti-oscars-praedikat-besonders-wertlos-a-947079.html" title=" Anti-Oscar:   Prädikat Besonders wertlos "><img src="http://cdn1.spiegel.de/images/image-629730-hpcolumnright-qjpn.jpg" width="230" height="134" border="0" title="" alt="" style="float: none;" /></a><div style="width:230px;" class="asset-credit">ddp images</div></div>

        <a href="/einestages/30-jahre-anti-oscars-praedikat-besonders-wertlos-a-947079.html" title=" Anti-Oscar:   Prädikat Besonders wertlos "><span class="asset-headline-intro">Anti-Oscar:</span> <span class="asset-headline">Prädikat "Besonders wertlos"</span></a></li>
        </ul>
            </div>
    <div class="asset-box asset-list-box clearfix">
            <div class="asset-title">Transfers von WM-Stars</div><ul class="list-ilink clearfix"><li><div class="article-image-box box-position" style="width: 230px; margin-bottom:5px;">
                <a href="/sport/fussball/fussball-transfer-wechsel-von-wm-stars-wie-toni-kroos-und-luis-suarez-a-984602.html" title=" Den müssen wir haben! "><img src="http://cdn2.spiegel.de/images/image-733669-hpcolumnright-clem.jpg" width="230" height="134" border="0" title="" alt="" style="float: none;" /></a><div style="width:230px;" class="asset-credit">DPA</div></div>

        <a href="/sport/fussball/fussball-transfer-wechsel-von-wm-stars-wie-toni-kroos-und-luis-suarez-a-984602.html" title=" Den müssen wir haben! "><span class="asset-headline-intro">Den müssen wir haben!</span></a></li>
        </ul>
            </div>
    <div class="asset-box asset-list-box clearfix">
            <div class="asset-title">Fotografie-Schätze</div><ul class="list-ilink clearfix"><li><div class="article-image-box box-position" style="width: 230px; margin-bottom:5px;">
                <a href="/einestages/lost-place-fotograf-sven-fennema-tales-of-yesteryear-a-982072.html" title=" Die Schönheit der vergessenen Orte "><img src="http://cdn4.spiegel.de/images/image-726663-hpcolumnright-mgst.jpg" width="230" height="134" border="0" title="" alt="" style="float: none;" /></a><div style="width:230px;" class="asset-credit">Sven Fennema</div></div>

        <a href="/einestages/lost-place-fotograf-sven-fennema-tales-of-yesteryear-a-982072.html" title=" Die Schönheit der vergessenen Orte "><span class="asset-headline-intro">Die Schönheit der vergessenen Orte</span></a></li>
        </ul>
            </div>
    <div class="asset-box asset-list-box clearfix">
            <div class="asset-title">Lehrergeständnisse</div><ul class="list-ilink clearfix"><li><div class="article-image-box box-position" style="width: 230px; margin-bottom:5px;">
                <a href="/unispiegel/jobundberuf/lehrergestaendnisse-ueber-die-angst-schueler-in-der-freizeit-zu-treffen-a-981015.html" title=" Ich fürchte mich vor meinen Schülern "><img src="http://cdn3.spiegel.de/images/image-212622-hpcolumnright-edla.jpg" width="230" height="134" border="0" title="" alt="" style="float: none;" /></a><div style="width:230px;" class="asset-credit">Corbis</div></div>

        <a href="/unispiegel/jobundberuf/lehrergestaendnisse-ueber-die-angst-schueler-in-der-freizeit-zu-treffen-a-981015.html" title=" Ich fürchte mich vor meinen Schülern "><span class="asset-headline-intro">Ich fürchte mich vor meinen Schülern</span></a></li>
        </ul>
            </div>
    <div class="asset-box asset-list-box asset-list-box-picnavi clearfix">
            <div class="asset-title">Anzeige</div><ul class="list-listboxtext clearfix"><li><div class="column-box-pic asset-align-left box-position" style="width: 120px;">
                <img src="http://cdn4.spiegel.de/images/image-733183-hpcpleftcolumn-rzqz.jpg" width="120" height="161" border="0" title="" alt="" style="border:0 !important;" /></div>

        Özlem Gezer:<br/>
<b>Türkei</b>
<p>Der Aufstand gegen Erdogan.</p>
<p>SPIEGEL E-Book; 2,69 Euro.</p></li>
                    <li><div class="column-box-pic asset-align-left box-position" style="width: 120px;">
                <a href="http://www.amazon.de/dp/B00M3Y2DWE/ref=nosim?tag=wwwspiegelde-21" target="_blank" title=" Einfach und bequem:   Bei Amazon kaufen. "><img src="http://cdn1.spiegel.de/images/image-427120-hpcpleftcolumn-ujki.jpg" width="120" height="23" border="0" title="" alt="" style="border:0 !important;" /></a></div>

        <a href="http://www.amazon.de/dp/B00M3Y2DWE/ref=nosim?tag=wwwspiegelde-21" target="_blank" title=" Einfach und bequem:   Bei Amazon kaufen. "><span class="asset-headline-intro">Einfach und bequem:</span> <span class="asset-headline">Bei Amazon kaufen.</span></a></li>
        </ul>
            </div>
    <div class="asset-box asset-list-box clearfix">
            <ul class="list-listboxtext clearfix"><li><div class="column-box-pic asset-align-left box-position" style="width: 120px;">
                <img src="http://cdn2.spiegel.de/images/image-726125-hpcpleftcolumn-xdom.jpg" width="120" height="184" border="0" title="" alt="" style="border:0 !important;" /></div>

        <p class="spTextSmaller">Anzeige</p>

<p><b>Nur für kurze Zeit: Die digitale Ausgabe zum Kennenlernpreis</b></p>

SPIEGEL JOB digital für <a href="https://magazin.spiegel.de/digital/#SPJO/2014/1" target="_blank"><b>Ihren Browser am PC</b></a> oder mobil als App für:
<br /><br />
<a href="https://itunes.apple.com/de/app/der-spiegel/id368711345?mt=8" target="_blank"><b>Apple</b></a> |
<a href="https://play.google.com/store/apps/details?id=de.spiegel.ereader" target="_blank"><b>Android</b></a> |
<a href="http://apps.microsoft.com/windows/de-de/app/400ffa0d-b71e-4a19-8df2-17b6da2d326c" target="_blank"><b>Windows</b></a> |
<a href="http://amzn.to/1oYfkt1" target="_blank"><b>Amazon</b></a> |
<a href="http://appworld.blackberry.com/webstore/content/115015/?lang=de" target="_blank"><b>BlackBerry</b></a></li>
                    </ul>
            </div>
    </div>
            </div>

    <div class="column-wide pano_xxl" id="js-column-dynamic-ref"><div class="teaser">
                        <div class="article-image-box box-position thumb asset-align-left">
        <a href="/wirtschaft/unternehmen/importverbot-in-russland-eu-veraergert-deutsche-exporteure-besorgt-a-984964.html" title="Gespräche mit Weißrussland und Kasachstan: Putin sucht Verbündete für seinen Lebensmittel-Boykott"><img src="http://cdn2.spiegel.de/images/image-734121-thumb-jamw.jpg" width="180" height="180" border="0" title="Gespräche mit Weißrussland und Kasachstan: Putin sucht Verbündete für seinen Lebensmittel-Boykott" alt="Gespräche mit Weißrussland und Kasachstan: Putin sucht Verbündete für seinen Lebensmittel-Boykott" /></a></div><h2 class="article-title">
    <a href="/wirtschaft/unternehmen/importverbot-in-russland-eu-veraergert-deutsche-exporteure-besorgt-a-984964.html" title="Gespräche mit Weißrussland und Kasachstan: Putin sucht Verbündete für seinen Lebensmittel-Boykott"><span class="headline-intro">Gespräche mit Weißrussland und Kasachstan</span> <span class="headline">Putin sucht Verbündete für seinen Lebensmittel-Boykott</span></a></h2><p class="article-intro clearfix">
            Russland versucht seinen Boykott westlicher Lebensmittel mit weiteren Ländern abzustimmen. Moskau will verhindern, dass Waren über Weißrussland oder Kasachstan importiert werden. Die EU zeigt sich verärgert. <a href="/wirtschaft/unternehmen/importverbot-in-russland-eu-veraergert-deutsche-exporteure-besorgt-a-984964.html" title="Gespräche mit Weißrussland und Kasachstan: Putin sucht Verbündete für seinen Lebensmittel-Boykott" class="more-link">mehr...</a> <span class="spInteractionMarks video-forum-bracket">[&nbsp;<a href="http://forum.spiegel.de/showthread.php?t=133741">Forum</a>&nbsp;]</span></p>
    <ul class="article-list">
        <li>
                    <a href="/wirtschaft/soziales/russland-veroeffentlicht-liste-zu-import-verbot-aus-eu-und-usa-a-984924.html" title=" Putins Gegensanktionen:   Kreml verbietet Einfuhr von Fleisch, Milch, Obst aus dem Westen "><span class="asset-headline-intro">Putins Gegensanktionen:</span> <span class="asset-headline">Kreml verbietet Einfuhr von Fleisch, Milch, Obst aus dem Westen</span></a></li>
            <li>
                    <a href="/wirtschaft/soziales/russland-gegen-usa-und-europa-brasilien-will-nach-importverbot-helfen-a-984867.html" title=" Handelskrieg mit Westen:   Brasilien will Russland mit Geflügel aushelfen "><span class="asset-headline-intro">Handelskrieg mit Westen:</span> <span class="asset-headline">Brasilien will Russland mit Geflügel aushelfen</span></a></li>
            <li>
                    <a href="/wirtschaft/soziales/vergeltung-fuer-sanktionen-putins-schadet-russlands-wirtschaft-a-984847.html" title=" Vergeltung für Sanktionen:   Putin bestraft das eigene Volk "><span class="asset-headline-intro">Vergeltung für Sanktionen:</span> <span class="asset-headline">Putin bestraft das eigene Volk</span></a></li>
            </ul>
    </div>
                <div class="teaser">
                        <h2 class="article-title">
    <a href="/politik/ausland/wladimir-putin-und-die-ukraine-krise-kolumne-von-jakob-augstein-a-984900.html" title="Streit um Russland-Politik: Kriegstreiber oder Weicheier?"><span class="headline-intro">Streit um Russland-Politik</span> <span class="headline">Kriegstreiber oder Weicheier?</span></a></h2><p class="article-intro clearfix">
            Der Streit über Putin spaltet Deutschland. Aber anstatt uns gegenseitig als Kriegstreiber oder Weicheier zu beschimpfen, sollten wir uns fragen: Was funktioniert im Konflikt mit Russland? Und was nicht? <span class="author">Eine Kolumne von Jakob Augstein</span> <a href="/politik/ausland/wladimir-putin-und-die-ukraine-krise-kolumne-von-jakob-augstein-a-984900.html" title="Streit um Russland-Politik: Kriegstreiber oder Weicheier?" class="more-link">mehr...</a> <span class="spInteractionMarks video-forum-bracket">[&nbsp;<a href="http://forum.spiegel.de/showthread.php?t=133731">Forum</a>&nbsp;]</span></p>
    </div>
                <div class="teaser">
                        <div class="article-image-box box-position thumb asset-align-left">
        <a href="/politik/deutschland/afd-in-sachsen-frauke-petry-will-einzug-in-den-landtag-a-984920.html" title="Radtour mit der AfD in Sachsen: Viel Deutschland, wenig Alternativen"><img src="http://cdn3.spiegel.de/images/image-733816-thumb-iqdt.jpg" width="180" height="180" border="0" title="Radtour mit der AfD in Sachsen: Viel Deutschland, wenig Alternativen" alt="Radtour mit der AfD in Sachsen: Viel Deutschland, wenig Alternativen" /></a></div><h2 class="article-title">
    <a href="/politik/deutschland/afd-in-sachsen-frauke-petry-will-einzug-in-den-landtag-a-984920.html" title="Radtour mit der AfD in Sachsen: Viel Deutschland, wenig Alternativen"><span class="headline-intro">Radtour mit der AfD in Sachsen</span> <span class="headline">Viel Deutschland, wenig Alternativen</span></a></h2><p class="article-intro clearfix">
            In Sachsen will die Alternative für Deutschland erstmals in einen Landtag einziehen - und eine neue Rolle im Osten spielen. Wird sie die neue FDP - oder eine NPD light? Eine Radtour mit der AfD-Spitzenkandidatin Frauke Petry. <span class="author">Aus Dresden berichtet Fabian Reinbold</span> <a href="/politik/deutschland/afd-in-sachsen-frauke-petry-will-einzug-in-den-landtag-a-984920.html" title="Radtour mit der AfD in Sachsen: Viel Deutschland, wenig Alternativen" class="more-link">mehr...</a> <span class="spInteractionMarks video-forum-bracket">[&nbsp;<a href="http://forum.spiegel.de/showthread.php?t=133737">Forum</a>&nbsp;]</span></p>
    <ul class="article-list">
        <li>
                    <a href="/fotostrecke/afd-in-sachsen-radtour-fuer-den-einzug-in-den-landtag-fotostrecke-117739.html" title=" Fotostrecke:   Stimmenfang an der Elbe "><span class="asset-headline-intro">Fotostrecke:</span> <span class="asset-headline">Stimmenfang an der Elbe</span></a></li>
            </ul>
    </div>
                <div class="teaser">
                        <h2 class="article-title">
    <a href="/politik/deutschland/buechel-islamist-ruft-zu-anschlaegen-auf-atomwaffenlager-auf-a-984975.html" title="Extremismus: Deutscher Islamist ruft zu Anschlägen auf Atomwaffenlager auf"><span class="headline-intro">Extremismus</span> <span class="headline">Deutscher Islamist ruft zu Anschlägen auf Atomwaffenlager auf</span></a></h2><p class="article-intro clearfix">
            Eine neue Terrorbotschaft aus Syrien alarmiert die Behörden: Ein Salafist aus Deutschland ruft im Internet dazu auf, ein Atomwaffenlager in Rheinland-Pfalz anzugreifen. Auch der US-Stützpunkt Ramstein wird als Ziel genannt. <span class="author">Von Jörg Diehl, Düsseldorf</span> <a href="/politik/deutschland/buechel-islamist-ruft-zu-anschlaegen-auf-atomwaffenlager-auf-a-984975.html" title="Extremismus: Deutscher Islamist ruft zu Anschlägen auf Atomwaffenlager auf" class="more-link">mehr...</a> </p>
    </div>
                <div class="teaser">
                        <h2 class="article-title">
    <a href="/politik/deutschland/herford-angriff-auf-jesiden-loest-polizei-grosseinsatz-aus-a-984931.html" title="Nordrhein-Westfalen: Angriff auf Jesiden - Polizei-Großeinsatz in Herford"><span class="headline-intro">Nordrhein-Westfalen</span> <span class="headline">Angriff auf Jesiden - Polizei-Großeinsatz in Herford</span></a></h2><div class="article-image-box box-position hppano asset-align-center">
        <div class="image-buttons-panel clearfix">
                    <a href="/politik/deutschland/herford-angriff-auf-jesiden-loest-polizei-grosseinsatz-aus-a-984931.html" title="Nordrhein-Westfalen: Angriff auf Jesiden - Polizei-Großeinsatz in Herford"><img src="http://cdn3.spiegel.de/images/image-733942-hppano-hftk.jpg" width="610" height="293" border="0" title="Nordrhein-Westfalen: Angriff auf Jesiden - Polizei-Großeinsatz in Herford" alt="Nordrhein-Westfalen: Angriff auf Jesiden - Polizei-Großeinsatz in Herford" /></a><span class="image-buttons">
                        </span>
                </div>
            </div><p class="article-intro clearfix">
            Die Polizei musste mit Hundertschaften eingreifen: Im westfälischen Herford sind Jesiden und Sympathisanten der Terrorgruppe "Islamischer Staat" mit Holzlatten, Steinen und Flaschen aufeinander losgegangen. Es gab mehrere Verletzte. <a href="/politik/deutschland/herford-angriff-auf-jesiden-loest-polizei-grosseinsatz-aus-a-984931.html" title="Nordrhein-Westfalen: Angriff auf Jesiden - Polizei-Großeinsatz in Herford" class="more-link">mehr...</a> <span class="spInteractionMarks video-forum-bracket">[&nbsp;<a href="/video/terrormiliz-is-zehntausende-kurden-auf-der-flucht-video-1513083.html" onclick="return spOpenVideo(this,'1513083')" title="Zehntausende Kurden auf der Flucht">Video</a>&nbsp;]</span></p>
    <ul class="article-list">
        <li>
                    <a href="/politik/ausland/islamischer-staat-im-irak-lage-der-jesiden-wird-immer-bedrohlicher-a-984873.html" title=" Terrormiliz IS im Irak:   Zehntausende Jesiden im Gebirge eingeschlossen "><span class="asset-headline-intro">Terrormiliz IS im Irak:</span> <span class="asset-headline">Zehntausende Jesiden im Gebirge eingeschlossen</span></a></li>
            </ul>
    </div>
                <div class="teaser">
                        <div class="article-image-box box-position thumb asset-align-left">
        <a href="/panorama/justiz/oscar-pistorius-staatsanwalt-nel-bezichtigt-sprint-star-der-luege-a-984954.html" title="Mordprozess: Staatsanwalt wirft Oscar Pistorius &quot;viele Lügen&quot; vor"><img src="http://cdn4.spiegel.de/images/image-734007-thumb-lgca.jpg" width="180" height="180" border="0" title="Mordprozess: Staatsanwalt wirft Oscar Pistorius &quot;viele Lügen&quot; vor" alt="Mordprozess: Staatsanwalt wirft Oscar Pistorius &quot;viele Lügen&quot; vor" /></a></div><h2 class="article-title">
    <a href="/panorama/justiz/oscar-pistorius-staatsanwalt-nel-bezichtigt-sprint-star-der-luege-a-984954.html" title="Mordprozess: Staatsanwalt wirft Oscar Pistorius &quot;viele Lügen&quot; vor"><span class="headline-intro">Mordprozess</span> <span class="headline">Staatsanwalt wirft Oscar Pistorius "viele Lügen" vor</span></a></h2><p class="article-intro clearfix">
            Eine Lüge habe zur nächsten geführt, zum Schluss habe er nicht mehr aus dem Konstrukt herausgekonnt: In seinem Schlussplädoyer hat Staatsanwalt Gerrie Nel den wegen Mordes angeklagten Oscar Pistorius scharf angegriffen. <a href="/panorama/justiz/oscar-pistorius-staatsanwalt-nel-bezichtigt-sprint-star-der-luege-a-984954.html" title="Mordprozess: Staatsanwalt wirft Oscar Pistorius &quot;viele Lügen&quot; vor" class="more-link">mehr...</a> <span class="spInteractionMarks video-forum-bracket">[&nbsp;<a href="http://forum.spiegel.de/showthread.php?t=133730">Forum</a>&nbsp;]</span></p>
    <ul class="article-list">
        <li>
                    <a href="/fotostrecke/oscar-pistorius-staatsanwalt-nel-bezichtigt-sprint-star-der-luege-fotostrecke-117749.html" title=" Fotostrecke:   Die Lügen des Oscar Pistorius "><span class="asset-headline-intro">Fotostrecke:</span> <span class="asset-headline">Die Lügen des Oscar Pistorius</span></a></li>
            <li>
                    <a href="/panorama/justiz/oscar-pistorius-staatsanwalt-gerrie-nel-haelt-schlussplaedoyer-a-984891.html" title=" Plädoyer der Staatsanwaltschaft:   &quot;Pistorius hat seine Version zusammengeschustert&quot; "><span class="asset-headline-intro">Plädoyer der Staatsanwaltschaft:</span> <span class="asset-headline">"Pistorius hat seine Version zusammengeschustert"</span></a></li>
            </ul>
    </div>
                <div class="teaser">
                        <h2 class="article-title">
    <a href="/gesundheit/diagnose/alzheimer-vitamin-d-mangel-koennte-demenzrisiko-erhoehen-a-984548.html" title="Neue US-Studie: Vitamin D könnte Demenzrisiko reduzieren"><span class="headline-intro">Neue US-Studie</span> <span class="headline">Vitamin D könnte Demenzrisiko reduzieren</span></a></h2><p class="article-intro clearfix">
            Je weniger Vitamin D ältere Menschen im Blut haben, desto häufiger erkranken sie an einer Demenz: Diesen Zusammenhang zeigt eine aktuelle Studie aus den USA. In Deutschland sind etwa 60 Prozent vom Mangel betroffen. <span class="author">Von Irene Berres</span> <a href="/gesundheit/diagnose/alzheimer-vitamin-d-mangel-koennte-demenzrisiko-erhoehen-a-984548.html" title="Neue US-Studie: Vitamin D könnte Demenzrisiko reduzieren" class="more-link">mehr...</a> <span class="spInteractionMarks video-forum-bracket">[&nbsp;<a href="http://forum.spiegel.de/showthread.php?t=133722">Forum</a>&nbsp;]</span></p>
    </div>
                <div class="teaser">
                        <div class="article-image-box box-position thumb asset-align-left">
        <a href="/karriere/berufsleben/neustart-nach-burnout-krankenschwester-wird-reisebloggerin-a-984408.html" title="Kinderkrankenschwester steigt aus: &quot;Einmal habe ich für mich entschieden&quot;"><img src="http://cdn3.spiegel.de/images/image-730292-thumb-sfly.jpg" width="180" height="180" border="0" title="Kinderkrankenschwester steigt aus: &quot;Einmal habe ich für mich entschieden&quot;" alt="Kinderkrankenschwester steigt aus: &quot;Einmal habe ich für mich entschieden&quot;" /></a></div><h2 class="article-title">
    <a href="/karriere/berufsleben/neustart-nach-burnout-krankenschwester-wird-reisebloggerin-a-984408.html" title="Kinderkrankenschwester steigt aus: &quot;Einmal habe ich für mich entschieden&quot;"><span class="headline-intro">Kinderkrankenschwester steigt aus</span> <span class="headline">"Einmal habe ich für mich entschieden"</span></a></h2><p class="article-intro clearfix">
            Für Familien krebskranker Kinder ist das Krankenhaus der Lebensmittelpunkt - und die Krankenschwester die engste Vertraute. <i>Carina Herrmann</i>, 33, hielt das irgendwann nicht mehr aus. Sie kündigte und verschenkte alles. Bis auf ihren Rucksack.  <a href="/karriere/berufsleben/neustart-nach-burnout-krankenschwester-wird-reisebloggerin-a-984408.html" title="Kinderkrankenschwester steigt aus: &quot;Einmal habe ich für mich entschieden&quot;" class="more-link">mehr...</a> <span class="spInteractionMarks video-forum-bracket">[&nbsp;<a href="http://forum.spiegel.de/showthread.php?t=133721">Forum</a>&nbsp;]</span></p>
    <ul class="article-list">
        <li>
                    <a href="/karriere/berufsleben/geld-verdienen-im-internet-blogger-berichten-von-ihren-erfahrungen-a-983265.html" title=" Geld verdienen im Internet:   &quot;Das ist ja ein Vollzeitjob!&quot; "><span class="asset-headline-intro">Geld verdienen im Internet:</span> <span class="asset-headline">"Das ist ja ein Vollzeitjob!"</span></a></li>
            </ul>
    </div>
                <div class="teaser">
                        <div class="article-image-box box-position thumb asset-align-left">
        <a href="/sport/fussball/fussball-wm-der-frauen-spielerinnen-drohen-fifa-mit-klage-a-984966.html" title="Fußball-WM auf Kunstrasen: Star-Spielerinnen drohen Fifa mit Klage"><img src="http://cdn4.spiegel.de/images/image-734063-thumb-wely.jpg" width="180" height="180" border="0" title="Fußball-WM auf Kunstrasen: Star-Spielerinnen drohen Fifa mit Klage" alt="Fußball-WM auf Kunstrasen: Star-Spielerinnen drohen Fifa mit Klage" /></a></div><h2 class="article-title">
    <a href="/sport/fussball/fussball-wm-der-frauen-spielerinnen-drohen-fifa-mit-klage-a-984966.html" title="Fußball-WM auf Kunstrasen: Star-Spielerinnen drohen Fifa mit Klage"><span class="headline-intro">Fußball-WM auf Kunstrasen</span> <span class="headline">Star-Spielerinnen drohen Fifa mit Klage</span></a></h2><p class="article-intro clearfix">
            Bei der Frauen-WM im kommenden Jahr soll auf Kunstrasen gespielt werden. Das erzürnt die besten Spielerinnen der Welt, auch Nadine Angerer. Sie drohen mit rechtlichen Schritten. Die Fifa sieht in dem Geläuf jedoch die "Zukunft des Fußballs". <a href="/sport/fussball/fussball-wm-der-frauen-spielerinnen-drohen-fifa-mit-klage-a-984966.html" title="Fußball-WM auf Kunstrasen: Star-Spielerinnen drohen Fifa mit Klage" class="more-link">mehr...</a> <span class="spInteractionMarks video-forum-bracket">[&nbsp;<a href="http://forum.spiegel.de/showthread.php?t=133727">Forum</a>&nbsp;]</span></p>
    <ul class="article-list">
        <li>
                    <a href="/sport/fussball/pep-guardiola-verweigert-handschlag-nach-testspiel-der-bayern-a-984897.html" title=" Bayern-Testspiel in USA:   Guardiola verweigert Handschlag "><span class="asset-headline-intro">Bayern-Testspiel in USA:</span> <span class="asset-headline">Guardiola verweigert Handschlag</span></a></li>
            <li>
                    <a href="/sport/fussball/transfers-und-geruechte-vfl-wolfsburg-vor-verpflichtung-von-guilavogui-a-984946.html" title=" +++ Fußball-Transferticker +++:   Di Maria ist PSG zu teuer "><span class="asset-headline-intro">+++ Fußball-Transferticker +++:</span> <span class="asset-headline">Di Maria ist PSG zu teuer</span></a></li>
            </ul>
    </div>
                <div class="teaser">
                        <div class="article-image-box box-position thumb asset-align-left">
        <a href="/wirtschaft/heidi-klum-topmodel-verkauft-villa-in-los-angeles-fuer-24-millionen-a-984933.html" title="Luxusimmobilie: Klum verkauft Villa in Los Angeles für 24 Millionen Dollar"><img src="http://cdn4.spiegel.de/images/image-717403-thumb-ufsk.jpg" width="180" height="180" border="0" title="Luxusimmobilie: Klum verkauft Villa in Los Angeles für 24 Millionen Dollar" alt="Luxusimmobilie: Klum verkauft Villa in Los Angeles für 24 Millionen Dollar" /></a></div><h2 class="article-title">
    <a href="/wirtschaft/heidi-klum-topmodel-verkauft-villa-in-los-angeles-fuer-24-millionen-a-984933.html" title="Luxusimmobilie: Klum verkauft Villa in Los Angeles für 24 Millionen Dollar"><span class="headline-intro">Luxusimmobilie</span> <span class="headline">Klum verkauft Villa in Los Angeles für 24 Millionen Dollar</span></a></h2><p class="article-intro clearfix">
            1230 Quadratmeter Wohnfläche, acht Schlafzimmer, zehn Bäder und jede Menge Luxus - für 25 Millionen Dollar wollte Top-Model Heidi Klum ihre Nobelvilla in Los Angeles verkaufen. Der Käufer bekam sie etwas günstiger. <span class="author">Von manager-magazin.de-Redakteur Christoph Rottwilm</span> <a href="/wirtschaft/heidi-klum-topmodel-verkauft-villa-in-los-angeles-fuer-24-millionen-a-984933.html" title="Luxusimmobilie: Klum verkauft Villa in Los Angeles für 24 Millionen Dollar" class="more-link">mehr...</a> <span class="spInteractionMarks video-forum-bracket">[&nbsp;<a href="http://forum.spiegel.de/showthread.php?t=133735">Forum</a>&nbsp;]</span></p>
    <ul class="article-list">
        <li>
                    <a href="/fotostrecke/heidi-klum-nobelvilla-in-los-angeles-verkauft-fotostrecke-117741.html" title=" Fotostrecke:   Das ist Heidis Ex-Villa "><span class="asset-headline-intro">Fotostrecke:</span> <span class="asset-headline">Das ist Heidis Ex-Villa</span></a></li>
            </ul>
    </div>
                <div class="teaser">
                        <h2 class="article-title">
    <a href="/reise/aktuell/mont-blanc-risikobereite-bergsteiger-veraergern-einheimische-a-984881.html" title="Bergsteiger am Mont Blanc: Rekordverdächtig dämlich"><span class="headline-intro">Bergsteiger am Mont Blanc</span> <span class="headline">Rekordverdächtig dämlich</span></a></h2><div class="article-image-box box-position hppano asset-align-center">
        <div class="image-buttons-panel clearfix">
                    <a href="/reise/aktuell/mont-blanc-risikobereite-bergsteiger-veraergern-einheimische-a-984881.html" title="Bergsteiger am Mont Blanc: Rekordverdächtig dämlich"><img src="http://cdn4.spiegel.de/images/image-733837-hppano-ypdc.jpg" width="610" height="293" border="0" title="Bergsteiger am Mont Blanc: Rekordverdächtig dämlich" alt="Bergsteiger am Mont Blanc: Rekordverdächtig dämlich" /></a><span class="image-buttons">
                        <a href="/fotostrecke/mont-blanc-risikobereite-gipfelstuermer-veraergern-einheimische-fotostrecke-117733.html" title="Bergsteigen: Immer Ärger am Mont Blanc"><img src="/static/sys/v10/buttons/but_foto_2_big.png"    alt="Fotos" class="btn-photo-text-large" /></a></span>
                </div>
            </div><p class="article-intro clearfix">
            Ein Vater bringt seine Kinder in Lebensgefahr - nur um sie als Jüngste auf den Mont Blanc zu bringen. Für die Einheimischen ist damit der Gipfel erreicht: Sie wollen leichtsinnige Bergsteiger nicht länger dulden. <a href="/reise/aktuell/mont-blanc-risikobereite-bergsteiger-veraergern-einheimische-a-984881.html" title="Bergsteiger am Mont Blanc: Rekordverdächtig dämlich" class="more-link">mehr...</a> <span class="spInteractionMarks video-forum-bracket">[&nbsp;<a href="http://forum.spiegel.de/showthread.php?t=133726">Forum</a>&nbsp;]</span></p>
    <ul class="article-list">
        <li>
                    <a href="/fotostrecke/mont-blanc-risikobereite-gipfelstuermer-veraergern-einheimische-fotostrecke-117733.html" title=" Fotostrecke:   Immer Ärger am Mont Blanc "><span class="asset-headline-intro">Fotostrecke:</span> <span class="asset-headline">Immer Ärger am Mont Blanc</span></a></li>
            </ul>
    </div>
                </div>
</div>
<div class="is-hidden" id="HPIDs">-1,984952,984964,984900,984920,984975,984931,984954,984548,984408,984966,984933,984881</div>
<div class="commonpager mumelei-5-pics asset-box inline-pic-credit clearfix" data-enable-touch="true">
            <div class="commonpager-header clearfix">
                <div class="asset-title"><a href="http://www.spiegel.de/video/" target="_self" title="Videos">Videos</a></div><div class="commonpager-indicator"></div>
            </div>
            <div class="commonpager-pages">
                <div class="commonpager-page first">
    <ul class="list-flashvideo clearfix"><li><div class="video-pic image-buttons-panel article-image-box box-position" style="width: 160px;">
                <a href="/video/fallschirmsprung-von-segelflugzeug-in-polen-video-1512963.html" onclick="return spOpenVideo(this,'1512963')" title=" Tragfläche als Sprungbrett:   Fallschirmsprung mit Extra-Nervenkitzel "><img src="http://cdn2.spiegel.de/images/image-733605-videothumbmultimedia-sjcj.jpg" width="160" height="120" border="0" title="" alt="" style="" /><span class="image-buttons"><img src="/static/sys/v10/buttons/play-trans_37x37.png" width="39" height="39" class="btn-play-video" alt="Video abspielen..." title="Video abspielen..." /></span></a><div style="width:160px;" class="asset-credit">LiveLeak/polirw</div></div>

        <a href="/video/fallschirmsprung-von-segelflugzeug-in-polen-video-1512963.html" onclick="return spOpenVideo(this,'1512963')" title="Tragfläche als Sprungbrett: Fallschirmsprung mit Extra-Nervenkitzel"><span class="asset-headline-intro">Tragfläche als Sprungbrett:</span> <span class="asset-headline">Fallschirmsprung mit Extra-Nervenkitzel</span></a></li>
        <li><div class="video-pic image-buttons-panel article-image-box box-position" style="width: 160px;">
                <a href="/video/schweinsteiger-verletzung-am-knoechel-nicht-so-schwer-video-1513193.html" onclick="return spOpenVideo(this,'1513193')" title=" Entwarnung bei Schweinsteiger:   Ich habe Glück gehabt "><img src="http://cdn1.spiegel.de/images/image-733944-videothumbmultimedia-pely.jpg" width="160" height="120" border="0" title="" alt="" style="" /><span class="image-buttons"><img src="/static/sys/v10/buttons/play-trans_37x37.png" width="39" height="39" class="btn-play-video" alt="Video abspielen..." title="Video abspielen..." /></span></a><div style="width:160px;" class="asset-credit">Getty Images</div></div>

        <a href="/video/schweinsteiger-verletzung-am-knoechel-nicht-so-schwer-video-1513193.html" onclick="return spOpenVideo(this,'1513193')" title="Entwarnung bei Schweinsteiger: Ich habe Glück gehabt"><span class="asset-headline-intro">Entwarnung bei Schweinsteiger:</span> <span class="asset-headline">"Ich habe Glück gehabt"</span></a></li>
        <li><div class="video-pic image-buttons-panel article-image-box box-position" style="width: 160px;">
                <a href="/video/ebola-missionar-pajares-wird-aus-liberia-nach-spanien-ausgeflogen-video-1513130.html" onclick="return spOpenVideo(this,'1513130')" title=" Infizierter spanischer Missionar:   Erster Ebola-Patient kommt nach Europa "><img src="http://cdn1.spiegel.de/images/image-733858-videothumbmultimedia-thbn.jpg" width="160" height="120" border="0" title="" alt="" style="" /><span class="image-buttons"><img src="/static/sys/v10/buttons/play-trans_37x37.png" width="39" height="39" class="btn-play-video" alt="Video abspielen..." title="Video abspielen..." /></span></a><div style="width:160px;" class="asset-credit">DPA</div></div>

        <a href="/video/ebola-missionar-pajares-wird-aus-liberia-nach-spanien-ausgeflogen-video-1513130.html" onclick="return spOpenVideo(this,'1513130')" title="Infizierter spanischer Missionar: Erster Ebola-Patient kommt nach Europa"><span class="asset-headline-intro">Infizierter spanischer Missionar:</span> <span class="asset-headline">Erster Ebola-Patient kommt nach Europa</span></a></li>
        <li><div class="video-pic image-buttons-panel article-image-box box-position" style="width: 160px;">
                <a href="/video/terrormiliz-is-zehntausende-kurden-auf-der-flucht-video-1513083.html" onclick="return spOpenVideo(this,'1513083')" title=" Terrormiliz IS:   Zehntausende Kurden auf der Flucht "><img src="http://cdn1.spiegel.de/images/image-733818-thumbbiga-ziix.jpg" width="160" height="120" border="0" title="" alt="" style="" /><span class="image-buttons"><img src="/static/sys/v10/buttons/play-trans_37x37.png" width="39" height="39" class="btn-play-video" alt="Video abspielen..." title="Video abspielen..." /></span></a><div style="width:160px;" class="asset-credit">AFP</div></div>

        <a href="/video/terrormiliz-is-zehntausende-kurden-auf-der-flucht-video-1513083.html" onclick="return spOpenVideo(this,'1513083')" title="Terrormiliz IS: Zehntausende Kurden auf der Flucht"><span class="asset-headline-intro">Terrormiliz IS:</span> <span class="asset-headline">Zehntausende Kurden auf der Flucht</span></a></li>
        <li><div class="video-pic image-buttons-panel article-image-box box-position" style="width: 160px;">
                <a href="/video/bahnunfall-in-perth-passagiere-in-australien-kippen-zug-um-video-1512933.html" onclick="return spOpenVideo(this,'1512933')" title=" Zugunfall in Perth:   Passagiere kippen Waggon und befreien Mann "><img src="http://cdn4.spiegel.de/images/image-733557-thumbbiga-ufxn.jpg" width="160" height="120" border="0" title="" alt="" style="" /><span class="image-buttons"><img src="/static/sys/v10/buttons/play-trans_37x37.png" width="39" height="39" class="btn-play-video" alt="Video abspielen..." title="Video abspielen..." /></span></a><div style="width:160px;" class="asset-credit">AFP/ Public Transport Authority of Western Australia</div></div>

        <a href="/video/bahnunfall-in-perth-passagiere-in-australien-kippen-zug-um-video-1512933.html" onclick="return spOpenVideo(this,'1512933')" title="Zugunfall in Perth: Passagiere kippen Waggon und befreien Mann"><span class="asset-headline-intro">Zugunfall in Perth:</span> <span class="asset-headline">Passagiere kippen Waggon und befreien Mann</span></a></li>
        </ul>
                </div>
                <div class="commonpager-page">
        <ul class="list-flashvideo clearfix"><li><div class="video-pic image-buttons-panel article-image-box box-position" style="width: 160px;">
                <a href="http://www.dctp.tv/filme/vernichtungsprinzip-newsstories-15072001/" target="_blank"><img src="/static/sys/dimensionspixel.gif" data-src="http://cdn1.spiegel.de/images/image-732918-thumbbiga-afuf.jpg" width="160" height="120" border="0" title="" alt="" style="" /><span class="image-buttons"><img src="/static/sys/v10/buttons/play-trans_37x37.png" width="39" height="39" class="btn-play-video" alt="Video abspielen..." title="Video abspielen..." /></span></a><div style="width:160px;" class="asset-credit">dctp</div></div>

        <a href="http://www.dctp.tv/filme/vernichtungsprinzip-newsstories-15072001/" target="_blank" title="Das Vernichtungsprinzip: Vom Gaskrieg zum Raketenschild"><span class="asset-headline-intro">Das Vernichtungsprinzip:</span> <span class="asset-headline">Vom Gaskrieg zum Raketenschild</span></a></li>
        <li><div class="video-pic image-buttons-panel article-image-box box-position" style="width: 160px;">
                <a href="/video/raumsonde-rosetta-erreicht-komet-tschuri-video-1513015.html" onclick="return spOpenVideo(this,'1513015')" title=" Rosetta ist am Ziel:   Raumsonde erreicht Kometen Tschuri "><img src="/static/sys/dimensionspixel.gif" data-src="http://cdn2.spiegel.de/images/image-730771-thumbbiga-mplm.jpg" width="160" height="120" border="0" title="" alt="" style="" /><span class="image-buttons"><img src="/static/sys/v10/buttons/play-trans_37x37.png" width="39" height="39" class="btn-play-video" alt="Video abspielen..." title="Video abspielen..." /></span></a><div style="width:160px;" class="asset-credit">DLR</div></div>

        <a href="/video/raumsonde-rosetta-erreicht-komet-tschuri-video-1513015.html" onclick="return spOpenVideo(this,'1513015')" title="Rosetta ist am Ziel: Raumsonde erreicht Kometen Tschuri"><span class="asset-headline-intro">"Rosetta" ist am Ziel:</span> <span class="asset-headline">Raumsonde erreicht Kometen Tschuri</span></a></li>
        <li><div class="video-pic image-buttons-panel article-image-box box-position" style="width: 160px;">
                <a href="/video/chinesische-armee-veroeffentlicht-rekrutierungsvideo-video-1512915.html" onclick="return spOpenVideo(this,'1512915')" title=" Tanzende Truppe:   Die skurrilen Werbevideos der chinesischen Armee "><img src="/static/sys/dimensionspixel.gif" data-src="http://cdn2.spiegel.de/images/image-733545-videothumbmultimedia-ehwh.jpg" width="160" height="120" border="0" title="" alt="" style="" /><span class="image-buttons"><img src="/static/sys/v10/buttons/play-trans_37x37.png" width="39" height="39" class="btn-play-video" alt="Video abspielen..." title="Video abspielen..." /></span></a><div style="width:160px;" class="asset-credit">mod.gov.cn</div></div>

        <a href="/video/chinesische-armee-veroeffentlicht-rekrutierungsvideo-video-1512915.html" onclick="return spOpenVideo(this,'1512915')" title="Tanzende Truppe: Die skurrilen Werbevideos der chinesischen Armee"><span class="asset-headline-intro">Tanzende Truppe:</span> <span class="asset-headline">Die skurrilen Werbevideos der chinesischen Armee</span></a></li>
        <li><div class="video-pic image-buttons-panel article-image-box box-position" style="width: 160px;">
                <a href="/video/waldbrand-in-schweden-feuerwehr-evakuiert-doerfer-video-1512909.html" onclick="return spOpenVideo(this,'1512909')" title=" Verheerender Waldbrand in Schweden:   Feuerwehr evakuiert Dörfer "><img src="/static/sys/dimensionspixel.gif" data-src="http://cdn3.spiegel.de/images/image-733776-thumbbiga-opxy.jpg" width="160" height="120" border="0" title="" alt="" style="" /><span class="image-buttons"><img src="/static/sys/v10/buttons/play-trans_37x37.png" width="39" height="39" class="btn-play-video" alt="Video abspielen..." title="Video abspielen..." /></span></a><div style="width:160px;" class="asset-credit">REUTERS</div></div>

        <a href="/video/waldbrand-in-schweden-feuerwehr-evakuiert-doerfer-video-1512909.html" onclick="return spOpenVideo(this,'1512909')" title="Verheerender Waldbrand in Schweden: Feuerwehr evakuiert Dörfer"><span class="asset-headline-intro">Verheerender Waldbrand in Schweden:</span> <span class="asset-headline">Feuerwehr evakuiert Dörfer</span></a></li>
        <li><div class="video-pic image-buttons-panel article-image-box box-position" style="width: 160px;">
                <a href="/video/erdbeben-yunnan-retter-bergen-frau-und-kind-video-1512900.html" onclick="return spOpenVideo(this,'1512900')" title=" Erdbeben in China:   88-Jährige nach 50 Stunden lebend geborgen "><img src="/static/sys/dimensionspixel.gif" data-src="http://cdn3.spiegel.de/images/image-733332-videothumbmultimedia-acjs.jpg" width="160" height="120" border="0" title="" alt="" style="" /><span class="image-buttons"><img src="/static/sys/v10/buttons/play-trans_37x37.png" width="39" height="39" class="btn-play-video" alt="Video abspielen..." title="Video abspielen..." /></span></a><div style="width:160px;" class="asset-credit">Getty Images</div></div>

        <a href="/video/erdbeben-yunnan-retter-bergen-frau-und-kind-video-1512900.html" onclick="return spOpenVideo(this,'1512900')" title="Erdbeben in China: 88-Jährige nach 50 Stunden lebend geborgen"><span class="asset-headline-intro">Erdbeben in China:</span> <span class="asset-headline">88-Jährige nach 50 Stunden lebend geborgen</span></a></li>
        </ul>
                </div>
                <div class="commonpager-page">
        <ul class="list-flashvideo clearfix"><li><div class="video-pic image-buttons-panel article-image-box box-position" style="width: 160px;">
                <a href="/video/youtube-video-farmer-lockt-kuhherde-mit-trompete-video-1512733.html" onclick="return spOpenVideo(this,'1512733')" title=" Muuuuuuhsikantenstadl:   Der Farmer, die Posaune und die Kühe "><img src="/static/sys/dimensionspixel.gif" data-src="http://cdn4.spiegel.de/images/image-733193-videothumbmultimedia-ylgp.jpg" width="160" height="120" border="0" title="" alt="" style="" /><span class="image-buttons"><img src="/static/sys/v10/buttons/play-trans_37x37.png" width="39" height="39" class="btn-play-video" alt="Video abspielen..." title="Video abspielen..." /></span></a><div style="width:160px;" class="asset-credit">YouTube/Farmer Derek Klingenberg</div></div>

        <a href="/video/youtube-video-farmer-lockt-kuhherde-mit-trompete-video-1512733.html" onclick="return spOpenVideo(this,'1512733')" title="Muuuuuuhsikantenstadl: Der Farmer, die Posaune und die Kühe"><span class="asset-headline-intro">Muuuuuuhsikantenstadl:</span> <span class="asset-headline">Der Farmer, die Posaune und die Kühe</span></a></li>
        <li><div class="video-pic image-buttons-panel article-image-box box-position" style="width: 160px;">
                <a href="/video/boko-haram-amnesty-veroeffentlicht-hinrichtungsvideo-aus-nigeria-video-1512548.html" onclick="return spOpenVideo(this,'1512548')" title=" Kampf gegen Boko Haram:   Amnesty prangert Hinrichtungen durch nigerianische Armee an "><img src="/static/sys/dimensionspixel.gif" data-src="http://cdn2.spiegel.de/images/image-732855-thumbbiga-dqbc.jpg" width="160" height="120" border="0" title="" alt="" style="" /><span class="image-buttons"><img src="/static/sys/v10/buttons/play-trans_37x37.png" width="39" height="39" class="btn-play-video" alt="Video abspielen..." title="Video abspielen..." /></span></a><div style="width:160px;" class="asset-credit">Amnesty International</div></div>

        <a href="/video/boko-haram-amnesty-veroeffentlicht-hinrichtungsvideo-aus-nigeria-video-1512548.html" onclick="return spOpenVideo(this,'1512548')" title="Kampf gegen Boko Haram: Amnesty prangert Hinrichtungen durch nigerianische Armee an"><span class="asset-headline-intro">Kampf gegen Boko Haram:</span> <span class="asset-headline">Amnesty prangert Hinrichtungen durch nigerianische Armee an</span></a></li>
        <li><div class="video-pic image-buttons-panel article-image-box box-position" style="width: 160px;">
                <a href="/video/nordkorea-manoever-mit-kim-jong-un-im-staatsfernsehen-video-1512682.html" onclick="return spOpenVideo(this,'1512682')" title=" Kim Jong Un inspiziert Manöver:   Nordkoreas bildgewaltige Botschaft an Südkorea "><img src="/static/sys/dimensionspixel.gif" data-src="http://cdn2.spiegel.de/images/image-733005-videothumbmultimedia-asmt.jpg" width="160" height="120" border="0" title="" alt="" style="" /><span class="image-buttons"><img src="/static/sys/v10/buttons/play-trans_37x37.png" width="39" height="39" class="btn-play-video" alt="Video abspielen..." title="Video abspielen..." /></span></a><div style="width:160px;" class="asset-credit">REUTERS</div></div>

        <a href="/video/nordkorea-manoever-mit-kim-jong-un-im-staatsfernsehen-video-1512682.html" onclick="return spOpenVideo(this,'1512682')" title="Kim Jong Un inspiziert Manöver: Nordkoreas bildgewaltige Botschaft an Südkorea"><span class="asset-headline-intro">Kim Jong Un inspiziert Manöver:</span> <span class="asset-headline">Nordkoreas bildgewaltige Botschaft an Südkorea</span></a></li>
        <li><div class="video-pic image-buttons-panel article-image-box box-position" style="width: 160px;">
                <a href="/video/youtube-video-segelboot-rammt-zugbruecke-in-der-bretagne-video-1512686.html" onclick="return spOpenVideo(this,'1512686')" title=" Brückentag:   Mast- und Schotbruch in der Bretagne "><img src="/static/sys/dimensionspixel.gif" data-src="http://cdn1.spiegel.de/images/image-733068-videothumbmultimedia-mjqn.jpg" width="160" height="120" border="0" title="" alt="" style="" /><span class="image-buttons"><img src="/static/sys/v10/buttons/play-trans_37x37.png" width="39" height="39" class="btn-play-video" alt="Video abspielen..." title="Video abspielen..." /></span></a><div style="width:160px;" class="asset-credit">YouTube/Vincent Lostaplàa</div></div>

        <a href="/video/youtube-video-segelboot-rammt-zugbruecke-in-der-bretagne-video-1512686.html" onclick="return spOpenVideo(this,'1512686')" title="Brückentag: Mast- und Schotbruch in der Bretagne"><span class="asset-headline-intro">Brückentag:</span> <span class="asset-headline">Mast- und Schotbruch in der Bretagne</span></a></li>
        <li><div class="video-pic image-buttons-panel article-image-box box-position" style="width: 160px;">
                <a href="/video/gaza-krieg-feuerpause-zwischen-israel-und-der-hamas-video-1512651.html" onclick="return spOpenVideo(this,'1512651')" title=" Feuerpause in Nahost:   Israel zieht Bodentruppen komplett aus Gaza ab "><img src="/static/sys/dimensionspixel.gif" data-src="http://cdn4.spiegel.de/images/image-732873-thumbbiga-jnxa.jpg" width="160" height="120" border="0" title="" alt="" style="" /><span class="image-buttons"><img src="/static/sys/v10/buttons/play-trans_37x37.png" width="39" height="39" class="btn-play-video" alt="Video abspielen..." title="Video abspielen..." /></span></a><div style="width:160px;" class="asset-credit">AP/dpa</div></div>

        <a href="/video/gaza-krieg-feuerpause-zwischen-israel-und-der-hamas-video-1512651.html" onclick="return spOpenVideo(this,'1512651')" title="Feuerpause in Nahost: Israel zieht Bodentruppen komplett aus Gaza ab"><span class="asset-headline-intro">Feuerpause in Nahost:</span> <span class="asset-headline">Israel zieht Bodentruppen komplett aus Gaza ab</span></a></li>
        </ul>
                </div>
            </div>
        </div>
    <div class="hpheftkasten hp-gradient clearfix">

        <div class="hpheftkasten-left">
            <div class="hpheftkasten-head">
                <a href="/spiegel/index-8468.html" target="_blank"><img class="logo" src="/static/sys/v10/logo/der_spiegel_140-19.png" width="140" height="19" alt="Der SPIEGEL" /></a>
                -
                <a href="/spiegel/index-8468.html" target="_blank">Aktuell aus dem Magazin</a>
            </div>

            <div class="hpheftkasten-inner commonpager clearfix">
 <div class="hpheftkasten-pager">
     <div class="commonpager-pages">
         <div class="commonpager-page">
             <div class="picwithoverlay">
                 <a href="https://magazin.spiegel.de/digital/index_SP.html#SP/2014/32/128476280" target="_blank">
                     <img alt="Wird Erdogan zum Autokraten?" src="https://magazin.spiegel.de/EpubDelivery/image/SP/2014/32/img-co-sp-2014-032-0004-01-154126-bi-quer.jpg/web/gratis/500"/>
                 </a>
                 <span class="hpheftkasten-teaser">
                     Unter Premier Erdogan entwickelte sich das Land zur Regionalmacht. Nun wird er wohl zum Präsidenten gewählt - seine Gegner befürchten, er werde damit zum Despoten. Auch die drei Millionen Deutschtürken müssen sich positionieren: für oder gegen ihn?
                     <a href="https://magazin.spiegel.de/digital/index_SP.html#SP/2014/32/128476280" target="_blank">mehr...</a>
                 </span>
             </div>
             <div class="asset-credit" style="width:500px;">CLAUDIUS SCHULZE/ LAIF</div>
         </div>
         <div class="commonpager-page">
             <div class="picwithoverlay">
                 <a href="https://magazin.spiegel.de/digital/index_SP.html#SP/2014/32/128476241" target="_blank">
                     <img alt="Mord und Totschlag" data-src="https://magazin.spiegel.de/EpubDelivery/image/SP/2014/32/img-co-sp-2014-032-0004-02-154121-bi-quer.jpg/mobil/gratis/500" src="/static/sys/dimensionspixel.gif"/>
                 </a>
                 <span class="hpheftkasten-teaser">
                     Es ist eines der heikelsten Reformprojekte des Bundesjustizministers: Heiko Maas will den Mord-Paragrafen reformieren. Die Vorschrift stammt aus der Nazizeit. Sie belastet die Richter, die für gerechte Urteile an die Grenze ihrer Kompetenz gehen müssen. Doch sind die Deutschen bereit für eine Debatte über die richtige Strafe für Mörder?
                     <a href="https://magazin.spiegel.de/digital/index_SP.html#SP/2014/32/128476241" target="_blank">mehr...</a>
                 </span>
             </div>
             <div class="asset-credit" style="width:500px;">FRANK MAY / PICTURE-ALLIANCE / DPA</div>
         </div>
         <div class="commonpager-page">
             <div class="picwithoverlay">
                 <a href="https://magazin.spiegel.de/digital/index_SP.html#SP/2014/32/128476269" target="_blank">
                     <img alt="Lichtrevolution mit Schattenseite" data-src="https://magazin.spiegel.de/EpubDelivery/image/SP/2014/32/img-co-sp-2014-032-0004-03-154122-bi-quer.jpg/mobil/gratis/500" src="/static/sys/dimensionspixel.gif"/>
                 </a>
                 <span class="hpheftkasten-teaser">
                     Osram streicht in Deutschland fast jede fünfte Stelle, das gesamte Lichtgewerbe befindet sich im Umbruch: Die LED-Technologie verdrängt herkömmliche Leuchten viel schneller als erwartet. Neue Angreifer aus Fernost fordern europäische Traditionsfirmen wie Osram oder Philips heraus.
                     <a href="https://magazin.spiegel.de/digital/index_SP.html#SP/2014/32/128476269" target="_blank">mehr...</a>
                 </span>
             </div>
             <div class="asset-credit" style="width:500px;">JASON REED / REUTERS</div>
         </div>
         <div class="commonpager-page">
             <div class="picwithoverlay">
                 <a href="https://magazin.spiegel.de/digital/index_SP.html#SP/2014/32/128476285" target="_blank">
                     <img alt="Israel und Palästina" data-src="https://magazin.spiegel.de/EpubDelivery/image/SP/2014/32/img-co-sp-2014-032-0005-01-154117-bi-quer.jpg/mobil/gratis/500" src="/static/sys/dimensionspixel.gif"/>
                 </a>
                 <span class="hpheftkasten-teaser">
                     Eva Illouz, israelische Soziologin, erklärt im SPIEGEL-Gespräch die Angst ihrer Landsleute, die Gründe ihrer Radikalisierung und warum es vielen an Mitleid mit den Palästinensern fehlt.
                     <a href="https://magazin.spiegel.de/digital/index_SP.html#SP/2014/32/128476285" target="_blank">mehr...</a>
                 </span>
             </div>
             <div class="asset-credit" style="width:500px;">AMIT SHABI / LAIF / DER SPIEGEL</div>
         </div>
     </div>
 </div>
 <div class="hpheftkasten-left-index">
     <ul>
         <li class="commonpager-pagelink active" data-pagenum="0">
<span>Wird Erdogan zum Autokraten?</span>
</li>
         <li class="commonpager-pagelink" data-pagenum="1">
<span>Mord und Totschlag</span>
</li>
         <li class="commonpager-pagelink" data-pagenum="2">
<span>Lichtrevolution mit Schattenseite</span>
</li>
         <li class="commonpager-pagelink" data-pagenum="3">
<span>Israel und Palästina</span>
</li>
         <li class="spiegelblog">
<span>
<a href="/thema/spiegelblog/">
<img alt="SPIEGELblog" height="22" src="/static/sys/v10/buttons/spiegelblog.png" title="SPIEGELblog" width="140"/>
</a>
</span>
</li>
     </ul>
</div>
</div></div>

        <div class="hpheftkasten-right">

            <a class="hpheftkasten-head" href="/spiegel/index-8468.html" target="_blank">Heft 32/2014</a>

            <div class="hpheftkasten-inner">
                <a href="/spiegel/index-8468.html" target="_blank">
                    <span class="hpheftkasten-right-cover">
                        <img src="https://magazin.spiegel.de/EpubDelivery/image/title/SP/2014/32/160" width="160" alt="Titelbild"  border="0"/>
</span>

                    <span class="hpheftkasten-right-title">
                        <b>Der Staat Erdo&#287;an</b>
                        <br />
                            Bleibt die Türkei ein freies Land? Türkiye özgür kalacak m&#305;?</span>
                </a>

                <ul class="hpheftkasten-right-links clearfix">
                    <li class="list-float-left"><a href="/spiegel/print/index-2014-32.html">Inhalt</a></li>
                    <li class="list-float-right"><a target="_blank" href="http://abo.spiegel.de/de/c/spiegel?b=SPOHMAGBOX&utm_source=spon&utm_medium=text&utm_content=SPOHMAGBOX&utm_campaign=heftkasten">Abo-Angebote</a></li>
                </ul>
            </div>

        </div>
    </div><div class="asset-box asset-hp-special clearfix">
   <div class="hp-gradient clearfix">
      <div class="column-wide">
         <div class="clearfix">
            <div class="asset-kolumnisten">
<ul class="asset-kolumnisten-list">
<li class="kolumnist-augstein">
<a href="/thema/spon_augstein/">
<span>Jakob Augstein</span>
<br/>Im Zweifel links</a>
</li>
<li class="kolumnist-fleischhauer">
<a href="/thema/spon_fleischhauer/">
<span>Jan Fleischhauer</span>
<br/>Der Schwarze Kanal</a>
</li>
<li class="kolumnist-diez">
<a href="/thema/spon_diez/">
<span>Georg Diez</span>
<br/>Der Kritiker</a>
</li>
<li class="kolumnist-berg">
<a href="/thema/spon_berg/">
<span>Sibylle Berg</span>
<br/>Fragen Sie Frau Sibylle</a>
</li>
<li class="kolumnist-muenchau">
<a href="/thema/spon_muenchau/">
<span>Wolfgang Münchau</span>
<br/>Die Spur des Geldes</a>
</li>
</ul>
<div class="asset-kolumnisten-main">
<div class="asset-title">
<a href="/thema/spon_die_kolumnisten/">S.P.O.N. - Die Kolumnisten</a>
</div>
<h4 class="asset-kolumnisten-author">Sascha Lobo</h4>
<div class="asset-kolumnisten-headline">
<a href="/netzwelt/netzpolitik/recht-auf-vergessen-sasha-lobo-zum-google-urteil-kolumne-a-984681.html" title="Google-Löschungen: Datensouveränität statt verordneter Vergesslichkeit" class="text-link-int"><span class="asset-headline-intro">Google-Löschungen:</span> <span class="asset-headline">Datensouveränität statt verordneter Vergesslichkeit</span></a>
</div>
<div class="article-image-box asset-align-left" style="width: 90px;">
<a href="/netzwelt/netzpolitik/recht-auf-vergessen-sasha-lobo-zum-google-urteil-kolumne-a-984681.html" title="Google-Löschungen: Datensouveränität statt verordneter Vergesslichkeit"><img src="http://cdn4.spiegel.de/images/image-429053-thumbsmall-bdny.png" width="90" height="90" border="0" class="image-no-border" title="" alt="" align="left" /></a>
</div>
<p>Der Begriff "Recht auf Vergessen" vernebelt eine dringend notwendige Diskussion. Institutionen wie Googles Löschmechanismus sind eine eine schlechte Brückentechnologie für ein wichtiges Ziel: die Datensouveränität des Einzelnen. <a href="/netzwelt/netzpolitik/recht-auf-vergessen-sasha-lobo-zum-google-urteil-kolumne-a-984681.html" title="mehr..." class="text-link-int">mehr...</a>
</p>
<p>
<b>Alle Kolumnen von <a href="/thema/spon_lobo/">Sascha Lobo ...</a>
</b>
</p>
</div>
</div>
         </div>
      </div>
      <div class="column-small">
         <div class="asset-debatte">
   <div class="js-module-box-image box-position  asset-align-center hpcolumnrightsquare" style="width:230px;">

                        <a href="/politik/ausland/gaza-krieg-opferzahlen-der-uno-a-984868.html" title="Datenlese: Opferzahlen in Gaza"><img src="http://cdn2.spiegel.de/images/image-731561-hpcolumnrightsquare-yguu.jpg" width="230" height="230" border="0" title="" alt="" align="center" /></a><div >
                            <div class="asset-credit">AP</div>
                            </div>
                    </div>


 <a href="/blog/">
      <span class="asset-title-box">
         <span class="asset-title">
           Blog
         </span>
      </span>
</a>

<a href="/politik/ausland/gaza-krieg-opferzahlen-der-uno-a-984868.html" title="         Datenlese         Opferzahlen in Gaza          " class="text-link-int"><span class="asset-headline">Datenlese</span>
      <span class="asset-copy">Opferzahlen in Gaza</span></a>
<div style="margin:-10px 0 5px 0;">
<a href="/blog/">Alle Blogs</a>
</div>
</div>
      </div>
   </div>
</div><div class="clearfix module-box panorama">

    <div class="ressort-teaser-box-header hp-gradient double-bottom-border clearfix">

        <p class="module-title block-bullet"><a href="/panorama/#ref=ressortblock"> PANORAMA</a></p>
            <div class="ressort-teaser-box-nav">
<ul>
<li>
<a href="/panorama/justiz/">Justiz</a>
</li>
<li>
<a href="/panorama/leute/">Leute</a>
</li>
<li>
<a href="/panorama/gesellschaft/">Gesellschaft</a>
</li>
<li>
<a class="link-more" href="javascript:return false;">mehr</a>
<ul class="ressort-box-nav-sub">
<li>
<a href="/thema/kurz_und_krass_gemeldet">kurz & krass</a>
</li>
<li>
<a href="/thema/lebenswege">Lebenswege</a>
</li>
<li>
<a href="/thema/gisela_friedrichsen">Gisela Friedrichsen</a>
</li>
<li>
<a href="/thema/quiz">Quiz</a>
</li>
<li>
<a href="/thema/">
<strong>alle Themen</strong>
</a>
</li>
</ul>
</li>
</ul>
</div></div><div class="clearfix ressort-teaser-box-body">

        <div class="column-wide"><div class="commonpager" data-commonpager-beforeslide="spHpSlideBox" data-enable-touch="false" data-commonpager-callback="spHpSlideBoxCallback" >
                <div class="commonpager-pages">
                    <div class="commonpager-page first ressort-slide" rel="panorama">

                        <div class="ressort-teaser-box-top">
                                        <div class="article-image-box box-position thumb asset-align-left">
        <div class="image-buttons-panel clearfix">
                    <a href="/panorama/leute/prinz-william-macht-ausbildung-als-ziviler-hubschrauber-rettungspilot-a-984970.html" title="Royal in Ausbildung: Neuer Job für Prinz William"><img src="/static/sys/dimensionspixel.gif" data-original="http://cdn2.spiegel.de/images/image-734051-thumb-fhqi.jpg" width="180" height="180" border="0" class="js-lazy" title="Royal in Ausbildung: Neuer Job für Prinz William" alt="Royal in Ausbildung: Neuer Job für Prinz William" /></a><span class="image-buttons">
                        </span>
                </div>
            </div><h2 class="article-title">
    <a href="/panorama/leute/prinz-william-macht-ausbildung-als-ziviler-hubschrauber-rettungspilot-a-984970.html" title="Royal in Ausbildung: Neuer Job für Prinz William"><span class="headline-intro">Royal in Ausbildung</span> <span class="headline">Neuer Job für Prinz William</span></a></h2><p>Prinz William macht noch einmal eine Ausbildung: Der 32-Jährige soll künftig als ziviler Rettungspilot Hubschrauber fliegen. Eine gewisse Vorkenntnis bringt der britische Royal mit. <a href="/panorama/leute/prinz-william-macht-ausbildung-als-ziviler-hubschrauber-rettungspilot-a-984970.html" title="Royal in Ausbildung: Neuer Job für Prinz William">mehr...</a> </p>
                                    </div>
                                    <ul class="article-list">
                                <li>
                                    <a href="/panorama/gruene-farbe-fuer-rasen-kalifornier-tuenchen-gaerten-wegen-duerre-a-984890.html" title="Dürre in Kalifornien: Alles Grün macht der Farbkanister"><span class="headline-intro">Dürre in Kalifornien:</span> <span class="headline">Alles Grün macht der Farbkanister</span></a></li>
                                <li>
                                    <a href="/panorama/costa-concordia-knochen-auf-havariertem-kreuzfahrtschiff-gefunden-a-984942.html" title="Suche nach letztem Vermissten: Knochen auf &quot;Costa Concordia&quot; gefunden"><span class="headline-intro">Suche nach letztem Vermissten:</span> <span class="headline">Knochen auf "Costa Concordia" gefunden</span></a></li>
                                <li>
                                    <a href="/panorama/ottolenghis-rezept-zaalouk-mit-schnittlauch-a-982578.html" title="Ottolenghis Rezept: Zaalouk gibt's nie genug"><span class="headline-intro">Ottolenghis Rezept:</span> <span class="headline">Zaalouk gibt's nie genug</span></a></li>
                                </ul>

                        <div class="is-hidden" id="panorama-Ids">-1,984970,984890,984942,982578</div>

                    </div><div class="commonpager-page ressort-slide"><div class="load-icon"><img src="/static/sys/v10/icons/ani-loader_small.gif" alt="loading..." /></div></div>
                    <div class="commonpager-page ressort-slide"><div class="load-icon"><img src="/static/sys/v10/icons/ani-loader_small.gif" alt="loading..." /></div></div>
                </div><div class="clearfix commonpager-indicator"></div>
            </div></div><div class="column-small"><ul class="js-ressort-content">
                <li>
                            <div class="article-image-box box-position hpcolumnressort">
                                        <a href="/panorama/ottolenghis-rezept-zaalouk-mit-schnittlauch-a-982578.html" title="Ottolenghis Rezept: Zaalouk gibt's nie genug"><img src="/static/sys/dimensionspixel.gif" data-original="http://cdn1.spiegel.de/images/image-728658-hpcolumnressort-dbhb.jpg" width="230" height="110" border="0" class="js-lazy" title="" alt="" /></a><div class="asset-credit">Jonathan Lovekin</div>
                                        </div>
                                <a href="/panorama/ottolenghis-rezept-zaalouk-mit-schnittlauch-a-982578.html" title="Ottolenghis Rezept: Zaalouk gibt's nie genug"><span class="headline-intro">Ottolenghis Rezept:</span> <span class="headline">Zaalouk gibt's nie genug</span></a></li>
                    <li>
                            <div class="article-image-box box-position hpcolumnressort">
                                        <a href="/panorama/leute/cate-blanchett-emma-watson-lupita-nyong-o-auf-best-dressed-liste-a-984870.html" title="&quot;Best dressed&quot;-Liste: Stylisch trotz Shopping-Abneigung"><img src="/static/sys/dimensionspixel.gif" data-original="http://cdn2.spiegel.de/images/image-665721-hpcolumnressort-ucbc.jpg" width="230" height="110" border="0" class="js-lazy" title="" alt="" /></a><div class="asset-credit">REUTERS</div>
                                        </div>
                                <a href="/panorama/leute/cate-blanchett-emma-watson-lupita-nyong-o-auf-best-dressed-liste-a-984870.html" title="&quot;Best dressed&quot;-Liste: Stylisch trotz Shopping-Abneigung"><span class="headline-intro">"Best dressed"-Liste:</span> <span class="headline">Stylisch trotz Shopping-Abneigung</span></a></li>
                    </ul>

            <div class="js-ressort-ad-panorama" style="display:none;">
                    <script type="text/javascript">
                    <!--
                        OAS_RICH('RightPan');
                    // -->
                    </script>
                </div>
            </div></div></div><div class="ressort-teaser-box wetter wetterboxhp hp-hatching">
    <div class="ressort-teaser-box-header hp-gradient clearfix">
            <p class="module-title">WETTER</p>
            <ul class="list-float">
                <li class="list-float-left vorhersagen">
                    <a href="http://wetter.spiegel.de/spiegel/">Aktuelle Vorhersagen</a>
                </li>
                <li class="list-float-left temperaturen">
                    <a href="http://wetter.spiegel.de/spiegel/html/deutschland_temp.html">Temperaturen Deutschland</a>
                </li>
                <li class="list-float-left unwetter">
                    <a href="http://unwetterzentrale.spiegel.de/">Unwettervorhersage</a>
                </li>
                <li class="list-float-right suche">
                    <form action="http://wetter.spiegel.de/cgi-bin/wettersearch.cgi" class="search-form-single">
                        <input type="text" name="search" placeholder="Postleitzahl / Suche" />
                        <input type="submit" class="search-form-submit" value="Postleitzahl / Suchbegriff" />
                    </form>
                </li>
            </ul>
    </div>
</div><script type="text/javascript">
<!--
 OAS_RICH('Middle4');
// -->
</script><div class="clearfix module-box politik">

    <div class="ressort-teaser-box-header hp-gradient double-bottom-border clearfix">

        <p class="module-title block-bullet"><a href="/politik/#ref=ressortblock"> POLITIK</a></p>
            <div class="ressort-teaser-box-nav">
<ul>
<li>
<a href="/politik/deutschland/">Deutschland</a>
</li>
<li>
<a href="/politik/ausland/">Ausland</a>
</li>
<li>
<a class="link-more" href="javascript:return false;">mehr</a>
<ul class="ressort-box-nav-sub">
<li>
<a href="/thema/regierung_obama">Regierung Obama</a>
</li>
<li>
<a href="/thema/nahostkonflikt">Nahostkonflikt</a>
</li>
<li>
<a href="/thema/migration">Integration</a>
</li>
<li>
<a href="/thema/islamistischer_terrorismus">Islamistischer Terrorismus</a>
</li>
<li>
<a href="/thema/">
<strong>alle Themen</strong>
</a>
</li>
</ul>
</li>
</ul>
</div></div><div class="clearfix ressort-teaser-box-body">

        <div class="column-wide"><div class="commonpager" data-commonpager-beforeslide="spHpSlideBox" data-enable-touch="false" data-commonpager-callback="spHpSlideBoxCallback" >
                <div class="commonpager-pages">
                    <div class="commonpager-page first ressort-slide" rel="politik">

                        <div class="ressort-teaser-box-top">
                                        <div class="article-image-box box-position hppano asset-align-center">
        <div class="image-buttons-panel clearfix">
                    <a href="/politik/ausland/irak-und-syrien-miliz-is-meldet-15-staedte-unter-ihrer-kontrolle-a-984971.html" title="Kämpfe in Irak und Syrien: Terrorgruppe IS brüstet sich auf Twitter mit militärischen Erfolgen"><img src="/static/sys/dimensionspixel.gif" data-original="http://cdn1.spiegel.de/images/image-732480-hppano-spih.jpg" width="610" height="293" border="0" class="js-lazy" title="Kämpfe in Irak und Syrien: Terrorgruppe IS brüstet sich auf Twitter mit militärischen Erfolgen" alt="Kämpfe in Irak und Syrien: Terrorgruppe IS brüstet sich auf Twitter mit militärischen Erfolgen" /></a><span class="image-buttons">
                        </span>
                </div>
            </div><h2 class="article-title">
    <a href="/politik/ausland/irak-und-syrien-miliz-is-meldet-15-staedte-unter-ihrer-kontrolle-a-984971.html" title="Kämpfe in Irak und Syrien: Terrorgruppe IS brüstet sich auf Twitter mit militärischen Erfolgen"><span class="headline-intro">Kämpfe in Irak und Syrien</span> <span class="headline">Terrorgruppe IS brüstet sich auf Twitter mit militärischen Erfolgen</span></a></h2><p>Kämpfer der Miliz "Islamischer Staat" behaupten auf Twitter, 15 Städte, ein Staudamm und eine Militärbasis befänden sich unter ihrer Kontrolle. Laut Uno-Angaben sind 200.000 Menschen auf der Flucht. <a href="/politik/ausland/irak-und-syrien-miliz-is-meldet-15-staedte-unter-ihrer-kontrolle-a-984971.html" title="Kämpfe in Irak und Syrien: Terrorgruppe IS brüstet sich auf Twitter mit militärischen Erfolgen">mehr...</a> <span class="spInteractionMarks video-forum-bracket">[&nbsp;<a href="/video/terrormiliz-is-zehntausende-kurden-auf-der-flucht-video-1513083.html" onclick="return spOpenVideo(this,'1513083')" title="Zehntausende Kurden auf der Flucht">Video</a> | <a href="http://forum.spiegel.de/showthread.php?t=133734">Forum</a>&nbsp;]</span></p>
                                    </div>
                                    <ul class="article-list">
                                <li>
                                    <a href="/politik/deutschland/fdp-kehrt-keine-sau-plakate-in-brandenburg-ins-positive-a-984996.html" title="&quot;Keine Sau&quot;-Plakate: FDP kehrt Anti-Kampagne in Brandenburg ins Positive"><span class="headline-intro">"Keine Sau"-Plakate:</span> <span class="headline">FDP kehrt Anti-Kampagne in Brandenburg ins Positive</span></a></li>
                                <li>
                                    <a href="/politik/ausland/islamischer-staat-im-irak-lage-der-jesiden-wird-immer-bedrohlicher-a-984873.html" title="Terrormiliz IS im Irak: Zehntausende Jesiden im Gebirge eingeschlossen"><span class="headline-intro">Terrormiliz IS im Irak:</span> <span class="headline">Zehntausende Jesiden im Gebirge eingeschlossen</span></a></li>
                                <li>
                                    <a href="/politik/ausland/russland-vizeminister-beljakow-nach-kritik-auf-facebook-gefeuert-a-984869.html" title="Kritik an Regierung: Russischer Vizeminister wegen Facebook-Eintrag gefeuert"><span class="headline-intro">Kritik an Regierung:</span> <span class="headline">Russischer Vizeminister wegen Facebook-Eintrag gefeuert</span></a></li>
                                </ul>

                        <div class="is-hidden" id="politik-Ids">-1,984971,984996,984873,984869</div>

                    </div><div class="commonpager-page ressort-slide"><div class="load-icon"><img src="/static/sys/v10/icons/ani-loader_small.gif" alt="loading..." /></div></div>
                    <div class="commonpager-page ressort-slide"><div class="load-icon"><img src="/static/sys/v10/icons/ani-loader_small.gif" alt="loading..." /></div></div>
                </div><div class="clearfix commonpager-indicator"></div>
            </div></div><div class="column-small"><ul class="js-ressort-content">
                <li>
                            <div class="article-image-box box-position hpcolumnressort">
                                        <a href="/politik/deutschland/wahl-o-mat-sachsen-2014-wen-sie-wirklich-waehlen-wollen-a-984383.html" title="Wahl-O-Mat 2014: Wen Sie in Sachsen wählen wollen"><img src="/static/sys/dimensionspixel.gif" data-original="http://cdn2.spiegel.de/images/image-732065-hpcolumnressort-mocm.jpg" width="230" height="110" border="0" class="js-lazy" title="" alt="" /></a></div>
                                <a href="/politik/deutschland/wahl-o-mat-sachsen-2014-wen-sie-wirklich-waehlen-wollen-a-984383.html" title="Wahl-O-Mat 2014: Wen Sie in Sachsen wählen wollen"><span class="headline-intro">Wahl-O-Mat 2014:</span> <span class="headline">Wen Sie in Sachsen wählen wollen</span></a></li>
                    <li>
                            <div class="article-image-box box-position hpcolumnrightsquare">
                                        <a href="/politik/ausland/gaza-krieg-israelis-fuerchten-trotz-waffenruhe-angriffe-der-hamas-a-984775.html" title="Israel im Waffenstillstand: Die Panzer weichen, die Angst bleibt"><img src="/static/sys/dimensionspixel.gif" data-original="http://cdn2.spiegel.de/images/image-733665-hpcolumnrightsquare-uxxp.jpg" width="230" height="230" border="0" class="js-lazy" title="" alt="" /></a><div class="asset-credit">DPA</div>
                                        </div>
                                <a href="/politik/ausland/gaza-krieg-israelis-fuerchten-trotz-waffenruhe-angriffe-der-hamas-a-984775.html" title="Israel im Waffenstillstand: Die Panzer weichen, die Angst bleibt"><span class="headline-intro">Israel im Waffenstillstand:</span> <span class="headline">Die Panzer weichen, die Angst bleibt</span></a></li>
                    </ul>

            <div class="js-ressort-ad-politik" style="display:none;">
                    <script type="text/javascript">
                    <!--
                        OAS_RICH('RightPol');
                    // -->
                    </script>
                </div>
            </div></div></div><script type="text/javascript">
                                        <!--
                                        OAS_RICH('Middle2');
                                        // -->
                                        </script>
                                    <div class="clearfix module-box sport">

    <div class="ressort-teaser-box-header hp-gradient double-bottom-border clearfix">

        <p class="module-title block-bullet"><a href="/sport/#ref=ressortblock"> SPORT</a></p>
            <div class="ressort-teaser-box-nav">
<ul>
<li>
<a href="/sport/fussball/">Fußball</a>
</li>
<li>
<a href="/sport/fussball/a-842988.html">Liveticker</a>
</li>
<li>
<a href="/sport/fussball/a-851014.html">Champions League</a>
</li>
<li>
<a href="http://tippspiel.spiegel.de/">Tippspiel</a>
</li>
<li>
<a href="/sport/formel1/">Formel 1</a>
</li>
<li>
<a class="link-more" href="javascript:return false;">mehr</a>
<ul class="ressort-box-nav-sub">
<li>
<a href="/thema/tennis">Tennis</a>
</li>
<li>
<a href="/thema/radsport">Radsport</a>
</li>
<li>
<a href="/thema/basketball">Basketball</a>
</li>
<li>
<a href="/thema/handball">Handball</a>
</li>
<li>
<a href="/thema/boxen">Boxen</a>
</li>
<li>
<a href="/thema/">
<strong>alle Themen</strong>
</a>
</li>
</ul>
</li>
</ul>
</div></div><div class="clearfix ressort-teaser-box-body">

        <div class="column-wide"><div class="commonpager" data-commonpager-beforeslide="spHpSlideBox" data-enable-touch="false" data-commonpager-callback="spHpSlideBoxCallback" >
                <div class="commonpager-pages">
                    <div class="commonpager-page first ressort-slide" rel="sport">

                        <div class="ressort-teaser-box-top">
                                        <div class="article-image-box box-position thumb asset-align-left">
        <div class="image-buttons-panel clearfix">
                    <a href="/sport/sonst/handball-niklas-landin-wechselt-von-rhein-neckar-loewen-zum-thw-kiel-a-984974.html" title="Handball-Coup: THW Kiel holt Weltklasse-Torwart Landin"><img src="/static/sys/dimensionspixel.gif" data-original="http://cdn4.spiegel.de/images/image-734077-thumb-rexu.jpg" width="180" height="180" border="0" class="js-lazy" title="Handball-Coup: THW Kiel holt Weltklasse-Torwart Landin" alt="Handball-Coup: THW Kiel holt Weltklasse-Torwart Landin" /></a><span class="image-buttons">
                        </span>
                </div>
            </div><h2 class="article-title">
    <a href="/sport/sonst/handball-niklas-landin-wechselt-von-rhein-neckar-loewen-zum-thw-kiel-a-984974.html" title="Handball-Coup: THW Kiel holt Weltklasse-Torwart Landin"><span class="headline-intro">Handball-Coup</span> <span class="headline">THW Kiel holt Weltklasse-Torwart Landin</span></a></h2><p>Spektakulärer Transfer in der Handball-Bundesliga: Der dänische Nationaltorhüter Niklas Landin wechselt im kommenden Jahr ablösefrei von den Rhein-Neckar Löwen nach Kiel. Dafür wird ein Schwede den THW wohl verlassen müssen. <a href="/sport/sonst/handball-niklas-landin-wechselt-von-rhein-neckar-loewen-zum-thw-kiel-a-984974.html" title="Handball-Coup: THW Kiel holt Weltklasse-Torwart Landin">mehr...</a> <span class="spInteractionMarks video-forum-bracket">[&nbsp;<a href="http://forum.spiegel.de/showthread.php?t=133732">Forum</a>&nbsp;]</span></p>
                                    </div>
                                    <ul class="article-list">
                                <li>
                                    <a href="/sport/fussball/ilir-azemi-von-greuther-fuerth-nach-unfall-im-krankenhaus-a-984962.html" title="2. Fußball-Bundesliga: Fürth-Profi Azemi nach Unfall im Krankenhaus"><span class="headline-intro">2. Fußball-Bundesliga:</span> <span class="headline">Fürth-Profi Azemi nach Unfall im Krankenhaus</span></a></li>
                                <li>
                                    <a href="/sport/fussball/transfers-und-geruechte-vfl-wolfsburg-vor-verpflichtung-von-guilavogui-a-984946.html" title="+++ Fußball-Transferticker +++: Di Maria ist PSG zu teuer"><span class="headline-intro">+++ Fußball-Transferticker +++:</span> <span class="headline">Di Maria ist PSG zu teuer</span></a></li>
                                <li>
                                    <a href="/sport/fussball/trainer-christian-streich-vom-sc-freiburg-im-interview-a-983969.html" title="Freiburgs Trainer Christian Streich: &quot;Kein Frustrationsgefühl, wirklich nicht&quot;"><span class="headline-intro">Freiburgs Trainer Christian Streich:</span> <span class="headline">"Kein Frustrationsgefühl, wirklich nicht"</span></a></li>
                                </ul>

                        <div class="is-hidden" id="sport-Ids">-1,984974,984962,984946,983969</div>

                    </div><div class="commonpager-page ressort-slide"><div class="load-icon"><img src="/static/sys/v10/icons/ani-loader_small.gif" alt="loading..." /></div></div>
                    <div class="commonpager-page ressort-slide"><div class="load-icon"><img src="/static/sys/v10/icons/ani-loader_small.gif" alt="loading..." /></div></div>
                </div><div class="clearfix commonpager-indicator"></div>
            </div></div><div class="column-small"><ul class="js-ressort-content">
                <li>
                            <div class="article-image-box box-position hpcolumnressort">
                                        <a href="/sport/formel1/ecclestone-prozess-und-die-folgen-fuer-die-formel-1-a-984517.html" title="Formel-1-Boss Ecclestone: Der Alleinherrscher"><img src="/static/sys/dimensionspixel.gif" data-original="http://cdn4.spiegel.de/images/image-733027-hpcolumnressort-cnby.jpg" width="230" height="110" border="0" class="js-lazy" title="" alt="" /></a><div class="asset-credit">Getty Images</div>
                                        </div>
                                <a href="/sport/formel1/ecclestone-prozess-und-die-folgen-fuer-die-formel-1-a-984517.html" title="Formel-1-Boss Ecclestone: Der Alleinherrscher"><span class="headline-intro">Formel-1-Boss Ecclestone:</span> <span class="headline">Der Alleinherrscher</span></a></li>
                    <li>
                            <div class="article-image-box box-position hpcolumnressort">
                                        <a href="/sport/fussball/fussball-transfer-wechsel-von-wm-stars-wie-toni-kroos-und-luis-suarez-a-984602.html" title="Transfers von WM-Stars: Den müssen wir haben!"><img src="/static/sys/dimensionspixel.gif" data-original="http://cdn1.spiegel.de/images/image-732978-hpcolumnressort-sghb.jpg" width="230" height="110" border="0" class="js-lazy" title="" alt="" /></a><div class="asset-credit">DPA</div>
                                        </div>
                                <a href="/sport/fussball/fussball-transfer-wechsel-von-wm-stars-wie-toni-kroos-und-luis-suarez-a-984602.html" title="Transfers von WM-Stars: Den müssen wir haben!"><span class="headline-intro">Transfers von WM-Stars:</span> <span class="headline">Den müssen wir haben!</span></a></li>
                    </ul>

            <div class="js-ressort-ad-sport" style="display:none;">
                    <script type="text/javascript">
                    <!--
                        OAS_RICH('RightSpo');
                    // -->
                    </script>
                </div>
            </div></div></div>
                            <div class="ressort-teaser-box fussball fbtickerboxhp hp-hatching">
                                <div class="ressort-teaser-box-header hp-gradient clearfix">
                                    <span class="module-title">FUSSBALL</span>
                                    <ul class="fbtickerboxhp-nav-left">
                                        <li class="fbtickerlink liveticker">
                                            <a onclick="$(this).parent().parent().parent().parent().find('.fbtickerboxhpcontent').load('/staticgen/fussballticker/html/hpcontent.html').show();return false;" href="/sport/fussball/fussball-liveticker-tabellen-und-statistiken-a-839944.html#contest=elq">Liveticker</a>
                                        </li>

                                        <li class="fbtickerlink">
                                            <a href="/sport/fussball/fussball-liveticker-tabellen-und-statistiken-a-839944.html#contest=elq&amp;page=PAGE_MATCHPLAN">Spielplan</a>
                                        </li>

                                    </ul>
                                    <ul class="fbtickerboxhp-nav-right">
                                        <li>
                                            <a target="_blank" href="http://tippspiel.spiegel.de">Tippspiel</a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="fbtickerboxhpcontent popup-layer-skin-light" style="display:none"></div>
                            </div>

                            <div class="clearfix module-box wirtschaft">

    <div class="ressort-teaser-box-header hp-gradient double-bottom-border clearfix">

        <p class="module-title block-bullet"><a href="/wirtschaft/#ref=ressortblock"> WIRTSCHAFT</a></p>
                <p class="module-title no-bullet"><a href="http://boersen.manager-magazin.de/spon/#ref=ressortblock"> BÖRSE</a></p>
            <div class="ressort-teaser-box-nav">
<ul>
<li>
<a href="/thema/euro_krise_2010/">Euro-Krise</a>
</li>
<li>
<a href="/wirtschaft/service/">Verbraucher</a>
</li>
<li>
<a class="link-more" href="javascript:return false;">mehr</a>
<ul class="ressort-box-nav-sub">
<li>
<a href="/wirtschaft/unternehmen/">Unternehmen und Märkte</a>
</li>
<li>
<a href="/wirtschaft/soziales/">Staat und Soziales</a>
</li>
<li>
<a href="/thema/lebensmittelindustrie">Lebensmittelindustrie</a>
</li>
<li>
<a href="/thema/gesundheitssystem_deutschland">Gesundheitssystem</a>
</li>
<li>
<a href="/thema/energieversorgung">Energieversorgung</a>
</li>
<li>
<a href="/thema/">
<strong>alle Themen</strong>
</a>
</li>
</ul>
</li>
</ul>
</div></div><div class="clearfix ressort-teaser-box-body">

        <div class="column-wide"><div class="commonpager" data-commonpager-beforeslide="spHpSlideBox" data-enable-touch="false" data-commonpager-callback="spHpSlideBoxCallback" >
                <div class="commonpager-pages">
                    <div class="commonpager-page first ressort-slide" rel="wirtschaft">

                        <div class="ressort-teaser-box-top">
                                        <div class="article-image-box box-position thumb asset-align-left">
        <div class="image-buttons-panel clearfix">
                    <a href="/wirtschaft/unternehmen/telekom-sprint-iliad-t-mobile-us-mit-gewinnen-offerte-scheiterte-a-984923.html" title="Halbjahresbilanz: Starkes US-Geschäft erhöht Telekom-Gewinn"><img src="/static/sys/dimensionspixel.gif" data-original="http://cdn4.spiegel.de/images/image-733957-thumb-oxur.jpg" width="180" height="180" border="0" class="js-lazy" title="Halbjahresbilanz: Starkes US-Geschäft erhöht Telekom-Gewinn" alt="Halbjahresbilanz: Starkes US-Geschäft erhöht Telekom-Gewinn" /></a><span class="image-buttons">
                        </span>
                </div>
            </div><h2 class="article-title">
    <a href="/wirtschaft/unternehmen/telekom-sprint-iliad-t-mobile-us-mit-gewinnen-offerte-scheiterte-a-984923.html" title="Halbjahresbilanz: Starkes US-Geschäft erhöht Telekom-Gewinn"><span class="headline-intro">Halbjahresbilanz</span> <span class="headline">Starkes US-Geschäft erhöht Telekom-Gewinn</span></a></h2><p>Der Verkauf der US-Mobilfunktochter ist vorerst geplatzt, doch das Geschäft in Amerika bringt ordentlich Geld in die Kasse der Telekom. Der Konzern konnte seinen Gewinn im ersten Halbjahr deutlich steigern. <a href="/wirtschaft/unternehmen/telekom-sprint-iliad-t-mobile-us-mit-gewinnen-offerte-scheiterte-a-984923.html" title="Halbjahresbilanz: Starkes US-Geschäft erhöht Telekom-Gewinn">mehr...</a> <span class="spInteractionMarks video-forum-bracket">[&nbsp;<a href="http://forum.spiegel.de/showthread.php?t=133719">Forum</a>&nbsp;]</span></p>
                                    </div>
                                    <ul class="article-list">
                                <li>
                                    <a href="/wirtschaft/soziales/russland-veroeffentlicht-liste-zu-import-verbot-aus-eu-und-usa-a-984924.html" title="Putins Gegensanktionen: Kreml verbietet Einfuhr von Fleisch, Milch, Obst aus dem Westen"><span class="headline-intro">Putins Gegensanktionen:</span> <span class="headline">Kreml verbietet Einfuhr von Fleisch, Milch, Obst aus dem Westen</span></a></li>
                                <li>
                                    <a href="/wirtschaft/unternehmen/rheinmetall-gibt-nach-gestopptem-deal-mit-russland-gewinnwarnung-a-984885.html" title="Gestoppter Russland-Deal: Rheinmetall will Entschädigung vom Bund"><span class="headline-intro">Gestoppter Russland-Deal:</span> <span class="headline">Rheinmetall will Entschädigung vom Bund</span></a></li>
                                <li>
                                    <a href="/wirtschaft/unternehmen/dfb-streit-ueber-markenschutz-fuer-adler-wappen-real-verliert-a-984903.html" title="Real-Supermärkte unterliegen: DFB gewinnt vorerst Streit um Adler-Wappen"><span class="headline-intro">Real-Supermärkte unterliegen:</span> <span class="headline">DFB gewinnt vorerst Streit um Adler-Wappen</span></a></li>
                                </ul>

                        <div class="is-hidden" id="wirtschaft-Ids">-1,984923,984924,984885,984903</div>

                    </div><div class="commonpager-page ressort-slide"><div class="load-icon"><img src="/static/sys/v10/icons/ani-loader_small.gif" alt="loading..." /></div></div>
                    <div class="commonpager-page ressort-slide"><div class="load-icon"><img src="/static/sys/v10/icons/ani-loader_small.gif" alt="loading..." /></div></div>
                </div><div class="clearfix commonpager-indicator"></div>
            </div></div><div class="column-small"><ul class="js-ressort-content">
                <li>
                            <div class="article-image-box box-position hpcolumnressort">
                                        <a href="/wirtschaft/soziales/vergeltung-fuer-sanktionen-putins-schadet-russlands-wirtschaft-a-984847.html" title="Vergeltung für Sanktionen: Putin verhängt Importstopp - und schadet Russlands Bürgern"><img src="/static/sys/dimensionspixel.gif" data-original="http://cdn4.spiegel.de/images/image-733583-hpcolumnressort-xexh.jpg" width="230" height="110" border="0" class="js-lazy" title="" alt="" /></a><div class="asset-credit">AP</div>
                                        </div>
                                <a href="/wirtschaft/soziales/vergeltung-fuer-sanktionen-putins-schadet-russlands-wirtschaft-a-984847.html" title="Vergeltung für Sanktionen: Putin verhängt Importstopp - und schadet Russlands Bürgern"><span class="headline-intro">Vergeltung für Sanktionen:</span> <span class="headline">Putin verhängt Importstopp - und schadet Russlands Bürgern</span></a></li>
                    <li>
                            <div class="article-image-box box-position hpcolumnressort">
                                        <a href="/wirtschaft/soziales/sovaldi-warum-eine-pille-700-euro-kosten-darf-a-984738.html" title="700-Euro-Pille von Sovaldi: &quot;Unmoralische Gewinnzahlen&quot;"><img src="/static/sys/dimensionspixel.gif" data-original="http://cdn2.spiegel.de/images/image-733591-hpcolumnressort-xjhu.jpg" width="230" height="110" border="0" class="js-lazy" title="" alt="" /></a><div class="asset-credit">AP/Gilead Sciences</div>
                                        </div>
                                <a href="/wirtschaft/soziales/sovaldi-warum-eine-pille-700-euro-kosten-darf-a-984738.html" title="700-Euro-Pille von Sovaldi: &quot;Unmoralische Gewinnzahlen&quot;"><span class="headline-intro">700-Euro-Pille von Sovaldi:</span> <span class="headline">"Unmoralische Gewinnzahlen"</span></a></li>
                    </ul>

            <div class="js-ressort-ad-wirtschaft" style="display:none;">
                    <script type="text/javascript">
                    <!--
                        OAS_RICH('RightWir');
                    // -->
                    </script>
                </div>
            </div></div></div><div class="boersenboxhp hp-gradient clearfix">
    <div class="boersenbox-header clearfix">
        <span class="module-title">BÖRSE</span>
        <div class="boersenbox-suche">
            <form action="http://boersen.manager-magazin.de/spo_mmo/kurse_einzelkurs_suche.htm" class="search-form-single" method="post">
                <input name="sektion" type="hidden" value="suche"/>
                <input name="button" type="hidden" value="Alles"/>
                <input name="suchbegriff" placeholder="Kurse abfragen" type="text"/>
                <input class="search-form-submit" type="submit" value="Kurse abfragen"/>
            </form>
        </div>
    </div>
    <div class="boersenbox-table">

                <div class="borsenboxhp-table">
                    <table cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <th class="time">15:28 Uhr</th>
                            <th>Kurs</th>
                            <th>absolut</th>
                            <th class="last">in %</th>
                        </tr>

                        <tr class="data active" data-chart="/staticgen/boerse/spv10dax320x97.gif">
                            <td><a href="http://boersen.manager-magazin.de/spon/indizes_listen.htn?i=159096" target="Boerse">DAX</a></td>
                            <td align="right">9.126,79</td>
                            <td align="right">-3,25</td>
                            <td align="right" class="spNumberNegative last">-0,04</td>
                        </tr>

                        <tr class="data" data-chart="/staticgen/boerse/spv10mdax320x97.gif">
                            <td><a href="http://boersen.manager-magazin.de/spon/indizes_listen.htn?i=159090" target="Boerse">MDax</a></td>
                            <td align="right">15.402,98</td>
                            <td align="right">+17,46</td>
                            <td align="right" class="spNumberPositive last">0,11</td>
                        </tr>

                        <tr class="data" data-chart="/staticgen/boerse/spv10tdxp320x97.gif">
                            <td><a href="http://boersen.manager-magazin.de/spon/indizes_listen.htn?i=158375" target="Boerse">TecDax</a></td>
                            <td align="right">1.171,08</td>
                            <td align="right">+0,44</td>
                            <td align="right" class="spNumberPositive last">0,04</td>
                        </tr>

                        <tr class="data" data-chart="/staticgen/boerse/spv10dji320x97.gif">
                            <td><a href="http://boersen.manager-magazin.de/spon/indizes_listen.htn?i=2303555" target="Boerse">Dow</a></td>
                            <td align="right">16.443,34</td>
                            <td align="right">+13,87</td>
                            <td align="right" class="spNumberPositive last">0,08</td>
                        </tr>

                    </table>
                </div>

        <div class="link-right">
<a href="http://boersen.manager-magazin.de/spo_mmo/index.htm">Mehr Kurse</a>
</div>
    </div>
    <div class="boersenbox-chart">
        <a href="http://boersen.manager-magazin.de/spo_mmo/kurse_listen.htm?sektion=dax" title="Dax">
            <img alt="Chart Dax" border="0" height="97" src="/staticgen/boerse/spv10dax320x97.gif" width="320"/>
        </a>
    </div>
    <div class="boersenbox-links">
        <style>
.boersenbox-links{margin-top:-15px;}
</style>
<b>Weitere Kurse:</b><br>
<b><a target="Boerse" href="http://boersen.manager-magazin.de/spo_mmo/kurse_einzelkurs_uebersicht.htm?u=0&amp;p=0&amp;k=0&amp;l=826&amp;s=USDGOLPM.LFIX&amp;b=401&amp;n=Gold%20PM">Gold</a> |

<a target="Boerse" href="http://boersen.manager-magazin.de/spo_mmo/kurse_einzelkurs_uebersicht.htm?s=EUR&amp;b=691&amp;l=276&amp;n=EUR/USD%20SPOT&u=0&amp;p=0&amp;k=0">Euro/USD</a> |

<a target="Boerse" href="http://boersen.manager-magazin.de/spo_mmo/kurse_einzelkurs_uebersicht.htm?u=0&amp;p=0&amp;k=0&amp;s=BRENTDAT.RSM&amp;b=400&amp;l=276&n=Brent%20Oil%20Spot&amp;sektion=energie">Öl</a>
</b>
<br/><br/>

<ul>
<li>
<a href="http://boersen.manager-magazin.de/spo_mmo/index.htm" target="Boerse">Chart</a>
</li>
<li>
<a href="http://boersen.manager-magazin.de/spo_mmo/news.htm" target="Boerse">News</a>
</li>
<li>
<a href="http://www.spiegel.de/flash/0,5532,19276,00.html" onclick="window.open('http://www.spiegel.de/flash/0,5532,19276,00.html','SPONflash19276','width=730,height=600'+SpOnENV_FlashPopupParams).focus(); return false;" target="SPONflash19276">Parkettkamera</a>
</li>
</ul>
    </div>

    <script type="text/javascript">
    <!--
        $(".boersenbox-table table tr.data").each( function() {
            var $row = $(this);
            $row.mouseover(
                function() {
                    $(".boersenbox-table table tr.active").removeClass("active");
                    $row.addClass('active');
                    $('.boersenbox-chart a').attr("href", $row.find('a').first().attr("href"));
                    $('.boersenbox-chart a').attr("title", $row.find('a').first().text());
                    $('.boersenbox-chart img').attr("src", $row.attr("data-chart"));
                    $('.boersenbox-chart img').attr("alt", "Chart " + $row.find('a').first().text());
                }
            );
        })
    // -->
    </script>
</div><div class="clearfix module-box uniundschule">

    <div class="ressort-teaser-box-header hp-gradient double-bottom-border clearfix">

        <p class="module-title block-bullet"><a href="/unispiegel/#ref=ressortblock"> UNISPIEGEL</a></p>
                <p class="module-title no-bullet"><a href="/schulspiegel/#ref=ressortblock"> SCHULSPIEGEL</a></p>
            <div class="ressort-teaser-box-nav">
<ul>
<li>
<a href="/unispiegel/jobundberuf/">Job & Beruf</a>
</li>
<li>
<a class="link-more" href="javascript:return false;">mehr</a>
<ul class="ressort-box-nav-sub">
<li>
<a href="/unispiegel/studium/">Studium</a>
</li>
<li>
<a href="/unispiegel/wunderbar/">Wunderbar</a>
</li>
<li>
<a href="/schulspiegel/abi/">Abi - und dann?</a>
</li>
<li>
<a href="/schulspiegel/ausland/">Querweltein</a>
</li>
<li>
<a href="/schulspiegel/leben/">Leben U21</a>
</li>
<li>
<a href="/schulspiegel/wissen/">Wissen</a>
</li>
<li>
<a href="/thema/">
<strong>alle Themen</strong>
</a>
</li>
</ul>
</li>
</ul>
</div></div><div class="clearfix ressort-teaser-box-body">

        <div class="column-wide"><div class="commonpager" data-commonpager-beforeslide="spHpSlideBox" data-enable-touch="false" data-commonpager-callback="spHpSlideBoxCallback" >
                <div class="commonpager-pages">
                    <div class="commonpager-page first ressort-slide" rel="uniundschule">

                        <div class="ressort-teaser-box-top">
                                        <div class="article-image-box box-position thumb asset-align-left">
        <div class="image-buttons-panel clearfix">
                    <a href="/schulspiegel/markus-kavka-ein-interview-uebers-aelterwerden-musik-und-mtv-a-979087.html" title="Markus Kavka übers Altwerden: &quot;Ich mach's mir lustig&quot;"><img src="/static/sys/dimensionspixel.gif" data-original="http://cdn4.spiegel.de/images/image-724737-thumb-qrbq.jpg" width="180" height="180" border="0" class="js-lazy" title="Markus Kavka übers Altwerden: &quot;Ich mach's mir lustig&quot;" alt="Markus Kavka übers Altwerden: &quot;Ich mach's mir lustig&quot;" /></a><span class="image-buttons">
                        </span>
                </div>
            </div><h2 class="article-title">
    <a href="/schulspiegel/markus-kavka-ein-interview-uebers-aelterwerden-musik-und-mtv-a-979087.html" title="Markus Kavka übers Altwerden: &quot;Ich mach's mir lustig&quot;"><span class="headline-intro">Markus Kavka übers Altwerden</span> <span class="headline">"Ich mach's mir lustig"</span></a></h2><p>Was macht das Gesicht einer Generation, wenn es älter wird? Ein Gespräch mit Ex-MTV-Mann Markus Kavka, 47, übers Erwachsenwerden, Verlobungen, gute Musik und Zweisamkeit mit Madonna. <span class="author">Ein Interview von Paul Andrä und Erik Dabbert</span> <a href="/schulspiegel/markus-kavka-ein-interview-uebers-aelterwerden-musik-und-mtv-a-979087.html" title="Markus Kavka übers Altwerden: &quot;Ich mach's mir lustig&quot;">mehr...</a> <span class="spInteractionMarks video-forum-bracket">[&nbsp;<a href="http://forum.spiegel.de/showthread.php?t=133688">Forum</a>&nbsp;]</span></p>
                                    </div>
                                    <ul class="article-list">
                                <li>
                                    <a href="/schulspiegel/wissen/digital-natives-jugendliche-verstehen-mehr-von-digitaler-technik-a-984913.html" title="Jugend und digitale Technik: Wir Scheibenwischer"><span class="headline-intro">Jugend und digitale Technik:</span> <span class="headline">Wir Scheibenwischer</span></a></li>
                                <li>
                                    <a href="/unispiegel/jobundberuf/lehrergestaendnisse-ueber-die-angst-schueler-in-der-freizeit-zu-treffen-a-981015.html" title="Lehrergeständnisse: Ich fürchte mich vor meinen Schülern"><span class="headline-intro">Lehrergeständnisse:</span> <span class="headline">Ich fürchte mich vor meinen Schülern</span></a></li>
                                <li>
                                    <a href="/unispiegel/wunderbar/breaking-bad-beraterin-donna-nelson-erklaert-wie-im-interview-a-981704.html" title="Chemieberaterin bei &quot;Breaking Bad&quot;: &quot;Blaues Meth? Das geht nicht&quot;"><span class="headline-intro">Chemieberaterin bei "Breaking Bad":</span> <span class="headline">"Blaues Meth? Das geht nicht"</span></a></li>
                                </ul>

                        <div class="is-hidden" id="uniundschule-Ids">-1,979087,984913,981015,981704</div>

                    </div><div class="commonpager-page ressort-slide"><div class="load-icon"><img src="/static/sys/v10/icons/ani-loader_small.gif" alt="loading..." /></div></div>
                    <div class="commonpager-page ressort-slide"><div class="load-icon"><img src="/static/sys/v10/icons/ani-loader_small.gif" alt="loading..." /></div></div>
                </div><div class="clearfix commonpager-indicator"></div>
            </div></div><div class="column-small"><ul class="js-ressort-content">
                <li>
                            <div class="article-image-box box-position hpcolumnressort">
                                        <a href="/schulspiegel/wissen/abitur-klausuren-einsehen-ist-wegen-sperrfristen-schwerer-als-gedacht-a-978301.html" title="Späte Abi-Einsicht: Was habe ich da nur verzapft?"><img src="/static/sys/dimensionspixel.gif" data-original="http://cdn3.spiegel.de/images/image-717316-hpcolumnressort-tnhz.jpg" width="230" height="110" border="0" class="js-lazy" title="" alt="" /></a><div class="asset-credit">Steve Przybilla</div>
                                        </div>
                                <a href="/schulspiegel/wissen/abitur-klausuren-einsehen-ist-wegen-sperrfristen-schwerer-als-gedacht-a-978301.html" title="Späte Abi-Einsicht: Was habe ich da nur verzapft?"><span class="headline-intro">Späte Abi-Einsicht:</span> <span class="headline">Was habe ich da nur verzapft?</span></a></li>
                    <li>
                            <div class="article-image-box box-position hpcolumnressort">
                                        <a href="/unispiegel/jobundberuf/lehrergestaendnisse-ueber-die-angst-schueler-in-der-freizeit-zu-treffen-a-981015.html" title="Lehrergeständnisse: Ich fürchte mich vor meinen Schülern"><img src="/static/sys/dimensionspixel.gif" data-original="http://cdn3.spiegel.de/images/image-212622-hpcolumnressort-edla.jpg" width="230" height="110" border="0" class="js-lazy" title="" alt="" /></a><div class="asset-credit">Corbis</div>
                                        </div>
                                <a href="/unispiegel/jobundberuf/lehrergestaendnisse-ueber-die-angst-schueler-in-der-freizeit-zu-treffen-a-981015.html" title="Lehrergeständnisse: Ich fürchte mich vor meinen Schülern"><span class="headline-intro">Lehrergeständnisse:</span> <span class="headline">Ich fürchte mich vor meinen Schülern</span></a></li>
                    </ul>

            <div class="js-ressort-ad-uniundschule" style="display:none;">
                    <script type="text/javascript">
                    <!--
                        OAS_RICH('RightUni');
                    // -->
                    </script>
                </div>
            </div></div></div><script type="text/javascript">
                                        <!--
                                        OAS_RICH('Middle3');
                                        // -->
                                        </script>
                                    <div class="clearfix module-box wissenschaft">

    <div class="ressort-teaser-box-header hp-gradient double-bottom-border clearfix">

        <p class="module-title block-bullet"><a href="/wissenschaft/#ref=ressortblock"> WISSENSCHAFT</a></p>
            <div class="ressort-teaser-box-nav">
<ul>
<li>
<a href="/wissenschaft/medizin/">Medizin</a>
</li>
<li>
<a href="/wissenschaft/technik/">Technik</a>
</li>
<li>
<a href="/thema/klimawandel">Klimawandel</a>
</li>
<li>
<a class="link-more" href="javascript:return false;">mehr</a>
<ul class="ressort-box-nav-sub">
<li>
<a href="/wissenschaft/weltall/">Weltall</a>
</li>
<li>
<a href="/wissenschaft/natur/">Natur</a>
</li>
<li>
<a href="/thema/ernaehrung">Ernährung</a>
</li>
<li>
<a href="/thema/archaeologie">Archäologie</a>
</li>
<li>
<a href="/thema/evolution">Evolution</a>
</li>
<li>
<a href="/thema/genforschung">Genforschung</a>
</li>
<li>
<a href="/thema/">
<strong>alle Themen</strong>
</a>
</li>
</ul>
</li>
</ul>
</div></div><div class="clearfix ressort-teaser-box-body">

        <div class="column-wide"><div class="commonpager" data-commonpager-beforeslide="spHpSlideBox" data-enable-touch="false" data-commonpager-callback="spHpSlideBoxCallback" >
                <div class="commonpager-pages">
                    <div class="commonpager-page first ressort-slide" rel="wissenschaft">

                        <div class="ressort-teaser-box-top">
                                        <div class="article-image-box box-position hppano asset-align-center">
        <div class="image-buttons-panel clearfix">
                    <a href="/wissenschaft/natur/parasiten-bussarde-auf-galapagosinseln-vererben-laeuse-a-984944.html" title="Galapagosbussard: Die Läuse bleiben in der Familie"><img src="/static/sys/dimensionspixel.gif" data-original="http://cdn2.spiegel.de/images/image-733909-hppano-wgvt.jpg" width="610" height="293" border="0" class="js-lazy" title="Galapagosbussard: Die Läuse bleiben in der Familie" alt="Galapagosbussard: Die Läuse bleiben in der Familie" /></a><span class="image-buttons">
                        </span>
                </div>
            </div><h2 class="article-title">
    <a href="/wissenschaft/natur/parasiten-bussarde-auf-galapagosinseln-vererben-laeuse-a-984944.html" title="Galapagosbussard: Die Läuse bleiben in der Familie"><span class="headline-intro">Galapagosbussard</span> <span class="headline">Die Läuse bleiben in der Familie</span></a></h2><p>Nicht nur Gene lassen sich vererben, sondern auch Ungeziefer, zeigt eine Studie. Galapagosbussarde geben neben ihren eigenen Genen auch gleich ihre Lauspopulation an den Nachwuchs weiter. <a href="/wissenschaft/natur/parasiten-bussarde-auf-galapagosinseln-vererben-laeuse-a-984944.html" title="Galapagosbussard: Die Läuse bleiben in der Familie">mehr...</a> <span class="spInteractionMarks video-forum-bracket">[&nbsp;<a href="http://forum.spiegel.de/showthread.php?t=133728">Forum</a>&nbsp;]</span></p>
                                    </div>
                                    <ul class="article-list">
                                <li>
                                    <a href="/wissenschaft/mensch/kuh-fuer-den-wagen-wildrind-in-zuchtpopulation-eingekreuzt-a-984914.html" title="Zucht in der Jungsteinzeit: Welche Kuh passt vor den Wagen?"><span class="headline-intro">Zucht in der Jungsteinzeit:</span> <span class="headline">Welche Kuh passt vor den Wagen?</span></a></li>
                                <li>
                                    <a href="/wissenschaft/weltall/nasa-test-revolutionaerer-raketenantrieb-liefert-schub-ohne-sprit-a-984520.html" title="Revolutionärer Raketenantrieb: Schub ohne Sprit"><span class="headline-intro">Revolutionärer Raketenantrieb:</span> <span class="headline">Schub ohne Sprit</span></a></li>
                                <li>
                                    <a href="/wissenschaft/natur/quecksilber-hg-gehalt-in-den-ozeanen-steigt-massiv-an-a-984829.html" title="Umweltgifte: Quecksilbergehalt der Ozeane ist massiv angestiegen"><span class="headline-intro">Umweltgifte:</span> <span class="headline">Quecksilbergehalt der Ozeane ist massiv angestiegen</span></a></li>
                                </ul>

                        <div class="is-hidden" id="wissenschaft-Ids">-1,984944,984914,984520,984829</div>

                    </div><div class="commonpager-page ressort-slide"><div class="load-icon"><img src="/static/sys/v10/icons/ani-loader_small.gif" alt="loading..." /></div></div>
                    <div class="commonpager-page ressort-slide"><div class="load-icon"><img src="/static/sys/v10/icons/ani-loader_small.gif" alt="loading..." /></div></div>
                </div><div class="clearfix commonpager-indicator"></div>
            </div></div><div class="column-small"><ul class="js-ressort-content">
                <li>
                            <div class="article-image-box box-position hpcolumnressort">
                                        <a href="/wissenschaft/weltall/kometenlandung-rosetta-hat-umlaufbahn-von-komet-tschuri-erreicht-a-984698.html" title="Geplante Kometenlandung: Raumsonde hat Tschuris Umlaufbahn erreicht"><img src="/static/sys/dimensionspixel.gif" data-original="http://cdn2.spiegel.de/images/image-730771-hpcolumnressort-mplm.jpg" width="230" height="110" border="0" class="js-lazy" title="" alt="" /></a><div class="asset-credit">DLR</div>
                                        </div>
                                <a href="/wissenschaft/weltall/kometenlandung-rosetta-hat-umlaufbahn-von-komet-tschuri-erreicht-a-984698.html" title="Geplante Kometenlandung: Raumsonde hat Tschuris Umlaufbahn erreicht"><span class="headline-intro">Geplante Kometenlandung:</span> <span class="headline">Raumsonde hat Tschuris Umlaufbahn erreicht</span></a></li>
                    <li>
                            <div class="article-image-box box-position hpcolumnrightsquare">
                                        <a href="/wissenschaft/mensch/psycho-test-unnoetig-narzissten-sind-an-einer-frage-erkennbar-a-984588.html" title="Statt Psychotest: Einzelne Frage verrät Narzissten"><img src="/static/sys/dimensionspixel.gif" data-original="http://cdn3.spiegel.de/images/image-733296-hpcolumnrightsquare-xurg.jpg" width="230" height="230" border="0" class="js-lazy" title="" alt="" /></a><div class="asset-credit">Corbis</div>
                                        </div>
                                <a href="/wissenschaft/mensch/psycho-test-unnoetig-narzissten-sind-an-einer-frage-erkennbar-a-984588.html" title="Statt Psychotest: Einzelne Frage verrät Narzissten"><span class="headline-intro">Statt Psychotest:</span> <span class="headline">Einzelne Frage verrät Narzissten</span></a></li>
                    </ul>

            <div class="js-ressort-ad-wissenschaft" style="display:none;">
                    <script type="text/javascript">
                    <!--
                        OAS_RICH('RightWis');
                    // -->
                    </script>
                </div>
            </div></div></div><div class="clearfix module-box gesundheit">

    <div class="ressort-teaser-box-header hp-gradient double-bottom-border clearfix">

        <p class="module-title block-bullet"><a href="/gesundheit/#ref=ressortblock"> GESUNDHEIT</a></p>
            <div class="ressort-teaser-box-nav">
<ul>
<li>
<a href="/gesundheit/diagnose/">Diagnose & Therapie</a>
</li>
<li>
<a href="/gesundheit/ernaehrung/">Ernährung & Fitness</a>
</li>
<li>
<a class="link-more" href="javascript:return false;">mehr</a>
<ul class="ressort-box-nav-sub">
<li>
<a href="/gesundheit/psychologie/">Psychologie</a>
</li>
<li>
<a href="/gesundheit/schwangerschaft/">Schwangerschaft & Kind</a>
</li>
<li>
<a href="/gesundheit/sex/">Sex & Partnerschaft</a>
</li>
<li>
<a href="/thema/">
<strong>alle Themen</strong>
</a>
</li>
</ul>
</li>
</ul>
</div></div><div class="clearfix ressort-teaser-box-body">

        <div class="column-wide"><div class="commonpager" data-commonpager-beforeslide="spHpSlideBox" data-enable-touch="false" data-commonpager-callback="spHpSlideBoxCallback" >
                <div class="commonpager-pages">
                    <div class="commonpager-page first ressort-slide" rel="gesundheit">

                        <div class="ressort-teaser-box-top">
                                        <div class="article-image-box box-position thumb asset-align-left">
        <div class="image-buttons-panel clearfix">
                    <a href="/gesundheit/sex/waxing-im-genitalbereich-ist-schmerzhaft-und-kritisch-zu-bewerten-a-984599.html" title="Enthaarung: &quot;Ich rate davon ab, den Genitalbereich zu waxen&quot;"><img src="/static/sys/dimensionspixel.gif" data-original="http://cdn3.spiegel.de/images/image-733336-thumb-glsy.jpg" width="180" height="180" border="0" class="js-lazy" title="Enthaarung: &quot;Ich rate davon ab, den Genitalbereich zu waxen&quot;" alt="Enthaarung: &quot;Ich rate davon ab, den Genitalbereich zu waxen&quot;" /></a><span class="image-buttons">
                        </span>
                </div>
            </div><h2 class="article-title">
    <a href="/gesundheit/sex/waxing-im-genitalbereich-ist-schmerzhaft-und-kritisch-zu-bewerten-a-984599.html" title="Enthaarung: &quot;Ich rate davon ab, den Genitalbereich zu waxen&quot;"><span class="headline-intro">Enthaarung</span> <span class="headline">"Ich rate davon ab, den Genitalbereich zu waxen"</span></a></h2><p>Rasierer sind out, heißes Wachs ist in. Im Interview spricht Dermatologe Volker Steinkraus über die Risiken von Waxing und erklärt, warum es durchaus sinnvoll ist, seine Schambehaarung zu trimmen. <a href="/gesundheit/sex/waxing-im-genitalbereich-ist-schmerzhaft-und-kritisch-zu-bewerten-a-984599.html" title="Enthaarung: &quot;Ich rate davon ab, den Genitalbereich zu waxen&quot;">mehr...</a> <span class="spInteractionMarks video-forum-bracket">[&nbsp;<a href="http://forum.spiegel.de/showthread.php?t=133622">Forum</a>&nbsp;]</span></p>
                                    </div>
                                    <ul class="article-list">
                                <li>
                                    <a href="/gesundheit/diagnose/brustkrebs-bei-dominique-bertinotti-das-thema-darf-kein-tabu-sein-a-982514.html" title="Diagnose Krebs: &quot;Je ne regrette rien&quot;"><span class="headline-intro">Diagnose Krebs:</span> <span class="headline">"Je ne regrette rien"</span></a></li>
                                <li>
                                    <a href="/gesundheit/diagnose/psa-test-screening-weniger-prostatakrebs-tote-viele-ueberdiagnosen-a-984605.html" title="Prostatakrebs-Screening: Vorsorge mit schweren Nebenwirkungen"><span class="headline-intro">Prostatakrebs-Screening:</span> <span class="headline">Vorsorge mit schweren Nebenwirkungen</span></a></li>
                                <li>
                                    <a href="/gesundheit/diagnose/ebola-epidemie-liberia-ruft-notstand-aus-a-984866.html" title="Ebola-Epidemie: Liberia ruft Notstand aus"><span class="headline-intro">Ebola-Epidemie:</span> <span class="headline">Liberia ruft Notstand aus</span></a></li>
                                </ul>

                        <div class="is-hidden" id="gesundheit-Ids">-1,984599,982514,984605,984866</div>

                    </div><div class="commonpager-page ressort-slide"><div class="load-icon"><img src="/static/sys/v10/icons/ani-loader_small.gif" alt="loading..." /></div></div>
                    <div class="commonpager-page ressort-slide"><div class="load-icon"><img src="/static/sys/v10/icons/ani-loader_small.gif" alt="loading..." /></div></div>
                </div><div class="clearfix commonpager-indicator"></div>
            </div></div><div class="column-small"><ul class="js-ressort-content">
                <li>
                            <div class="article-image-box box-position hpcolumnressort">
                                        <a href="/gesundheit/diagnose/bisphosphonat-assoziierte-kiefernekrose-das-hilft-bei-der-vorbeugung-a-979912.html" title="Osteoporose-Medikamente: Knochen gestärkt, Kiefer gefährdet"><img src="/static/sys/dimensionspixel.gif" data-original="http://cdn3.spiegel.de/images/image-474556-hpcolumnressort-bdlx.jpg" width="230" height="110" border="0" class="js-lazy" title="" alt="" /></a><div class="asset-credit">Corbis</div>
                                        </div>
                                <a href="/gesundheit/diagnose/bisphosphonat-assoziierte-kiefernekrose-das-hilft-bei-der-vorbeugung-a-979912.html" title="Osteoporose-Medikamente: Knochen gestärkt, Kiefer gefährdet"><span class="headline-intro">Osteoporose-Medikamente:</span> <span class="headline">Knochen gestärkt, Kiefer gefährdet</span></a></li>
                    <li>
                            <div class="article-image-box box-position hpcolumnressort">
                                        <a href="/gesundheit/ernaehrung/isotonische-und-elektrolyt-getraenke-was-man-bei-sport-trinken-sollte-a-982760.html" title="Flüssigkeitshaushalt: Die besten Durstlöscher für Sportler"><img src="/static/sys/dimensionspixel.gif" data-original="http://cdn1.spiegel.de/images/image-458060-hpcolumnressort-cfbf.jpg" width="230" height="110" border="0" class="js-lazy" title="" alt="" /></a><div class="asset-credit">Corbis</div>
                                        </div>
                                <a href="/gesundheit/ernaehrung/isotonische-und-elektrolyt-getraenke-was-man-bei-sport-trinken-sollte-a-982760.html" title="Flüssigkeitshaushalt: Die besten Durstlöscher für Sportler"><span class="headline-intro">Flüssigkeitshaushalt:</span> <span class="headline">Die besten Durstlöscher für Sportler</span></a></li>
                    </ul>

            <div class="js-ressort-ad-gesundheit" style="display:none;">
                    <script type="text/javascript">
                    <!--
                        OAS_RICH('RightGes');
                    // -->
                    </script>
                </div>
            </div></div></div><div class="clearfix module-box karriere">

    <div class="ressort-teaser-box-header hp-gradient double-bottom-border clearfix">

        <p class="module-title block-bullet"><a href="/karriere/#ref=ressortblock"> KARRIERESPIEGEL</a></p>
            <div class="ressort-teaser-box-nav">
<ul>
<li>
<a href="/karriere/berufsstart/">Berufsstart</a>
</li>
<li>
<a href="/karriere/berufsleben/">Berufsleben</a>
</li>
<li>
<a href="/karriere/ausland/">Ausland</a>
</li>
<li>
<a class="link-more" href="javascript:return false;">mehr</a>
<ul class="ressort-box-nav-sub">
<li>
<a href="/karriere/stellensuche/">Stellensuche</a>
</li>
<li>
<a href="/karriere/berufsleben/zeitfressermesser-so-verdaddeln-sie-ihre-arbeitszeit-a-809657.html" title="Zeitfressermesser" class="text-link-int">Zeitfressermesser</a>
</li>
<li>
<a href="/karriere/games/jobtitel-generator-neue-berufsbezeichungen-fuer-angeber-und-aufschneider-a-771682.html" title="Jobtitel-Bandit" class="text-link-int">Jobtitel-Bandit</a>
</li>
</ul>
</li>
</ul>
</div></div><div class="clearfix ressort-teaser-box-body">

        <div class="column-wide"><div class="commonpager" data-commonpager-beforeslide="spHpSlideBox" data-enable-touch="false" data-commonpager-callback="spHpSlideBoxCallback" >
                <div class="commonpager-pages">
                    <div class="commonpager-page first ressort-slide" rel="karriere">

                        <div class="ressort-teaser-box-top">
                                        <div class="article-image-box box-position thumb asset-align-left">
        <div class="image-buttons-panel clearfix">
                    <a href="/karriere/berufsleben/gehalt-bei-banken-deutsche-bank-toppt-sparkasse-a-984972.html" title="Personalkosten: Deutsche Bank zahlt am meisten"><img src="/static/sys/dimensionspixel.gif" data-original="http://cdn3.spiegel.de/images/image-383856-thumb-hgnb.jpg" width="180" height="180" border="0" class="js-lazy" title="Personalkosten: Deutsche Bank zahlt am meisten" alt="Personalkosten: Deutsche Bank zahlt am meisten" /></a><span class="image-buttons">
                        </span>
                </div>
            </div><h2 class="article-title">
    <a href="/karriere/berufsleben/gehalt-bei-banken-deutsche-bank-toppt-sparkasse-a-984972.html" title="Personalkosten: Deutsche Bank zahlt am meisten"><span class="headline-intro">Personalkosten</span> <span class="headline">Deutsche Bank zahlt am meisten</span></a></h2><p>Wenn's ums Geld geht, eher nicht Sparkasse. Auch wenn der Abstand seit der Finanzkrise schmilzt, sind die höchsten Gehälter noch immer bei der Deutschen Bank zu finden. Ähnlich gut zahlt nur ein Institut, das ohne Filialnetz auskommt. <span class="author">Von Arvid Kaiser</span> <a href="/karriere/berufsleben/gehalt-bei-banken-deutsche-bank-toppt-sparkasse-a-984972.html" title="Personalkosten: Deutsche Bank zahlt am meisten">mehr...</a> <span class="spInteractionMarks video-forum-bracket">[&nbsp;<a href="http://forum.spiegel.de/showthread.php?t=133733">Forum</a>&nbsp;]</span></p>
                                    </div>
                                    <ul class="article-list">
                                <li>
                                    <a href="/karriere/berufsleben/feierabend-jeder-fuenfte-zu-erschoepft-fuer-private-verpflichtungen-a-984816.html" title="Feierabend: Zu platt fürs Privatvergnügen"><span class="headline-intro">Feierabend:</span> <span class="headline">Zu platt fürs Privatvergnügen</span></a></li>
                                <li>
                                    <a href="/karriere/berufsleben/katzencafe-in-berlin-katzen-streicheln-und-kaffee-trinken-a-984096.html" title="Katzencafé: Einen Käsekuchen und eine Runde schmusen, bitte"><span class="headline-intro">Katzencafé:</span> <span class="headline">Einen Käsekuchen und eine Runde schmusen, bitte</span></a></li>
                                <li>
                                    <a href="/karriere/berufsleben/teilzeit-mit-flexiblen-stunden-was-laut-arbeitsrecht-erlaubt-ist-a-984369.html" title="Arbeitsrecht: Wie Chefs Teilzeit ausnutzen - und wie Sie sich wehren"><span class="headline-intro">Arbeitsrecht:</span> <span class="headline">Wie Chefs Teilzeit ausnutzen - und wie Sie sich wehren</span></a></li>
                                </ul>

                        <div class="is-hidden" id="karriere-Ids">-1,984972,984816,984096,984369</div>

                    </div><div class="commonpager-page ressort-slide"><div class="load-icon"><img src="/static/sys/v10/icons/ani-loader_small.gif" alt="loading..." /></div></div>
                    <div class="commonpager-page ressort-slide"><div class="load-icon"><img src="/static/sys/v10/icons/ani-loader_small.gif" alt="loading..." /></div></div>
                </div><div class="clearfix commonpager-indicator"></div>
            </div></div><div class="column-small"><ul class="js-ressort-content">
                <li>
                            <div class="article-image-box box-position hpcolumnressort">
                                        <a href="/karriere/ausland/massschuhmacherin-in-florenz-a-941529.html" title="Maßschuhmacherin: Ciao bella, ich hätte gerne einen Schuh von dir"><img src="/static/sys/dimensionspixel.gif" data-original="http://cdn2.spiegel.de/images/image-586025-hpcolumnressort-qojr.jpg" width="230" height="110" border="0" class="js-lazy" title="" alt="" /></a><div class="asset-credit">Alessandro Vecchi</div>
                                        </div>
                                <a href="/karriere/ausland/massschuhmacherin-in-florenz-a-941529.html" title="Maßschuhmacherin: Ciao bella, ich hätte gerne einen Schuh von dir"><span class="headline-intro">Maßschuhmacherin:</span> <span class="headline">Ciao bella, ich hätte gerne einen Schuh von dir</span></a></li>
                    <li>
                            <div class="article-image-box box-position hpcolumnressort">
                                        <a href="/karriere/berufsleben/burnout-selbstpruefung-riecht-s-schon-brenzlig-a-764586.html" title="Burnout-Selbstprüfung: Riecht's schon brenzlig?"><img src="/static/sys/dimensionspixel.gif" data-original="http://cdn2.spiegel.de/images/image-217765-hpcolumnressort-jlmw.jpg" width="230" height="110" border="0" class="js-lazy" title="" alt="" /></a><div class="asset-credit">Corbis</div>
                                        </div>
                                <a href="/karriere/berufsleben/burnout-selbstpruefung-riecht-s-schon-brenzlig-a-764586.html" title="Burnout-Selbstprüfung: Riecht's schon brenzlig?"><span class="headline-intro">Burnout-Selbstprüfung:</span> <span class="headline">Riecht's schon brenzlig?</span></a></li>
                    </ul>

            <div class="js-ressort-ad-karriere" style="display:none;">
                    <script type="text/javascript">
                    <!--
                        OAS_RICH('RightKar');
                    // -->
                    </script>
                </div>
            </div></div></div><div class="clearfix module-box kultur">

    <div class="ressort-teaser-box-header hp-gradient double-bottom-border clearfix">

        <p class="module-title block-bullet"><a href="/kultur/#ref=ressortblock"> KULTUR</a></p>
            <div class="ressort-teaser-box-nav">
<ul>
<li>
<a href="/kultur/kino/">Kino</a>
</li>
<li>
<a href="/kultur/musik/">Musik</a>
</li>
<li>
<a href="/kultur/tv/">TV</a>
</li>
<li>
<a class="link-more" href="javascript:return false;">mehr</a>
<ul class="ressort-box-nav-sub">
<li>
<a href="/thema/rezensionen">Rezensionen</a>
</li>
<li>
<a href="/thema/abgehoert">Abgehört</a>
</li>
<li>
<a href="/kultur/literatur/">Literatur</a>
</li>
<li>
<a href="/thema/tageskarte">KulturSPIEGEL-Tageskarte</a>
</li>
<li>
<a href="/thema/">
<strong>alle Themen</strong>
</a>
</li>
</ul>
</li>
</ul>
</div></div><div class="clearfix ressort-teaser-box-body">

        <div class="column-wide"><div class="commonpager" data-commonpager-beforeslide="spHpSlideBox" data-enable-touch="false" data-commonpager-callback="spHpSlideBoxCallback" >
                <div class="commonpager-pages">
                    <div class="commonpager-page first ressort-slide" rel="kultur">

                        <div class="ressort-teaser-box-top">
                                        <div class="article-image-box box-position thumb asset-align-left">
        <div class="image-buttons-panel clearfix">
                    <a href="/kultur/gesellschaft/the-shadow-chilly-gonzales-und-adam-traynor-auf-kampnagel-a-984807.html" title="&quot;The Shadow&quot; mit Gonzales: Die dunkle Seele eines stummen Dieners"><img src="/static/sys/dimensionspixel.gif" data-original="http://cdn3.spiegel.de/images/image-733392-thumb-ltjj.jpg" width="180" height="180" border="0" class="js-lazy" title="&quot;The Shadow&quot; mit Gonzales: Die dunkle Seele eines stummen Dieners" alt="&quot;The Shadow&quot; mit Gonzales: Die dunkle Seele eines stummen Dieners" /></a><span class="image-buttons">
                        </span>
                </div>
            </div><h2 class="article-title">
    <a href="/kultur/gesellschaft/the-shadow-chilly-gonzales-und-adam-traynor-auf-kampnagel-a-984807.html" title="&quot;The Shadow&quot; mit Gonzales: Die dunkle Seele eines stummen Dieners"><span class="headline-intro">"The Shadow" mit Gonzales</span> <span class="headline">Die dunkle Seele eines stummen Dieners</span></a></h2><p>Ein Schatten will Mensch werden: Das Sommerfest auf Kampnagel in Hamburg beginnt mit dem Märchen "The Shadow". Und das musikalische Multitalent Chilly Gonzales hat Musik dafür komponiert. Was für ein Ritt. <span class="author">Von Kristin Haug</span> <a href="/kultur/gesellschaft/the-shadow-chilly-gonzales-und-adam-traynor-auf-kampnagel-a-984807.html" title="&quot;The Shadow&quot; mit Gonzales: Die dunkle Seele eines stummen Dieners">mehr...</a> <span class="spInteractionMarks video-forum-bracket">[&nbsp;<a href="http://forum.spiegel.de/showthread.php?t=133729">Forum</a>&nbsp;]</span></p>
                                    </div>
                                    <ul class="article-list">
                                <li>
                                    <a href="/kultur/gesellschaft/selfies-von-drohnen-cremonesi-der-kuenstlergruppe-iocose-im-interview-a-984473.html" title="Selfies von Drohnen: Der Terrorjob ist erledigt, bin in der Bar"><span class="headline-intro">Selfies von Drohnen:</span> <span class="headline">Der Terrorjob ist erledigt, bin in der Bar</span></a></li>
                                <li>
                                    <a href="/kultur/kino/filmsatire-freiland-von-moritz-laube-ueber-deutsche-wutbuerger-a-984711.html" title="Politsatire &quot;Freiland&quot;: Der deutsche Beamte übt Revolution"><span class="headline-intro">Politsatire "Freiland":</span> <span class="headline">Der deutsche Beamte übt Revolution</span></a></li>
                                <li>
                                    <a href="/kultur/gesellschaft/perlentaucher-planet-der-affen-digitale-ueberwachung-erdogan-a-984888.html" title="Heute in den Feuilletons: Ein &quot;reinrassiger Türke&quot;"><span class="headline-intro">Heute in den Feuilletons:</span> <span class="headline">Ein "reinrassiger Türke"</span></a></li>
                                </ul>

                        <div class="is-hidden" id="kultur-Ids">-1,984807,984473,984711,984888</div>

                    </div><div class="commonpager-page ressort-slide"><div class="load-icon"><img src="/static/sys/v10/icons/ani-loader_small.gif" alt="loading..." /></div></div>
                    <div class="commonpager-page ressort-slide"><div class="load-icon"><img src="/static/sys/v10/icons/ani-loader_small.gif" alt="loading..." /></div></div>
                </div><div class="clearfix commonpager-indicator"></div>
            </div></div><div class="column-small"><ul class="js-ressort-content">
                <li>
                            <div class="article-image-box box-position hpcolumnressort">
                                        <a href="/kultur/musik/haldern-pop-livestream-mit-chet-faker-lee-fields-fink-conor-oberst-a-983779.html" title="Haldern Pop 2014: Live auf SPIEGEL ONLINE - ab Freitag"><img src="/static/sys/dimensionspixel.gif" data-original="http://cdn1.spiegel.de/images/image-731864-hpcolumnressort-tjpa.jpg" width="230" height="110" border="0" class="js-lazy" title="" alt="" /></a><div class="asset-credit">Stefan Dürr/ Haldern Pop</div>
                                        </div>
                                <a href="/kultur/musik/haldern-pop-livestream-mit-chet-faker-lee-fields-fink-conor-oberst-a-983779.html" title="Haldern Pop 2014: Live auf SPIEGEL ONLINE - ab Freitag"><span class="headline-intro">Haldern Pop 2014:</span> <span class="headline">Live auf SPIEGEL ONLINE - ab Freitag</span></a></li>
                    <li>
                            <div class="article-image-box box-position hpcolumnressort">
                                        <a href="/kultur/a-458623.html" title="Charts: Alle Bestsellerlisten im Überblick"><img src="/static/sys/dimensionspixel.gif" data-original="http://cdn2.spiegel.de/images/image-716045-hpcolumnressort-pzqb.jpg" width="230" height="110" border="0" class="js-lazy" title="" alt="" /></a><div class="asset-credit">DPA</div>
                                        </div>
                                <a href="/kultur/a-458623.html" title="Charts: Alle Bestsellerlisten im Überblick"><span class="headline-intro">Charts:</span> <span class="headline">Alle Bestsellerlisten im Überblick</span></a></li>
                    </ul>

            <div class="js-ressort-ad-kultur" style="display:none;">
                    <script type="text/javascript">
                    <!--
                        OAS_RICH('RightKul');
                    // -->
                    </script>
                </div>
            </div></div></div><div class="clearfix module-box netzwelt">

    <div class="ressort-teaser-box-header hp-gradient double-bottom-border clearfix">

        <p class="module-title block-bullet"><a href="/netzwelt/#ref=ressortblock"> NETZWELT</a></p>
            <div class="ressort-teaser-box-nav">
<ul>
<li>
<a href="/netzwelt/netzpolitik/">Netzpolitik</a>
</li>
<li>
<a href="/netzwelt/web/">Web</a>
</li>
<li>
<a href="/netzwelt/gadgets">Gadgets</a>
</li>
<li>
<a class="link-more" href="javascript:return false;">mehr</a>
<ul class="ressort-box-nav-sub">
<li>
<a href="/thema/umbruch_der_medienwelt">Medienwandel</a>
</li>
<li>
<a href="/thema/angefasst">Angefasst</a>
</li>
<li>
<a href="/thema/fehlfunktion">Fehlfunktion</a>
</li>
<li>
<a href="/netzwelt/games/">Games</a>
</li>
<li>
<a href="/thema/bilderwelten">Bilderwelten</a>
</li>
<li>
<a href="/thema/silberscheiben">Silberscheiben</a>
</li>
<li>
<a href="/thema/">
<strong>alle Themen</strong>
</a>
</li>
</ul>
</li>
</ul>
</div></div><div class="clearfix ressort-teaser-box-body">

        <div class="column-wide"><div class="commonpager" data-commonpager-beforeslide="spHpSlideBox" data-enable-touch="false" data-commonpager-callback="spHpSlideBoxCallback" >
                <div class="commonpager-pages">
                    <div class="commonpager-page first ressort-slide" rel="netzwelt">

                        <div class="ressort-teaser-box-top">
                                        <div class="article-image-box box-position thumb asset-align-left">
        <div class="image-buttons-panel clearfix">
                    <a href="/netzwelt/web/hbo-zieht-direktverkauf-von-game-of-thrones-per-download-vor-a-984879.html" title="&quot;Game of Thrones&quot;: HBOs kleine Diebstahlsicherung"><img src="/static/sys/dimensionspixel.gif" data-original="http://cdn4.spiegel.de/images/image-686693-thumb-mccf.jpg" width="180" height="180" border="0" class="js-lazy" title="&quot;Game of Thrones&quot;: HBOs kleine Diebstahlsicherung" alt="&quot;Game of Thrones&quot;: HBOs kleine Diebstahlsicherung" /></a><span class="image-buttons">
                        </span>
                </div>
            </div><h2 class="article-title">
    <a href="/netzwelt/web/hbo-zieht-direktverkauf-von-game-of-thrones-per-download-vor-a-984879.html" title="&quot;Game of Thrones&quot;: HBOs kleine Diebstahlsicherung"><span class="headline-intro">"Game of Thrones"</span> <span class="headline">HBOs kleine Diebstahlsicherung</span></a></h2><p>Es ist die meistverbreitete TV-Serie im Web, allerdings nur auf illegalen Kanälen: "Game of Thrones". Das will der Sender HBO nun ändern: mit einem Angebot via iTunes und Amazon. Ein überfälliger Schritt - aber womöglich nur der erste. <span class="author">Von Frank Patalong</span> <a href="/netzwelt/web/hbo-zieht-direktverkauf-von-game-of-thrones-per-download-vor-a-984879.html" title="&quot;Game of Thrones&quot;: HBOs kleine Diebstahlsicherung">mehr...</a> <span class="spInteractionMarks video-forum-bracket">[&nbsp;<a href="http://forum.spiegel.de/showthread.php?t=133738">Forum</a>&nbsp;]</span></p>
                                    </div>
                                    <ul class="article-list">
                                <li>
                                    <a href="/netzwelt/web/usis-hacker-greifen-firma-fuer-background-checks-an-a-984884.html" title="Dienst für Behörde: Hacker greifen Firma für Background-Checks an"><span class="headline-intro">Dienst für Behörde:</span> <span class="headline">Hacker greifen Firma für Background-Checks an</span></a></li>
                                <li>
                                    <a href="/netzwelt/netzpolitik/snowden-russland-gewaehrt-drei-jahre-aufenthalt-a-984117.html" title="US-Whistleblower: Russland gewährt Snowden drei Jahre Aufenthalt"><span class="headline-intro">US-Whistleblower:</span> <span class="headline">Russland gewährt Snowden drei Jahre Aufenthalt</span></a></li>
                                <li>
                                    <a href="/netzwelt/web/hitchbot-roboter-hat-per-anhalter-bald-halbe-strecke-geschafft-a-984896.html" title="Trampender Roboter: Hitchbot hat schon mehr als 2500 Kilometer hinter sich"><span class="headline-intro">Trampender Roboter:</span> <span class="headline">Hitchbot hat schon mehr als 2500 Kilometer hinter sich</span></a></li>
                                </ul>

                        <div class="is-hidden" id="netzwelt-Ids">-1,984879,984884,984117,984896</div>

                    </div><div class="commonpager-page ressort-slide"><div class="load-icon"><img src="/static/sys/v10/icons/ani-loader_small.gif" alt="loading..." /></div></div>
                    <div class="commonpager-page ressort-slide"><div class="load-icon"><img src="/static/sys/v10/icons/ani-loader_small.gif" alt="loading..." /></div></div>
                </div><div class="clearfix commonpager-indicator"></div>
            </div></div><div class="column-small"><ul class="js-ressort-content">
                <li>
                            <div class="article-image-box box-position hpcolumnressort">
                                        <a href="/netzwelt/netzpolitik/gamma-international-hacker-veroeffentlicht-40-gigabyte-datensatz-a-984844.html" title="Spionagesoftware-Firma Gamma: Hacker veröffentlicht 40-Gigabyte-Datensatz"><img src="/static/sys/dimensionspixel.gif" data-original="http://cdn1.spiegel.de/images/image-290370-hpcolumnressort-yflt.jpg" width="230" height="110" border="0" class="js-lazy" title="" alt="" /></a></div>
                                <a href="/netzwelt/netzpolitik/gamma-international-hacker-veroeffentlicht-40-gigabyte-datensatz-a-984844.html" title="Spionagesoftware-Firma Gamma: Hacker veröffentlicht 40-Gigabyte-Datensatz"><span class="headline-intro">Spionagesoftware-Firma Gamma:</span> <span class="headline">Hacker veröffentlicht 40-Gigabyte-Datensatz</span></a></li>
                    <li>
                            <div class="article-image-box box-position hpcolumnressort">
                                        <a href="/netzwelt/games/nordic-larps-art-house-rollenspiel-ueber-palaestina-konflikt-a-984627.html" title="&quot;Nordic Larps&quot;: Palästina-Konflikt im Live-Rollenspiel"><img src="/static/sys/dimensionspixel.gif" data-original="http://cdn2.spiegel.de/images/image-733285-hpcolumnressort-tlvq.jpg" width="230" height="110" border="0" class="js-lazy" title="" alt="" /></a><div class="asset-credit">Tuomas Puikkonen</div>
                                        </div>
                                <a href="/netzwelt/games/nordic-larps-art-house-rollenspiel-ueber-palaestina-konflikt-a-984627.html" title="&quot;Nordic Larps&quot;: Palästina-Konflikt im Live-Rollenspiel"><span class="headline-intro">"Nordic Larps":</span> <span class="headline">Palästina-Konflikt im Live-Rollenspiel</span></a></li>
                    </ul>

            <div class="js-ressort-ad-netzwelt" style="display:none;">
                    <script type="text/javascript">
                    <!--
                        OAS_RICH('RightNet');
                    // -->
                    </script>
                </div>
            </div></div></div><style media="screen" type="text/css">
                    div#GamesBar { width:1px; height:1px; float:left; clear:both; }

                    div#GamesPortBar110282 { display:none; width:100%; margin-bottom: 20px;}
                    div#GamesPortBar110282 *, div#GamesPortBar110282 *:before, div#GamesPortBar110282 *:after { -moz-box-sizing:border-box; -webkit-box-sizing:border-box; box-sizing:border-box; }

                    div.GamesPort110282 { display:inline-block; width:100%; max-width:860px; background:#FFFFFF; font-size:12px; }

                    div.GamesPort110282 div.GamesText { display:block; width:100%; }
                    div.GamesPort110282 div.GamesText h2 { margin:0 0 10px 0; padding: 0; }

                    div.GamesPort110282 li.game { float:left; display:block; width:20%; text-align:center; cursor:pointer; color:#990000; }
                    div.GamesPort110282 li.game img { margin:10px auto; }
                    div.GamesPort110282 li.game:first-child img { margin-left:0; }
                    div.GamesPort110282 li.game:last-child img { margin-right:0; }

                    div.GameFrame110282 { display:none; position:fixed; top:0; left:0; z-index:1000001; width:100%; height:100%; background:transparent; }
                    div.GameFrame110282 div.GameClose { position:absolute; top:30px; left:30px; color:#FFFFFF; background:url("/static/sys/v10/buttons/btn_close_black.png") no-repeat right 50%; padding-right:30px; height:25px; line-height: 25px; cursor:pointer; }
                    div.GameFrame110282 div.GameFrameBack { width:100%; height:100%; background-color:rgba(0, 0, 0, 0.8); }
                    div.GameFrame110282 iframe.GameFrame_centered { position:absolute; top:0; bottom:0; left:0; right:0; margin:auto;}
                </style>

                <div id="GamesBar"></div>
                <div id="GamesPortBar110282">
                    <div class="GamesPort110282">
                        <div class="GamesText">
                            <h2>Spiele für zwischendurch</h2>
                        </div>
                        <ul class="list-flashvideo clearfix">
                            <li class="game handheld" data-H="480" data-W="640" data-count-id="33319" data-src="/static/happ/netzwelt/2014/gamecenter/pub/v1/handheld/handheld.html">
                                <img align="center" alt="" border="0" class="image-no-border" height="120" src="/static/happ/netzwelt/2014/gamecenter/pub/v1/img/HandheldSmall.jpg" title="" width="160"/>
                                Handheld
                            </li>
                            <li class="game superblade" data-H="480" data-W="640" data-count-id="33320" data-src="/static/happ/netzwelt/2014/gamecenter/pub/v1/superblade/superblade.html">
                                <img align="center" alt="" border="0" class="image-no-border" height="120" src="/static/happ/netzwelt/2014/gamecenter/pub/v1/img/SuperbladeSmall.jpg" title="" width="160"/>
                                Superblade
                            </li>
                            <li class="game astroslugs" data-H="600" data-W="800" data-count-id="33321" data-src="/static/happ/netzwelt/2014/gamecenter/pub/v1/astroslugs/astroslugs.html">
                                <img align="center" alt="" border="0" class="image-no-border" height="120" src="/static/happ/netzwelt/2014/gamecenter/pub/v1/img/AstroslugsSmall.jpg" title="" width="160"/>
                                Astroslugs
                            </li>
                            <li class="game togetheralone" data-H="800" data-W="1280" data-count-id="33322" data-src="/static/happ/netzwelt/2014/gamecenter/pub/v1/togetheralone/togetheralone.html">
                                <img align="center" alt="" border="0" class="image-no-border" height="120" src="/static/happ/netzwelt/2014/gamecenter/pub/v1/img/TogetherAloneSmall.jpg" title="" width="160"/>
                                Together Alone
                            </li>
                            <li class="game extern">
                                <a href="/netzwelt/games/trivial-pursuit-online-das-wissensspiel-auf-spiegel-online-a-803428.html" target="_blank">
                                    <img align="center" alt="" border="0" class="image-no-border" height="120" src="/static/happ/netzwelt/2014/gamecenter/pub/v1/img/TrivialpursuitSmall.jpg" title="" width="160"/>
                                    Trivial Pursuit
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="GameFrame110282">
                        <div class="GameFrameBack">
                            <div class="GameClose">Schließen</div>
                            <iframe class="GameFrame_centered" frameborder="0" id="GameInnerFrame" marginheight="0" marginwidth="0" scrolling="no"></iframe>
                        </div>
                    </div>

                    <script type="text/javascript">
                        //
                        $(document).ready(function () {

                            var jGamesPortBar = $("div#GamesPortBar110282");
                            if ( ! spUA.isIPad() ) {
                                jGamesPortBar.show();

                                function countGame(id){
                                    spCounterFlash(id);
                                }

                                var
                                        jGame = jGamesPortBar.find("li.game:not(.extern)"),
                                        jGameFrame = jGamesPortBar.find("div.GameFrame110282"),
                                        jGameClose = jGameFrame.find("div.GameClose"),
                                        jInnerFrame = jGameFrame.find("iframe#GameInnerFrame"),
                                        gamesrc = "",
                                        gameW = 800,
                                        gameH = 600,
                                        diesSpiel,
                                        countId,
                                        viewportWidth = $(window).width(),
                                        viewportHeight = $(window).height(),
                                        frameGameW  = 640,
                                        frameGameH = 400;


                                if (viewportWidth >= 900 && viewportHeight >= 700) {
                                    frameGameW = viewportWidth - 100;
                                    frameGameH = viewportHeight - 100;
                                    if (viewportWidth / 1280 > viewportHeight / 800) {
                                        frameGameW = (viewportHeight * 1280 / 800) -100; // Height-bound
                                    } else {
                                        frameGameH = (viewportWidth * 800 / 1280) -100; // Width-bound
                                    }
                                }

                                jGame.click(function () {
                                    diesSpiel = $(this);
                                    countId = diesSpiel.attr("data-count-id");
                                    gamesrc = diesSpiel.attr("data-src");
                                    gameW = (diesSpiel.hasClass("togetheralone")) ? frameGameW : diesSpiel.attr("data-W");
                                    gameH = (diesSpiel.hasClass("togetheralone")) ? frameGameH : diesSpiel.attr("data-H");
                                    jGameFrame.appendTo("body");
                                    jInnerFrame.attr("src", gamesrc).attr("width",gameW).attr("height",gameH);
                                    jGameFrame.css("display","block");
                                    countGame(countId);
                                });

                                jGameClose.click(function () {
                                    jGameFrame.css("display","none");
                                    jInnerFrame.attr("src", "/static/sys/pixel.gif");
                                });


                            } // END if ! spUA.isIPad()
                        });
                        //
                    </script>

                </div><div class="clearfix module-box auto">

    <div class="ressort-teaser-box-header hp-gradient double-bottom-border clearfix">

        <p class="module-title block-bullet"><a href="/auto/#ref=ressortblock"> AUTO</a></p>
            <div class="ressort-teaser-box-nav">
<ul>
<li>
<a href="/auto/fahrberichte/">Tests</a>
</li>
<li>
<a href="/auto/fahrkultur/">Fahrkultur</a>
</li>
<li>
<a href="/auto/">Aktuelles</a>
</li>
</ul>
</div></div><div class="clearfix ressort-teaser-box-body">

        <div class="column-wide"><div class="commonpager" data-commonpager-beforeslide="spHpSlideBox" data-enable-touch="false" data-commonpager-callback="spHpSlideBoxCallback" >
                <div class="commonpager-pages">
                    <div class="commonpager-page first ressort-slide" rel="auto">

                        <div class="ressort-teaser-box-top">
                                        <div class="article-image-box box-position hppano asset-align-center">
        <div class="image-buttons-panel clearfix">
                    <a href="/auto/fahrkultur/vw-california-t5-als-campingbus-mit-komfort-ausstattung-a-983451.html" title="VW Bus California: Eine bewegte Reise"><img src="/static/sys/dimensionspixel.gif" data-original="http://cdn1.spiegel.de/images/image-730714-hppano-qxet.jpg" width="610" height="293" border="0" class="js-lazy" title="VW Bus California: Eine bewegte Reise" alt="VW Bus California: Eine bewegte Reise" /></a><span class="image-buttons">
                        </span>
                </div>
            </div><h2 class="article-title">
    <a href="/auto/fahrkultur/vw-california-t5-als-campingbus-mit-komfort-ausstattung-a-983451.html" title="VW Bus California: Eine bewegte Reise"><span class="headline-intro">VW Bus California</span> <span class="headline">Eine bewegte Reise</span></a></h2><p>Schlafzimmer und Küche auf vier Rädern: Der VW California bietet alles Nötige für den Campingurlaub. Jetzt hat Volkswagen das 50.000ste Modell produziert. Der Jubiläums-Bus ist eine Luxusausführung - doch eigentlich ist in Zukunft mehr Bescheidenheit angesagt. <span class="author">Von Christian Frahm</span> <a href="/auto/fahrkultur/vw-california-t5-als-campingbus-mit-komfort-ausstattung-a-983451.html" title="VW Bus California: Eine bewegte Reise">mehr...</a> <span class="spInteractionMarks video-forum-bracket">[&nbsp;<a href="http://forum.spiegel.de/showthread.php?t=133711">Forum</a>&nbsp;]</span></p>
                                    </div>
                                    <ul class="article-list">
                                <li>
                                    <a href="/auto/aktuell/autoweihe-in-oesterreich-segen-fuer-oldtimer-motorraeder-traktoren-a-983964.html" title="Autoweihe in St. Christophen: Mit Gurt und Gottes Segen"><span class="headline-intro">Autoweihe in St. Christophen:</span> <span class="headline">Mit Gurt und Gottes Segen</span></a></li>
                                <li>
                                    <a href="/auto/aktuell/polaris-slingshot-motorisiertes-dreirad-fuer-sportwagen-fans-a-984528.html" title="Polaris Slingshot: Eine Klasse für sich"><span class="headline-intro">Polaris Slingshot:</span> <span class="headline">Eine Klasse für sich</span></a></li>
                                <li>
                                    <a href="/auto/aktuell/mercedesfahrer-deutscher-raser-muss-vor-schweizer-bezirksgericht-a-984552.html" title="Tempovergehen in der Schweiz: Deutscher Raser kann auf Bewährung hoffen"><span class="headline-intro">Tempovergehen in der Schweiz:</span> <span class="headline">Deutscher Raser kann auf Bewährung hoffen</span></a></li>
                                </ul>

                        <div class="is-hidden" id="auto-Ids">-1,983451,983964,984528,984552</div>

                    </div><div class="commonpager-page ressort-slide"><div class="load-icon"><img src="/static/sys/v10/icons/ani-loader_small.gif" alt="loading..." /></div></div>
                    <div class="commonpager-page ressort-slide"><div class="load-icon"><img src="/static/sys/v10/icons/ani-loader_small.gif" alt="loading..." /></div></div>
                </div><div class="clearfix commonpager-indicator"></div>
            </div></div><div class="column-small"><ul class="js-ressort-content">
                <li>
                            <div class="article-image-box box-position hpcolumnressort">
                                        <a href="/auto/aktuell/autobahngold-polizei-warnt-reisende-vor-trickbetruegern-in-deutschland-a-982329.html" title="Vorgetäuschte Pannen: Polizei warnt vor Trickbetrügern am Straßenrand"><img src="/static/sys/dimensionspixel.gif" data-original="http://cdn3.spiegel.de/images/image-727996-hpcolumnressort-ltes.jpg" width="230" height="110" border="0" class="js-lazy" title="" alt="" /></a><div class="asset-credit">imago</div>
                                        </div>
                                <a href="/auto/aktuell/autobahngold-polizei-warnt-reisende-vor-trickbetruegern-in-deutschland-a-982329.html" title="Vorgetäuschte Pannen: Polizei warnt vor Trickbetrügern am Straßenrand"><span class="headline-intro">Vorgetäuschte Pannen:</span> <span class="headline">Polizei warnt vor Trickbetrügern am Straßenrand</span></a></li>
                    <li>
                            <div class="article-image-box box-position hpcolumnrightsquare">
                                        <a href="/auto/aktuell/urlaub-im-auto-wichtige-regeln-im-ausland-a-980941.html" title="Vorschriften im Ausland: Das müssen Sie auf Urlaubsfahrten im Auto dabeihaben"><img src="/static/sys/dimensionspixel.gif" data-original="http://cdn4.spiegel.de/images/image-726037-hpcolumnrightsquare-qlgj.jpg" width="230" height="230" border="0" class="js-lazy" title="" alt="" /></a><div class="asset-credit">imago</div>
                                        </div>
                                <a href="/auto/aktuell/urlaub-im-auto-wichtige-regeln-im-ausland-a-980941.html" title="Vorschriften im Ausland: Das müssen Sie auf Urlaubsfahrten im Auto dabeihaben"><span class="headline-intro">Vorschriften im Ausland:</span> <span class="headline">Das müssen Sie auf Urlaubsfahrten im Auto dabeihaben</span></a></li>
                    </ul>

            <div class="js-ressort-ad-auto" style="display:none;">
                    <script type="text/javascript">
                    <!--
                        OAS_RICH('RightAut');
                    // -->
                    </script>
                </div>
            </div></div></div><div class="clearfix module-box einestages">

    <div class="ressort-teaser-box-header hp-gradient double-bottom-border clearfix">

        <p class="module-title block-bullet"><a href="/einestages/#ref=ressortblock"> EINESTAGES</a></p>
            <div class="ressort-teaser-box-nav">
<ul>
<li>
<a href="/einestages/thema/zeitzeugen/">Zeitzeugen</a>
</li>
<li>
<a href="/einestages/bildsuchtgeschichte/">Bild sucht Geschichte</a>
</li>
<li>
<a class="link-more" href="javascript:return false;">mehr</a>
<ul class="ressort-box-nav-sub">
<li>
<a href="/einestages/thema/erster_weltkrieg/">Erster Weltkrieg</a>
</li>
<li>
<a href="/einestages/thema/in_sieben_schritten/">In sieben Schritten</a>
</li>
<li>
<a href="/einestages/thema/wie_die_zeit_vergeht_mit__/">Wie die Zeit vergeht mit...</a>
</li>
<li>
<a href="/einestages/thema/augenblick_mal_/">Augenblick mal!</a>
</li>
<li>
<a href="/einestages/thema/fuenf_wahrheiten_ueber__/">Fünf Wahrheiten über...</a>
</li>
</ul>
</li>
</ul>
</div></div><div class="clearfix ressort-teaser-box-body">

        <div class="column-wide"><div class="commonpager" data-commonpager-beforeslide="spHpSlideBox" data-enable-touch="false" data-commonpager-callback="spHpSlideBoxCallback" >
                <div class="commonpager-pages">
                    <div class="commonpager-page first ressort-slide" rel="einestages">

                        <div class="ressort-teaser-box-top">
                                        <div class="article-image-box box-position thumb asset-align-left">
        <div class="image-buttons-panel clearfix">
                    <a href="/einestages/lost-place-fotograf-sven-fennema-tales-of-yesteryear-a-982072.html" title="Fotografie-Schätze von Sven Fennema: Die Schönheit der vergessenen Orte"><img src="/static/sys/dimensionspixel.gif" data-original="http://cdn4.spiegel.de/images/image-726663-thumb-mgst.jpg" width="180" height="180" border="0" class="js-lazy" title="Fotografie-Schätze von Sven Fennema: Die Schönheit der vergessenen Orte" alt="Fotografie-Schätze von Sven Fennema: Die Schönheit der vergessenen Orte" /></a><span class="image-buttons">
                        </span>
                </div>
            </div><h2 class="article-title">
    <a href="/einestages/lost-place-fotograf-sven-fennema-tales-of-yesteryear-a-982072.html" title="Fotografie-Schätze von Sven Fennema: Die Schönheit der vergessenen Orte"><span class="headline-intro">Fotografie-Schätze von Sven Fennema</span> <span class="headline">Die Schönheit der vergessenen Orte</span></a></h2><p>Stillgelegte Krematorien, verfallene Theater, vermoderte Psychiatrien: Auf seiner Suche nach vergessenen Orten entdeckte Fotograf Sven Fennema architektonische Juwelen - <i>einestages</i> zeigt die schönsten und erzählt ihre Geschichte. <span class="author">Von Katja Iken</span> <a href="/einestages/lost-place-fotograf-sven-fennema-tales-of-yesteryear-a-982072.html" title="Fotografie-Schätze von Sven Fennema: Die Schönheit der vergessenen Orte">mehr...</a> </p>
                                    </div>
                                    <ul class="article-list">
                                <li>
                                    <a href="/einestages/tonkin-zwischenfall-1964-usa-im-vietnamkrieg-a-983990.html" title="Eintritt der USA in den Vietnamkrieg 1964: Der gewollte Krieg"><span class="headline-intro">Eintritt der USA in den Vietnamkrieg 1964:</span> <span class="headline">Der gewollte Krieg</span></a></li>
                                <li>
                                    <a href="/einestages/urlaub-auf-der-ddr-ostseeinsel-hiddensee-a-983589.html" title="DDR-Urlaub auf Hiddensee: Zu Gast im Viehstall mit Gardinen"><span class="headline-intro">DDR-Urlaub auf Hiddensee:</span> <span class="headline">Zu Gast im Viehstall mit Gardinen</span></a></li>
                                <li>
                                    <a href="/einestages/rumaenischer-fotograf-acsinte-a-975912.html" title="Fotografie: Ein Schatz löst sich auf"><span class="headline-intro">Fotografie:</span> <span class="headline">Ein Schatz löst sich auf</span></a></li>
                                </ul>

                        <div class="is-hidden" id="einestages-Ids">-1,982072,983990,983589,975912</div>

                    </div><div class="commonpager-page ressort-slide"><div class="load-icon"><img src="/static/sys/v10/icons/ani-loader_small.gif" alt="loading..." /></div></div>
                    <div class="commonpager-page ressort-slide"><div class="load-icon"><img src="/static/sys/v10/icons/ani-loader_small.gif" alt="loading..." /></div></div>
                </div><div class="clearfix commonpager-indicator"></div>
            </div></div><div class="column-small"><ul class="js-ressort-content">
                <li>
                            <div class="article-image-box box-position hpcolumnressort">
                                        <a href="/einestages/caryl-chessman-der-mann-der-neunmal-starb-a-951165.html" title="Hinrichtungskandidat Caryl Chessman: Der Mann, der neunmal starb"><img src="/static/sys/dimensionspixel.gif" data-original="http://cdn1.spiegel.de/images/image-648560-hpcolumnressort-lhye.jpg" width="230" height="110" border="0" class="js-lazy" title="" alt="" /></a><div class="asset-credit">AP</div>
                                        </div>
                                <a href="/einestages/caryl-chessman-der-mann-der-neunmal-starb-a-951165.html" title="Hinrichtungskandidat Caryl Chessman: Der Mann, der neunmal starb"><span class="headline-intro">Hinrichtungskandidat Caryl Chessman:</span> <span class="headline">Der Mann, der neunmal starb</span></a></li>
                    <li>
                            <div class="article-image-box box-position hpcolumnressort">
                                        <a href="/einestages/west-produkte-und-ihre-ost-kopien-a-951008.html" title="Trendkopierer DDR: Vom Westen lernen heißt grillen lernen"><img src="/static/sys/dimensionspixel.gif" data-original="http://cdn2.spiegel.de/images/image-645919-hpcolumnressort-livl.jpg" width="230" height="110" border="0" class="js-lazy" title="" alt="" /></a></div>
                                <a href="/einestages/west-produkte-und-ihre-ost-kopien-a-951008.html" title="Trendkopierer DDR: Vom Westen lernen heißt grillen lernen"><span class="headline-intro">Trendkopierer DDR:</span> <span class="headline">Vom Westen lernen heißt grillen lernen</span></a></li>
                    </ul>

            <div class="js-ressort-ad-einestages" style="display:none;">
                    <script type="text/javascript">
                    <!--
                        OAS_RICH('RightEin');
                    // -->
                    </script>
                </div>
            </div></div></div><div class="clearfix module-box reise">

    <div class="ressort-teaser-box-header hp-gradient double-bottom-border clearfix">

        <p class="module-title block-bullet"><a href="/reise/#ref=ressortblock"> REISE</a></p>
            <div class="ressort-teaser-box-nav">
<ul>
<li>
<a href="/reise/karte/">Weltkarte</a>
</li>
<li>
<a href="/reise/staedte/">Städte</a>
</li>
<li>
<a href="/reise/fernweh/">Fernweh</a>
</li>
<li>
<a class="link-more" href="javascript:return false;">mehr</a>
<ul class="ressort-box-nav-sub">
<li>
<a href="/reise/deutschland/">Deutschland</a>
</li>
<li>
<a href="/reise/europa/">Europa</a>
</li>
<li>
<a href="/thema/reiserecht">Reiserecht</a>
</li>
<li>
<a href="/thema/familienreisen">Familienreisen</a>
</li>
<li>
<a href="/thema/warum_wir_reisen">Warum wir reisen</a>
</li>
<li>
<a href="/thema/">
<strong>alle Themen</strong>
</a>
</li>
</ul>
</li>
</ul>
</div></div><div class="clearfix ressort-teaser-box-body">

        <div class="column-wide"><div class="commonpager" data-commonpager-beforeslide="spHpSlideBox" data-enable-touch="false" data-commonpager-callback="spHpSlideBoxCallback" >
                <div class="commonpager-pages">
                    <div class="commonpager-page first ressort-slide" rel="reise">

                        <div class="ressort-teaser-box-top">
                                        <div class="article-image-box box-position thumb asset-align-left">
        <div class="image-buttons-panel clearfix">
                    <a href="/reise/fernweh/borneo-reisen-mit-kind-durch-asien-a-984407.html" title="Mit Baby durch Borneo: In der Ruhe liegt das Glück"><img src="/static/sys/dimensionspixel.gif" data-original="http://cdn2.spiegel.de/images/image-731349-thumb-eltw.jpg" width="180" height="180" border="0" class="js-lazy" title="Mit Baby durch Borneo: In der Ruhe liegt das Glück" alt="Mit Baby durch Borneo: In der Ruhe liegt das Glück" /></a><span class="image-buttons">
                        </span>
                </div>
            </div><h2 class="article-title">
    <a href="/reise/fernweh/borneo-reisen-mit-kind-durch-asien-a-984407.html" title="Mit Baby durch Borneo: In der Ruhe liegt das Glück"><span class="headline-intro">Mit Baby durch Borneo</span> <span class="headline">In der Ruhe liegt das Glück</span></a></h2><p>Gemütliche Nächte im Baucontainer, Tage ohne Pläne. Heike Klovert reist mit Mann und Baby durch Asien, gelassen und oft völlig ineffizient. Auf Borneo lernt sie, dass darin der Schlüssel zum Glück liegen kann. <span class="author">Von Heike Klovert</span> <a href="/reise/fernweh/borneo-reisen-mit-kind-durch-asien-a-984407.html" title="Mit Baby durch Borneo: In der Ruhe liegt das Glück">mehr...</a> <span class="spInteractionMarks video-forum-bracket">[&nbsp;<a href="http://forum.spiegel.de/showthread.php?t=133706">Forum</a>&nbsp;]</span></p>
                                    </div>
                                    <ul class="article-list">
                                <li>
                                    <a href="/reise/aktuell/klettersteigschein-in-ramsau-blitzschulung-fuer-anfaenger-a-984566.html" title="Klettersteigschein in Ramsau: &quot;Darf man sich am Seil festhalten?&quot;"><span class="headline-intro">Klettersteigschein in Ramsau:</span> <span class="headline">"Darf man sich am Seil festhalten?"</span></a></li>
                                <li>
                                    <a href="/reise/europa/belgier-wollen-unesco-welterbe-status-fuer-pommes-frites-a-984680.html" title="Belgisches Nationalgericht: Fritten for Welterbe"><span class="headline-intro">Belgisches Nationalgericht:</span> <span class="headline">Fritten for Welterbe</span></a></li>
                                <li>
                                    <a href="/reise/aktuell/lufthansa-fliegt-wegen-hohem-krankenstand-mit-kleineren-crews-a-984793.html" title="Hoher Krankenstand: Lufthansa fliegt mit kleineren Crews"><span class="headline-intro">Hoher Krankenstand:</span> <span class="headline">Lufthansa fliegt mit kleineren Crews</span></a></li>
                                </ul>

                        <div class="is-hidden" id="reise-Ids">-1,984407,984566,984680,984793</div>

                    </div><div class="commonpager-page ressort-slide"><div class="load-icon"><img src="/static/sys/v10/icons/ani-loader_small.gif" alt="loading..." /></div></div>
                    <div class="commonpager-page ressort-slide"><div class="load-icon"><img src="/static/sys/v10/icons/ani-loader_small.gif" alt="loading..." /></div></div>
                </div><div class="clearfix commonpager-indicator"></div>
            </div></div><div class="column-small"><ul class="js-ressort-content">
                <li>
                            <div class="article-image-box box-position hpcolumnressort">
                                        <a href="/fotostrecke/fotostrecke-117644.html" title="Reisefoto-Wettbewerb: Ufo-Wolken und blaue Mädchen"><img src="/static/sys/dimensionspixel.gif" data-original="http://cdn4.spiegel.de/images/image-732757-hpcolumnressort-oysb.jpg" width="230" height="110" border="0" class="js-lazy" title="" alt="" /></a><div class="asset-credit">2014 National Geographic Traveler Photo Contest/ <a href="http://travel.nationalgeographic.com/travel/traveler-magazine/photo-contest/2014/users/1874162" target="_blank">Marko Koro&scaron;ec</a></div>
                                        </div>
                                <a href="/fotostrecke/fotostrecke-117644.html" title="Reisefoto-Wettbewerb: Ufo-Wolken und blaue Mädchen"><span class="headline-intro">Reisefoto-Wettbewerb:</span> <span class="headline">Ufo-Wolken und blaue Mädchen</span></a></li>
                    <li>
                            <div class="article-image-box box-position hpcolumnressort">
                                        <a href="/reise/europa/belgier-wollen-unesco-welterbe-status-fuer-pommes-frites-a-984680.html" title="Belgisches Nationalgericht: Fritten for Welterbe"><img src="/static/sys/dimensionspixel.gif" data-original="http://cdn2.spiegel.de/images/image-733571-hpcolumnressort-ajaq.jpg" width="230" height="110" border="0" class="js-lazy" title="" alt="" /></a><div class="asset-credit">DPA</div>
                                        </div>
                                <a href="/reise/europa/belgier-wollen-unesco-welterbe-status-fuer-pommes-frites-a-984680.html" title="Belgisches Nationalgericht: Fritten for Welterbe"><span class="headline-intro">Belgisches Nationalgericht:</span> <span class="headline">Fritten for Welterbe</span></a></li>
                    </ul>

            <div class="js-ressort-ad-reise" style="display:none;">
                    <script type="text/javascript">
                    <!--
                        OAS_RICH('RightRei');
                    // -->
                    </script>
                </div>
            </div></div></div><div class="clearfix module-box spam">

    <div class="ressort-teaser-box-header hp-gradient double-bottom-border clearfix">
        <p class="module-title block-bullet"><a class="spam-ressort-head" href="/spam/">SPAM - SATIRE</a></p>
    </div><div class="clearfix ressort-teaser-box-body">
        <div class="column-wide">
        <div class="commonpager-page first">

            <div class="article-image-box asset-align-left" style="width: 180px">
                                <a href="/spam/"><img src="/static/sys/dimensionspixel.gif" data-original="http://cdn1.spiegel.de/images/image-733804-thumb-jfjs.jpg" width="180" height="180" border="0" class="js-lazy" title="" alt="" /></a>
                            </div>
                        <ul class="article-list">
                <li><a href="/spam/">Humor für Leute mit Humor</a></li>
                            <li><a href="/spam/">Insidertipp</a></li>
                            <li><a href="/spam/">Hauck & Bauer: Der Herzensmensch</a></li>
                            <li><a href="/spam/">Kauder besorgt</a></li>
                            <li><a href="/spam/">Süße Tier-News!</a></li>
                            <li><a href="/spam/">Friede, Freude, Eierkuchen</a></li>
                            <li><a href="/spam/">Marco Reus geht zum FC Bayern!</a></li>
                            </ul>

        </div></div><div class="column-small"><ul class="js-ressort-content">
            <li>
                    <div class="article-image-box box-position hpcolumnressort">
                                <a href="http://www.spiegel.de/spam/thema/spam_fotowitze/" target="_self" title="Alle Fotowitze: Die Übersicht"><img src="/static/sys/dimensionspixel.gif" data-original="http://cdn1.spiegel.de/images/image-733580-hpcolumnressort-msjc.jpg" width="230" height="110" border="0" class="js-lazy" title="" alt="" /></a><div class="asset-credit">Uwe Becker (Foto: DPA) </div>
                                </div>
                        <a href="http://www.spiegel.de/spam/thema/spam_fotowitze/" target="_self" title="Alle Fotowitze: Die Übersicht"><span class="headline-intro">Alle Fotowitze:</span> <span class="headline">Die Übersicht</span></a></li>
                <li>
                    <a href="/spam/thema/spam_schilder/" target="_self" title="Übersicht: Ein Schild sagt mehr als 1000 Worte..."><span class="headline-intro">Übersicht:</span> <span class="headline">Ein Schild sagt mehr als 1000 Worte...</span></a></li>
                </ul>

            <div class="js-ressort-ad-spam" style="display:none;">
                    <script type="text/javascript">
                    <!--
                        OAS_RICH('RightSpa');
                    // -->
                    </script>
                </div>
            </div></div></div><div class="asset-box asset-augenblick clearfix">
   <div class="hp-gradient double-bottom-border asset-title">
      AUGENBLICK - Brandopfer</div>
   <div class="js-module-box-image box-position  asset-align-center galleryV9" style="width:850px;">

                        <a href="/panorama/waldbraende-in-kalifornien-zerstoeren-haeuser-und-a-984809.html" title="Augenblick: Brandopfer"><img src="/static/sys/dimensionspixel.gif" data-original="http://cdn1.spiegel.de/images/image-733698-galleryV9-tvrl.jpg" width="850" height="566" border="0" class="js-lazy" title="" alt="" align="center" /></a><div >
                            <div class="asset-credit">AP</div>
                            </div>
                    </div>

   <div class="archive-link-box">
         <a class="link-right" href="/thema/augenblick/">Alle Bilder</a>
   </div>
</div><style type="text/css">
.asset-mixed-imagebox{height:158px;overflow:hidden;margin-bottom:10px;}
.asset-mixed-imagebox img{margin-top: -25%}
.asset-mixed-imagetypes .list-float-left:first-child{
   border-left: 0 none;
}
.asset-mixed-imagetypes .list-float-left{
   border-left: 8px solid #fff; /* abstand zw spalten*/
   height: 230px; /* hoehe der spalten */
}
.asset-mixed-imagetypes .list-float-left a img{
   height: auto;  /* alle bilder sollen gleiche hoehe haben */
   width: 100%;
}
</style>

<div class="asset-box asset-mixed-imagetypes clearfix">
   <div class="hp-gradient double-bottom-border asset-title">
      EMPFEHLUNGEN DER REDAKTION
   </div>
   <ul class="list-float clearfix">


 <li class="list-float-left" style="width:160px">
         <a href="/sptv/magazin/">
<!--cetag oid="image_234517" viewtype="plain" imagetype="thumb" /-->
<img src="http://cdn4.spiegel.de/images/image-545323-custom-elju.jpg" width="160" height="160" border="0" class="image-no-border" title="" alt="" align="" />

            <span class="asset-headline-intro">SPIEGEL TV Magazin</span>
            <span class="asset-headline">Alle Filme der Sendungen</span>
         </a>
      </li>


      <li class="list-float-left" style="width:160px">
        <a href="http://www.seen.by" target="_blank">
  <img src="http://cdn2.spiegel.de/images/image-688855-thumb-mfhs.jpg" width="180" height="180" border="0" class="image-no-border" title="" alt="" align="" />
            <span class="asset-headline-intro">Sie wollen Fotos sehen</span>
            <span class="asset-headline">seen.by Fotokunst & Fotolabor</span>
         </a>
      </li>

      <li class="list-float-left" style="width:160px">
<a href="http://www.dctp.tv/">

<img src="http://cdn1.spiegel.de/images/image-504614-thumb-ispm.jpg" width="180" height="180" border="0" class="image-no-border" title="" alt="" align="" />

<span class="asset-headline-intro">dctp</span>
<span class="asset-headline">Das Web TV</span>
</a>
      </li>

      <li class="list-float-left" style="width:116px">
         <a href="/spiegel/unispiegel/index-2014-4.html">
            <img alt="Titelbild" src="http://magazin.spiegel.de/EpubDelivery/image/title/USP/2014/04/120" width="120"/>
            <span class="asset-headline-intro">UniSPIEGEL</span>
            <span class="asset-headline">Abenteuerliche Geschichte des Studenten Patrick Manyika aus Ruanda</span>
         </a>
      </li>
      <li class="list-float-left" style="width:230px">

<div class="asset-mixed-imagebox">
<a href="http://www.manager-magazin.de/immobilien/artikel/carsten-maschmeyer-verkauft-seine-villa-auf-mallorca-a-984973.html">
<img src="http://cdn2.spiegel.de/images/image-734099-hpcolumnrightsquare-kmum.jpg" width="230" height="230" border="0" class="image-no-border" title="" alt="" align="" />
</a>

</div>

<a href="http://www.manager-magazin.de/immobilien/artikel/carsten-maschmeyer-verkauft-seine-villa-auf-mallorca-a-984973.html">
<span class="asset-headline-intro">manager magazin</span>
<span class="asset-headline">

Berühmtes Domizil: Maschmeyers Traumvilla auf Mallorca wird verkauft</span>
</a>

      </li>
   </ul>
</div></div><script type="text/javascript">
                $(function() {
                    if(!spUA.isIPad()){
                        $("img.js-lazy").lazyload({ threshold : 500 });
                    } else {
                        // fuer das iPad kein lazyLoad (touchevent Problem: s. BUG #35671)
                        $('img.js-lazy').each(function() {
                            var source = $(this).attr('data-original');
                            if (typeof source != 'undefined' && source !== false) {
                                $(this).attr('src', source);
                                $(this).removeClass('js-lazy');
                            }
                        });
                    }
                });

                </script>

            <div id="footer">
    <div id="footer-content">

        <script type="text/javascript">
                    <!--
                        OAS_RICH('Bottom');
                        // -->
                    </script>
                <div id="spFooterMagazinBox">

<ul>
<li>
<h4>DER SPIEGEL</h4>
</li>
<li>
<a href="http://www.spiegel.de/spiegel/">
    <img alt="DER SPIEGEL" height="211" src="http://magazin.spiegel.de/EpubDelivery/image/title/SP/2014/32/160" width="160"/>
</a>
</li>
<li>
<a href="http://www.spiegel.de/spiegel/print/index-2014-32.html">Inhalt</a>
</li>
<li>
<a href="http://abo.spiegel.de/de/c/spiegel?b=SPOHCOVER&utm_source=spon&utm_medium=text&utm_content=SPOHCOVER&utm_campaign=heftgalerie" target="_blank">Abo-Angebote</a>
</li>
<!--li><a href="http://abo.spiegel.de/micro_issue" target="_blank">Heft kaufen</a></li-->
<li>
<a href="http://www.amazon.de/spiegel" target="_blank">Heft kaufen</a>
</li>
</ul>

<!--ul>
<li><h4>SPIEGEL JOB</h4></li>
<li><a href="http://www.spiegel.de/karriere/a-965062.html" target="_blank">
<li><img src="http://www.spiegel.de/images/image-685132-thumbbiga-uqeb.jpg" alt="SPIEGEL JOB" /></li></a></li>
<li><a href="http://www.spiegel.de/karriere/a-965062.html" target="_blank">Inhalt</a></li>
<li><a href="https://magazin.spiegel.de/digital/index_SP.html#SPJO/2014/1" target="_blank">Digitale Ausgabe</a></li>
<li><a href="http://www.amazon.de/dp/B00IWVCSQS/ref=nosim?tag=wwwspiegelde-21" target="_blank">Heft kaufen</a></li>
</ul-->


<ul>
<li>
<h4>Dein SPIEGEL</h4>
</li>
<li>
<a href="http://www.spiegel.de/spiegel/deinspiegel/index-2014-8.html">
    <img alt="DEIN SPIEGEL" height="211" src="http://magazin.spiegel.de/EpubDelivery/image/title/DEIN/2014/08/160" width="160"/>
</a>
</li>
<li>
<a href="http://www.spiegel.de/spiegel/deinspiegel/index-2014-8.html">Inhalt</a>
</li>
<li>
<a href="http://abo.spiegel.de/de/c/dein-spiegel?b=SPOHCOVER&utm_source=spon&utm_medium=text&utm_conten=SPOHCOVER&utm_campaign=heftgalerie" target="_blank">Abo-Angebote</a>
</li>
<!--li><a href="http://www.amazon.de/spiegel" target="_blank">Heft kaufen</a></li-->
</ul>

<ul>
<li>
<h4>SPIEGEL GESCHICHTE</h4>
</li>
<li>
<a href="http://www.spiegel.de/spiegel/spiegelgeschichte/index-2014-4.html">
<img alt="SPIEGEL GESCHICHTE" height="211" src="http://magazin.spiegel.de/EpubDelivery/image/title/SPGE/2014/04/160" width="160"/>
</a>
</li>
<li>
<a href="http://www.spiegel.de/spiegel/spiegelgeschichte/index-2014-4.html">Inhalt</a>
</li>
<li>
<a href="http://abo.spiegel.de/de/c/spiegel-geschichte?b=SPOHCOVER&utm_source=spon&utm_medium=text&utm_content=SPOHCOVER&utm_campaign=heftgalerie" target="_blank">Abo-Angebote</a>
</li>
<li>
<a href="http://www.amazon.de/spiegel" target="_blank">Heft kaufen</a>
</li>
</ul>


<ul>
<li>
<h4>SPIEGEL WISSEN</h4>
</li>
<li>
<a href="http://www.spiegel.de/spiegel/spiegelwissen/index-2014-3.html">
    <img alt="SPIEGEL WISSEN" height="211" src="http://magazin.spiegel.de/EpubDelivery/image/title/SPWI/2014/03/160" width="160"/>
</a>
</li>
<li>
<a href="http://www.spiegel.de/spiegel/spiegelwissen/index-2014-3.html">Inhalt</a>
</li>
<li>
<a href="http://abo.spiegel.de/de/c/spiegel-wissen?b=SPOHCOVER&utm_source=spon&utm_medium=text&utm_content=SPOHCOVER&utm_campaign=heftgalerie" target="_blank">Abo-Angebote</a>
</li>
<li>
<a href="http://www.amazon.de/spiegel" target="_blank">Heft kaufen</a>
</li>
</ul>

<ul>
<li>
<h4>KulturSPIEGEL</h4>
</li>
<li>
<a href="http://www.spiegel.de/spiegel/kulturspiegel/index-2014-8.html">
    <img alt="KulturSPIEGEL" height="211" src="http://magazin.spiegel.de/EpubDelivery/image/title/SPX/2014/08/160" width="160"/>
</a>
</li>
<li>
<a href="http://www.spiegel.de/spiegel/kulturspiegel/index-2014-8.html">Inhalt</a>
</li>
<li>
<a href="http://abo.spiegel.de?b=SPOHCOVER&utm_source=spon&utm_medium=text&utm_content=SPOHCOVER&utm_campaign=heftgalerie" target="_blank">Abo-Angebote</a>
</li>
</ul>

</div><div class="footer-partner-bar" id="spPartnerBar">
<h4>Mehr Serviceangebote von SPIEGEL-ONLINE-Partnern</h4>

<!-- AUTO -->
<ul class="spFirst">
<li>
<h5>AUTO</h5>
</li>

<li>
<span>
<a href="http://www.spiegel.de/auto/aktuell/benzinpreisvergleich-die-guenstigste-tankstelle-in-ihrer-naehe-a-185826.html" rel="nofollow" style="background-position:0 -31px;">
Benzinpreis
</a>
</span>
</li>

<li>
<span>
<a href="http://www.spiegel.de/auto/aktuell/bussgeldrechner-was-zu-schnelles-fahren-kostet-a-244772.html" rel="follow" style="background-position:0 -90px;">
Bußgeld-<br/>rechner
</a>
</span>
</li>

<li>
<span>
<a href="http://adserv.quality-channel.de/5c/www.spiegel.de/partner/987654/x21/qc/ON05X20025XSERVICEICON/zaehler.gif/1456789012" rel="follow" style="background-position:0 -953px;" title="Anzeige">
Neu-/Gebraucht-<br/>Fahrzeuge
</a>
</span>
</li>

</ul>

<!-- FREIZEIT 1 -->
<ul class="spFirst">
<li>
<h5>FREIZEIT</h5>
</li>

<li>
<span class="spPartnerBar1Zeile">
<a href="http://adserv.quality-channel.de/5c/www.spiegel.de/partner/987654/x21/qc/ON47XWESTLOTTOX1FOOTERCLICK/zaehler.gif/1456789012" rel="follow" style="background-position:0 -898px;" title="Anzeige">
Eurojackpot
</a>
</span>
</li>


<li>
<span class="spPartnerBar1Zeile">
<a href="http://adserv.quality-channel.de/5c/www.spiegel.de/partner/987654/x21/qc/ON15XWESTLOTTOX2FOOTERCLICK/zaehler.gif/1456789012" rel="follow" style="background-position:0 -868px;" title="Anzeige">
Lottozahlen
</a>
</span>
</li>

<li>
<span class="spPartnerBar1Zeile">
<a href="http://www.spiegel.de/schulspiegel/ferientermine-a-193925.html" rel="follow" style="background-position:0 -150px;">
Ferientermine
</a>
</span>
</li>

<li>
<span>
<a href="http://www.amazon.de/gp/feature.html/?ie=UTF8&camp=1638&creative=19454&docId=1000127753&linkCode=ur2&pf_rd_i=186606&pf_rd_m=A3JWKAKR8XB7XF&pf_rd_p=404862427&pf_rd_r=0FD41ESH7KPCMZ84CKTK&pf_rd_s=center-3&pf_rd_t=101&plgroup=1&tag=wwwspiegelde-21" rel="follow" style="background-position:0 -180px;">
Bücher<br/>bestellen
</a>
</span>
</li>

</ul>


<!-- FREIZEIT 2 -->

<ul>
<li>
<h5 style="color: #f6f6f6;">AUTO UND FREIZEIT</h5>
</li>


<li>
<span class="spPartnerBar1Zeile">
<a href="http://adserv.quality-channel.de/5c/www.spiegel.de/partner/987654/x21/qc/ON52X5958XFOOTERCLICK/zaehler.gif/1456789012" rel="follow" style="background-position:-2px -301px;" title="Anzeige">
Partnersuche
</a>
</span>
</li>

<li>
<span class="spPartnerBar1Zeile">
<a href="http://adserv.quality-channel.de/5c/www.spiegel.de/partner/987654/x21/qc/ON03XX6596XXICON/zaehler.gif/1456789012" rel="nofollow" style="background-position:0 -240px;" title="Anzeige">
Arztsuche
</a>
</span>
</li>

<li>
<span class="spPartnerBar1Zeile">
<a href="http://adserv.quality-channel.de/5c/www.spiegel.de/partner/987654/x21/qc/ON09X5959XFOOTERCLICK4/zaehler.gif/1456789012" rel="follow" style="background-position:0 -331px;" title="Anzeige">
DSL-Vergleich
</a>
</span>
</li>

<li>
<span class="spPartnerBar1Zeile">
<a href="http://adserv.quality-channel.de/5c/www.spiegel.de/partner/584796/x21/qc/ON22X20319XSERVICEICON/zaehler.gif/1456789012" rel="follow" style="background-position:0 -984px;" title="Anzeige">
Hörgeräte-<br/>Beratung
</a>
</span>
</li>


</ul>


<!-- ENERGIE -->

<ul>
<li>
<h5>ENERGIE</h5>
</li>

<li>
<span>
<a href="http://adserv.quality-channel.de/5c/www.spiegel.de/partner/987654/x21/qc/ON09X5959XFOOTERCLICK2/zaehler.gif/1352749516" rel="follow" style="background-position:0 -390px;" title="Anzeige">
Gasanbieter-<br/>vergleich
</a>
</span>
</li>

<li>
<span>
<a href="http://adserv.quality-channel.de/5c/www.spiegel.de/partner/987654/x21/qc/ON09X5959XFOOTERCLICK3/zaehler.gif/1762741262" rel="nofollow" style="background-position:0 -419px;" title="Anzeige">
Stromanbieter-<br/>vergleich
</a>
</span>
</li>

<li>
<span>
<a href="https://ratgeber.co2online.de/index.php?berater=ratgeberauswahl&amp;portal_id=spiegel_online" rel="nofollow" style="background-position:0 -450px;" title="Anzeige">
Energiespar-<br/>ratgeber
</a>
</span>
</li>

<li>
<span>
<a href="http://adserv.quality-channel.de/5c/www.spiegel.de/partner/987654/x21/qc/ON09X5959XFOOTERCLICK/zaehler.gif/1456789012" rel="nofollow" style="background-position:0 -479px;" title="Anzeige">
Energie-<br/>vergleiche
</a>
</span>
</li>

</ul>

<!-- JOB -->

<ul>
<li>
<h5>JOB</h5>
</li>

<li>
<span class="spPartnerBar1Zeile">
<a href="http://www.personalmarkt.de/source-links/spiegel/serviceangebotebox.html" rel="nofollow" style="background-position:0 -510px;" title="Anzeige">
Gehaltscheck
</a>
</span>
</li>

<li>
<span>
<a href="http://www.spiegel.de/wirtschaft/service/brutto-netto-rechner-was-von-ihrem-lohn-noch-uebrig-bleibt-a-223811.html" rel="follow" style="background-position:0 -90px;">
Brutto-Netto-<br/>Rechner
</a>
</span>
</li>

<li>
<span class="spPartnerBar1Zeile">
<a href="http://www.spiegel.de/unispiegel/studium/tools-hier-werden-sie-geholfen-a-640620.html" rel="follow" style="background-position:0 -540px;">
Uni-Tools
</a>
</span>
</li>

<li>
<span class="spPartnerBar1Zeile">
<a href="http://adserv.quality-channel.de/5c/www.spiegel.de/partner/987654/x21/qc/ON52X5997XFOOTERCLICK/zaehler.gif/1456789012" rel="follow" style="background-position:0 -840px;" title="Anzeige">
Jobsuche
</a>
</span>
</li>

</ul>

<!-- FINANZEN 1 -->

<ul>
<li>
<h5>FINANZEN</h5>
</li>


<li>
<span>
<a href="http://boersen.manager-magazin.de/spo_mmo/kurse_crossrates.htm?p=0" rel="follow" style="background-position:0 -90px;">
Währungs-<br/>rechner
</a>
</span>
</li>

<li>
<span>
<a href="http://adserv.quality-channel.de/5c/www.spiegel.de/partner/987654/x21/qc/ON52X5993XFOOTERCLICK/zaehler.gif/1456789012" rel="nofollow" style="background-position:0 -749px;" title="Anzeige">
Immobilien-<br/>Börse
</a>
</span>
</li>

<li>
<span>
<a href="http://adserv.quality-channel.de/5c/www.spiegel.de/partner/987654/x21/qc/ON16X20239XICON/zaehler.gif/52147896" rel="nofollow" style="background-position:0 -627px;" title="Anzeige">
Kredit-<br/>vergleich
</a>
</span>
</li>

<li>
<span>
<a href="/wirtschaft/service/versicherung-check-fuer-haftpflicht-hausrat-berufsunfaehigkeit-a-960380.html" rel="follow" style="background-position:0 -687px;">
Versicherungen
</a>
</span>
</li>


</ul>

<!-- TESTZWECKE -->
<div>
            <!-- ATTENTION! 'jquery.js' is required in order to run this example -->

            <!-- feature not available -->
            <div id="apns_notavailable" style="margin-top: 10px; text-align: center; display: none;">
                <div>
</div>
            </div>
            <!-- checking permissions -->
            <div id="apns_available" style="margin-top: 10px; text-align: center; display: none;">
                <div>Sie können Push-Benachrichtigung von SPIEGEL ONLINE aktivieren!
</div>
            </div>
            <!-- denied permissions -->
            <div id="apns_denied" style="margin-top: 10px; text-align: center; display: none;">
                <div>Sie haben die Push-Benachrichtigung von SPIEGEL ONLINE ausgeschaltet!
</div>
            </div>
            <!-- granted permissions -->
            <div id="apns_granted" style="margin-top: 20px; text-align: center; display: none;">
                <div>Push-Benachrichtigung von SPIEGEL ONLINE sind eingeschaltet
</div>
                <div>APNS-Token : <span id="apns_token"/>

</div>
            </div>
            <script type="text/javascript">
        var checkRemotePermission = function (permissionData) {

        $('#apns_notavailable').hide();
        $('#apns_available').hide();
        $('#apns_granted').hide();
        $('#apns_denied').hide();

        if (permissionData.permission === 'default') {
           $('#apns_available').show();

            // This is a new web service URL and its validity is unknown.
            window.safari.pushNotification.requestPermission(
                'https://qs.a.spiegel.de/push/apns/macos', // The web service URL.
                'web.de.spiegel.spon.test', // The Website Push ID.
                {}, // Data that you choose to send to your server to help you identify the user
                checkRemotePermission         // The callback function.
            );
        }
        else if (permissionData.permission === 'denied') {
            // The user said no.
            $('#apns_denied').show();
        }
        else if (permissionData.permission === 'granted') {
            // The web service URL is a valid push provider, and the user said yes.
            // permissionData.deviceToken is now available to use.
            $('#apns_granted').show();
            var token = permissionData.deviceToken;
            $('#apns_token').text(token);
        }
    };

        if ('safari' in window && 'pushNotification' in window.safari) {
            //console.log(">>> Mac OS X Mavericks detected!");
            var permissionData = window.safari.pushNotification.permission('web.de.spiegel.spon.test');
            checkRemotePermission(permissionData);
        } else {
            $('#apns_notavailable').show();
            //console.log(">>> NOT Mac OS X Mavericks?");
        }
        </script>
        </div>

</div><div class="footer-main-nav">
                    <ul class="clearfix">
                        <li><a href="/">Home</a></li>
                        <li><a href="/politik/">Politik</a></li>
                        <li><a href="/wirtschaft/">Wirtschaft</a></li>
                        <li><a href="/panorama/">Panorama</a></li>
                        <li><a href="/sport/">Sport</a></li>
                        <li><a href="/kultur/">Kultur</a></li>
                        <li><a href="/netzwelt/">Netzwelt</a></li>
                        <li><a href="/wissenschaft/">Wissenschaft</a></li>
                        <li><a href="/gesundheit/">Gesundheit</a></li>
                        <li><a href="/einestages/">einestages</a></li>
                        <li><a href="/unispiegel/">Uni</a></li>
                        <li><a href="/schulspiegel/">Schule</a></li>
                        <li><a href="/reise/">Reise</a></li>
                        <li><a href="/auto/">Auto</a></li>
                        <li><a href="http://wetter.spiegel.de/spiegel/">Wetter</a></li>
                    </ul>
                </div>

                <div class="footer-sub-nav">
                    <ul>
                        <li><strong>DIENSTE</strong></li>
                        <li><a href="/schlagzeilen/">Schlagzeilen</a></li>
                        <li><a href="/nachrichtenarchiv/">Nachrichtenarchiv</a></li>
                        <li><a href="/dienste/a-271804.html">RSS</a></li>
                        <li><a href="/dienste/a-902432.html">Newsletter</a></li>
                        <li><a href="/dienste/a-419947.html">Mobil</a></li>
                        </ul>
                    <ul>
                        <li><strong>VIDEO</strong></li>
                        <li><a href="/video/">Nachrichten Videos</a></li>
                        <li><a href="/sptv/magazin/">SPIEGEL TV Magazin</a></li>
                        <li><a href="/sptv/programm/">SPIEGEL TV Programm</a></li>
                        <li><a href="http://www.spiegel-geschichte.tv/" target="_blank">SPIEGEL Geschichte</a></li>
                        <li><a href="http://www.spiegelwissen.tv" target="_blank">SPIEGEL TV Wissen</a></li>
                    </ul>
                    <ul>
                        <li><strong>MEDIA</strong></li>
                        <li><a href="http://www.spiegel-qc.de/" target="_blank">SPIEGEL QC</a></li>
                        <li><a href="/mediadaten/" target="_blank">Mediadaten</a></li>
                        <li><a href="http://www.spiegel-qc.de/selbstbuchungstool" target="_blank">Selbstbuchungstool</a></li>
                        <li><a href="http://www.quality-abo.de/" target="_blank">weitere Zeitschriften</a></li>
                    </ul>
                    <ul>
                        <li><strong>MAGAZINE</strong>
                        <li><a href="/spiegel/">DER SPIEGEL</a></li>
                        <li><a href="/deinspiegel/">Dein SPIEGEL</a></li>
                        <li><a href="/spiegelgeschichte/">SPIEGEL GESCHICHTE</a></li>
                        <li><a href="/spiegelwissen/">SPIEGEL WISSEN</a></li>
                        <li><a href="/kulturspiegel/">KulturSPIEGEL</a></li>
                        <li><a href="/spiegel/unispiegel/">UniSPIEGEL</a></li>
                    </ul>
                    <ul>
                        <li><strong>SPIEGEL GRUPPE</strong></li>
                        <li><a href="http://abo.spiegel.de/?b=SPOHFOOTER&amp;utm_source=spon&amp;utm_medium=text&amp;utm_content=SPOHFOOTER&amp;utm_campaign=abbinder">Abo</a></li>
                        <li><a href="http://www.spiegel.de/shop" target="_blank">Shop</a></li>
                        <li><a href="/sptv/">SPIEGEL&nbsp;TV</a></li>
                        <li><a href="http://www.manager-magazin.de/" target="_blank">manager&nbsp;magazin</a></li>
                        <li><a href="http://www.harvardbusinessmanager.de/" target="_blank">Harvard Business Man.</a></li>
                        <li><a href="http://www.buchreport.de/" target="_blank">buchreport</a></li>
                        <li><a href="http://www.buchaktuell.de/" target="_blank">buch aktuell</a></li>
                        <li><a href="http://www.spiegelgruppe.de/" target="_blank">SPIEGEL-Gruppe</a></li>
                    </ul>
                    <ul>
                        <li><strong>WEITERE</strong>
                        <li><a href="/hilfe/">Hilfe</a></li>
                        <li><a href="/kontakt/">Kontakt</a></li>
                        <li><a href="/extra/a-853891.html">Nutzungsrechte</a></li>
                        <li><a href="/dienste/a-639126.html">Datenschutz</a></li>
                        <li><a href="/impressum/">Impressum</a></li>
                    </ul>
                </div>
                <div class="top-anchor link-gradient-button-box">
                    <a href="#" class="link-gradient-button"><span>TOP</span></a>
                </div>

                <script type="text/javascript">
                <!--
                    OAS_RICH('x70');
                // -->
                </script>

            </div> </div> <script type='text/javascript'>
    <!--
        spDoGa();
    -->
</script>

</div></div><div id="spColumnAd">
    <div id="qcRight" class="test">
        <script type="text/javascript">
        <!--
        OAS_RICH('Right');
        // -->
        </script><br class="clearfix" />
    </div>
    <script type="text/javascript">
    <!--
        OAS_RICH('Bottom1');
    // -->
    </script><br class="clearfix" />
    <script type="text/javascript">
    <!--
        OAS_RICH('TopRight');
    // -->
    </script><br class="clearfix" />
</div></div></body>
</html>

    """) + "</pre>")


