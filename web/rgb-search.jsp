

<%@page import="org.apache.catalina.Session"%>
<%--
    Document   : index
    Created on : Aug 26, 2010, 12:05:11 PM
    Author     : Student
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" type="text/css" href="module.css" />
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
        <script type="text/javascript" src="js/jquery.qtip-1.0.0.min.js"></script>
        <script type="text/javascript" src="js/colorselector.js"></script>



        <title>Cyclops - Search an image</title>

        <%@page import="java.io.*,java.util.*,java.net.*,imgsearch.rgbTest,db.db_process"%>
    </head>
    <body>
        <div class="top_box">
            <div class="headline_span_search"

                 <a href="index.jsp"> <div class="headline_main">
                        <h1>Cyclops<span class="tag">The Reverse Image Search</span></h1>

                    </div></a><div class="circle"><img src="images/logo.png" /></div>

            </div>
            <table border="0"><tr><td><b>Begin a search,</b></td><td></td><td>Upload an image:</td><td><form id="upform" name="upload" method="post" action="img-search.jsp"  enctype="multipart/form-data">
                            <div class="fileinputs">
                                <input id="picup" name="upload" type="file" onchange="this.form.submit();" class="file" size="3"/>
                                <div class="fakefile">
                                    Upload
                                </div>
                            </div>
                        </form></td><td></td><td></td><td><b>OR</b></td><td></td><td>Enter URL:</td><td><td><form id="upformurl" name="upload2" method="POST" action="img-search-url.jsp">
                        <input type="text" name="uploadurl" class="search_textfield" /></td><td><input type="submit" name="uploadbtn2" value="Submit" class="search_button" /></form>
                    </td></tr>
            </table>
        </div>



        <div class="search_wrapper">
            <div class="box_side_box">
                <table><tr>Search Images based on color:</td></tr><tr><td>
                <form name="rgb" method="POST" action="rgb-search.jsp">
                    <input name="colorpicker" type="text" class="color" value="#FFFFFF">

                    <input type="hidden" text name="r">
                    <input type="hidden" text name="g">
                    <input type="hidden" text name="b"></td></tr>
                    <tr><td align="right">Begin search: 
                        <input type="submit" class="button" name="submit" value="Search Images" size="3" onclick="this.form.r.value=HexToR(this.form.colorpicker.value);this.form.g.value=HexToG(this.form.colorpicker.value);this.form.b.value=HexToB(this.form.colorpicker.value);"></td></tr>
                </form>

                <script language="JavaScript">
                    <!--
                    R = HexToR("#FFFFFF");
                    G = HexToG("#FFFFFF");
                    B = HexToB("#FFFFFF");

                    function HexToR(h) { return parseInt((cutHex(h)).substring(0,2),16) }
                    function HexToG(h) { return parseInt((cutHex(h)).substring(2,4),16) }
                    function HexToB(h) { return parseInt((cutHex(h)).substring(4,6),16) }
                    function cutHex(h) { return (h.charAt(0)=="#") ? h.substring(1,7) : h}

                    //-->
                </script>




            


            <% try {
                            int r = Integer.parseInt(request.getParameter("r"));
                            int g = Integer.parseInt(request.getParameter("g"));
                            int b = Integer.parseInt(request.getParameter("b"));
                            System.out.println("r " + r + " g " + g + " b " + b);

                            String img_id = null;
                            String name = "";
                            String descr = "";
                            String other = "";
                            String valid = null;
                            String tags = "";
                            String tagbs = "";



                            ArrayList getx = new ArrayList();


            %>
                    <tr><td><div class="line"></div></td></tr><tr><td>Displaying images based on:</td></tr><tr><td align="right"> <div class="box_color" style="background-color: rgb(<%=r%>,<%=g%>,<%=b%>);" ></div></td></tr></table>
            
            </div>
            <div class="box_side_box_image">
                Approximate image matches: <br />
                <%

                     rgbTest rgb = new rgbTest();

                     Vector vv = rgb.getRgb(config.getServletContext().getRealPath("/") + "\\imagepool\\", r, g, b);
                     if (vv.size() == 0) {
                %>
                <br /><b>Oh snap! No Images Found. Bad Server. Try another search.</b>
                <%                                                                    } else {
                                                                        for (int i = 0; i < vv.size(); i++) {
                                                                            System.out.println(vv.elementAt(i));
                                                                            String ufimg = vv.elementAt(i).toString();
                                                                            File imgdisp = new File(ufimg);
                                                                            String xx = imgdisp.getName();
//System.out.println("xxx  = = "+xx);

                                                                                             getx = new db_process().getdetails(xx);

                                                                            if (getx.get(0).toString() != null) {

                                                                            img_id = getx.get(0).toString();
                                                                            valid = getx.get(1).toString();
                                                                            name = getx.get(2).toString();
                                                                            descr = getx.get(3).toString();
                                                                            other = getx.get(4).toString();
                                                                            //    System.out.println(img_id+" == "+valid+" == "+name+" == "+url+" == "+descr+" == "+other);

                                                                            ArrayList tagx = new ArrayList();
                                                                            ArrayList tagb = new ArrayList();



                                                                            tagx = new db_process().getTags(img_id);
                                                                            for (int j = 0; j < tagx.size(); j++) {
                                                                            if (tagx.size() - 1 == j) {
                                                                            tags += tagx.get(j).toString();
                                                                            } else {
                                                                            tags += tagx.get(j).toString() + ",";
                                                                            }
                                                                            }



                                                                            






                                                                            // out.println(img_id+" == "+valid+" == "+name+" == "+url+" == "+descr+" == "+other+" == "+tags+" == "+linkss);


                                                                            }


                                                                            if (valid.equals("1")) {


                                                                             %>

                 <span class="box_box"> <img src="imagepool/<%=xx%>" alt="<%=xx%>">
                        <div class="tippy" style="display: none;"> <table><tr><td><img src="imagepool/<%=xx%>" alt="<%=xx%>" class="image_preview" /></td><td><table><tr><td>
                                                    Filename: <%=name%></td></tr><tr><td>Links: <% ArrayList linksx = new db_process().getLinks(img_id);
                                                                                                                    for (int k = 0; k < linksx.size(); k++) {
                                                                                                                        String linkss = linksx.get(k).toString();
                                                                                                                        out.print("<a href=\"" + linkss + "\" target=\"_blank\">" + linkss + "</a>  ");
                                                                                                                    } %> </td></tr><tr><td>Details: <%=descr%></td></tr><tr><td>Comments: <%=other%></td></tr><tr><td>Tags: <%=tags%></td></tr></table></td></tr></table></div></span>
                    <%   tags = "";

                    }
                                        }
                                    }
                                } catch (Exception e) {
                                    System.out.println("Excep = " + e);
                                }





                    %>



            </div></div>



    </body>


    <script>






        

        $('.box_box').each(function() {
            $(this).qtip({
                content: {
                    title: {
                        text: 'Image Preview',
                        button: 'Close'
                    },

                    text: $(this).children('.tippy')

                },


                
                position: {
                    target: $(document.body), // Position it via the document body...
                    corner: 'center' // ...at the center of the viewport
                },
                show: {
                    when: 'click', // Show it on click
                    solo: true // And hide all other tooltips
                },
                hide: false,
                style: {
                    width: 'auto',
                    padding: '14px',
                    border: {
                        width: 9,
                        radius: 9,
                        color: '#666666'
                    },
                    name: 'light'
                },
                api: {
                    beforeShow: function()
                    {
                        // Fade in the modal "blanket" using the defined show speed
                        $('#qtip-blanket').fadeIn(this.options.show.effect.length);
                    },
                    beforeHide: function()
                    {
                        // Fade out the modal "blanket" using the defined hide speed
                        $('#qtip-blanket').fadeOut(this.options.hide.effect.length);
                    }
                }
            });

            // Create the modal backdrop on document load so all modal tooltips can use it
            $('<div id="qtip-blanket">')
            .css({
                position: 'absolute',
                top: $(document).scrollTop(), // Use document scrollTop so it's on-screen even if the window is scrolled
                left: 0,
                height: $(document).height(), // Span the full document height...
                width: '100%', // ...and full width

                opacity: 0.7, // Make it slightly transparent
                backgroundColor: 'black',
                zIndex: 5000  // Make sure the zIndex is below 6000 to keep it below tooltips!
            })
            .appendTo(document.body) // Append to the document body
            .hide(); // Hide it initially







        });

                

            
        $('.box_box').remove('.tippy');
        
    </script>




</html>
