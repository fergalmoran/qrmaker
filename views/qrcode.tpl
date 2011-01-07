<!DOCTYPE HTML>

<html>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta http-equiv="Content-Type" content="text/html" />

    <title>QR vCard Generator</title>

    <link media="screen" href="css/default.uni-form.css" rel="stylesheet">
    <link href="css/default.uni-form.css" title="Default Style" media="screen" rel="stylesheet"/>

    <style type="text/css" media="screen">
      
      @import "css/uni-form.css";
      
      /* You don't need these, they are here to tune up the page */
      html{ color: #343434; background: #bcc2c6 url(bg.png); font-size: 14px; line-height: 1.5; font-family: "Lucida Sans Unicode", "Lucida Grande", Arial, Verdana, sans-serif; }
        body{}
          
          a:link,
          a:visited{ text-decoration: none; color: #254a86; }
          a:hover,
          a:focus  { text-decoration: underline; }
          
          h1,h2,h3,ul,ol,p{ margin: 1.5em 0; }
          
          h1{ margin: 42px auto 28px auto; width: 284px; }
          h2{ font-size: 1.25em; }
          .uniForm h2{ margin: 1em 0 1em 1.15em; }
          fieldset h3{ margin: 1.5em -28px; padding: 14px 28px; line-height: 1; background: #efefef; color: #343434; }
          
          .uniForm{ width: 55%; background: #fff; margin: 28px auto; padding: 28px;
                    /* CSS3 */
                    border-radius:         12px;
                    -webkit-border-radius: 12px;
                    -moz-border-radius:    12px;
                    -o-border-radius:      12px;
                    -khtml-border-radius:  12px;
                  }
            
            .header{ margin: -28px -28px 28px -28px; padding: 1px 28px; background: #efefef; border-bottom: 1px solid #dfdfdf; position: relative;
                     /* CSS3 */
                     border-top-left-radius:          10px;
                     border-top-right-radius:         10px;
                     -webkit-border-top-left-radius:  10px;
                     -webkit-border-top-right-radius: 10px;
                     -moz-border-radius-topleft:      10px;
                     -moz-border-radius-topright:     10px;
                   }
              .header h2{ margin: 1.5em 0 0 0; color: #343434; color: #777; }
              .header p { margin-top: 0; font-size: 12px; color: #777; }
                .header .cta{ position: absolute; bottom: 26px; right: 28px; text-align: right; font-weight: bold; background: #194789; padding: 7px 14px;
                              /* CSS3 */
                              border-radius:         4px;
                              -webkit-border-radius: 4px;
                              -moz-border-radius:    4px;
                              -o-border-radius:      4px;
                              -khtml-border-radius:  4px;
                              text-shadow: -1px -1px 0 rgba(0,0,0,.25);
                            }
                .header .cta:link,
                .header .cta:visited{ color: #fff; }
                .header .cta:focus,
                .header .cta:hover{ text-decoration: none;
                                    /* CSS3 */
                                    box-shadow:         0 0 9px rgba(0,163,255,1);
                                    -webkit-box-shadow: 0 0 9px rgba(0,163,255,1);
                                    -moz-box-shadow:    0 0 9px rgba(0,163,255,1);
                                  }
                .header .cta:active{ bottom: 25px; }
          
          .browse{ margin: 0; position: fixed; top: 28px; right: 28px; width: 84px; padding: 28px 28px 14px 28px; font-size: 12px; background: #97a2b0;
                   /* CSS3 */
                   border-radius:         12px;
                   -webkit-border-radius: 12px;
                   -moz-border-radius:    12px;
                   -o-border-radius:      12px;
                   -khtml-border-radius:  12px;
                 }
            .browse h2{ font-size: 12px; margin: 0 0 14px 0; }
            .browse ul{ margin: 0; padding: 0; }
              .browse li{ margin: 0 0 14px 0; padding: 0; list-style: none; }
              .download{ float: right; position: relative; top: 2px; }
          .intro { width: 55%; margin: 28px auto; text-align: center; font-size: 1.15em; }
          #footer{ width: 55%; margin: 28px auto; text-align: center; font-size: .75em; color: #777; }
          
          /* IE6 fixes for the page */
          * html form.uniForm{ overflow: hidden; }
            * html .header{ zoom: 1; overflow: hidden;}
                    * html .browse{ position: absolute; }

    </style>

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script> 
    <script src="js/uni-form.jquery.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $(".browse a").click(function() {
                $("link").attr("href",$(this).attr('rel'));
                return false;
            });
        });
    </script>
    
    <!--[if lte ie 7]>
      <style type="text/css" media="screen">
        /* Move these to your IE6/7 specific stylesheet if possible */
        .uniForm, .uniForm fieldset, .uniForm .ctrlHolder, .uniForm .formHint, .uniForm .buttonHolder, .uniForm .ctrlHolder ul{ zoom:1; }
      </style>
    <![endif]-->
    <script type="text/javascript">
        var rpxJsHost = (("https:" == document.location.protocol) ? "https://" : "http://static.");
        document.write(unescape("%3Cscript src='" + rpxJsHost +
                    "rpxnow.com/js/lib/rpx.js' type='text/javascript'%3E%3C/script%3E"));
    </script>
    <script type="text/javascript">
        RPXNOW.overlay = true;
        RPXNOW.language_preference = 'en';
    </script>
</head>
<body>
    <div class="header">
        <h2>QR Code vCard Generator</h2>
        <p>Author: <a href="http://fergalmoran.com/">Fergal Moran</a> <a href="http://blog.fergalmoran.com/qrcodegenerator/" class="cta">Blog article</a></p>
    </div>
      
    <div id="okMsg" style="padding-left: 100px">
        <p>
            Here is your qrcode vCard. Right click the image below and select "Save as" to download it. <br />
            Alternatively, you may click "Permalink" below to generate a permanent URL for this image (please note, this requires signing in and may not always be available).
        </p>
        <span align="centre">
            <img align="middle" src="static/cache/{{id}}.png" alt="QRCode should be here" />
        </span>
        <div id="auth_widget">
            <!-- <a class="rpxnow" onclick="return false;" href="https://fm-qrcodes.rpxnow.com/openid/v2/signin?token_url=http%3A%2F%2Fdev.fergalmoran.com%3A8080%2Fauth_proxy"> Permalink </a> -->
            <a class="" href="/permalink/{{id}}"> Permalink </a>
        </div>
        <div id="permalink">
            {{!linkurl}}
        </div>
    </div>
</body>
</html>
