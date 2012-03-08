<%--
    Document   : index
    Created on : Aug 26, 2010, 12:05:11 PM
    Author     : Boaz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
        <link rel="stylesheet" type="text/css" href="module.css" />
        
        

		

         <title>Cyclops - The Reverse Image Search</title>
         



    </head>
    <body>
        <div class="menu_top">
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="#">About</a></li>
                <li><a href="#">FAQ</a></li>
            </ul>
        </div>

        <div class="wrapper">
            <div class="headline_span"><div class="headline_main">


                    <h1>Cyclops<span class="tag">The Reverse Image Search</span></h1>

                </div><div class="circle"><img src="images/logo.png" /></div>

            </div>

            <div class="search_box1">
                <table border="0"><tr><td><b>Begin a search,</b></td><td></td><td>Upload an image:</td><td><form id="upform" name="upload" method="post" action="img-search.jsp"  enctype="multipart/form-data">
            <div class="fileinputs">
                <input id="picup" name="upload" type="file" onchange="this.form.submit();" class="file" size="3"/>
                <div class="fakefile">
                    Upload
                </div>
            </div>
        </form></td><td></td><td></td><td><b>OR</b></td><td></td><td>Enter URL:</td><td><td><form id="upformurl" name="upload2" method="POST" action="img-search-url.jsp">
                <input type="text" class="search_textfield" name="uploadurl" /></td><td><input type="submit" name="uploadbtn2" value="Submit" class="search_button" /></form>
                
        </td></tr>
                </table>
            </div></div>

            <div class="h_about_box">
            <img src="images/main-1.png" /> Cyclops, codenamed Project Mimto, is a reverse image search engine. You can submit an image to Cyclops to find out where it came from,
how it is being used, if modified versions of the image exist.
<br><br>
Cyclops is the one image search engine that uses image identification technology rather than keywords, metadata or watermarks.
It is free and open sourced. For more details, see the About and FAQ.


            </div>
    </body>
   

</html>
