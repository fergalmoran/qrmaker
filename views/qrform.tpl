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

</head>
<body>
    <div class="header">
        <h2>QR Code vCard Generator</h2>
        <p>Author: <a href="http://fergalmoran.com/">Fergal Moran</a> <a href="http://www.fergalmoran.com/2011/01/generating-qr-codes-containing-vcard-data/" class="cta">Blog article</a></p>
    </div>
      
    <div id="errorMsg">
    </div>

    <div id="okMsg">
    </div>
    
    <form action="genqr" method="POST" enctype="multipart/form-data" class="uniForm">
        <fieldset class="inlineLabels">
            <h3>vCard Details</h3>
            <div class="ctrlHolder">
                <label for="firstname">First name</label>
                <input id="firstname" name="FIRSTNAME" value="" size="35" class="textInput" type="text">
            </div>
            <div class="ctrlHolder">
                <label for="surname">Surname</label>
                <input id="surname" name="SURNAME" value="" size="35" class="textInput" type="text">
            </div>
            <div class="ctrlHolder">
                <label for="email">Email address</label>
                <input id="email" name="EMAIL" value="" size="35" class="textInput" type="text">
            </div>
<!--
            <div class="ctrlHolder">
                <label for="">Organisation</label>
                <input id="organisation" name="ORGANISATION" value="" size="35" class="textInput" type="text">
            </div>
-->
            <div class="ctrlHolder">
                <label for="telmobile">Telephone (mobile):</label>
                <input id="telmobile" name="TELMOBILE" value="" size="35" class="textInput" type="text">
            </div>
            <div class="ctrlHolder">
                <label for="telhome">Telephone (home):</label>
                <input id="telhome" name="TELHOME" value="" size="35" class="textInput" type="text">
            </div>
            <div class="ctrlHolder">
                <label for="url">Website Address:</label>
                <input id="url" name="URL" value="" size="35" class="textInput" type="text">
            </div>
            <div class="ctrlHolder">
                <label for="addrhome">Address:</label>
                <input id="addrhome" name="ADDRHOME" value="" size="35" class="textInput" type="text">
                <p class="formHint">Please seperate lines with a comma</p>
            </div>
            <div class="buttonHolder"><button type="submit" class="primaryAction">Submit</button></div>
        </fieldset>
    </form>
</body>
</html>
