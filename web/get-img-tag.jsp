

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

        <title>Cyclops - Search an image</title>

        <%@page import="java.io.*,java.util.*,db.db_process"%>
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

            <%
                        String tag = request.getParameter("t");
                                                    

                          
                        db_process dd = new db_process();
                        ArrayList getx = dd.getByTagName(tag);
                                                if(getx.size()!=0) {
                                                    %>
                                                    <div class="tagtop">Images tagged with: <span style="background-color: #fbcb09;"><%=tag%></span> | <a class="linker" href="JavaScript:void(0);" onClick="history.go(-1)">Back to search results</a></div>
                                                    <%

                        String img_id = null;
                        String name = "";
                        String fname = "";
                        String descr = "";
                        String other = "";
                        String valid = null;
                        String tags = "";
                        for(int hh=0;hh<getx.size();hh++)
                            {

                            img_id = getx.get(hh).toString();
                            valid = getx.get(hh+1).toString();
                            fname = getx.get(hh+2).toString();
                            name = getx.get(hh+3).toString();
                            descr = getx.get(hh+4).toString();
                            other = getx.get(hh+5).toString();
                            hh+=5;
                            //    System.out.println(img_id+" == "+valid+" == "+name+" == "+url+" == "+descr+" == "+other);

                            ArrayList tagx = new ArrayList();




                            tagx = new db_process().getTags(img_id);
                            for (int j = 0; j < tagx.size(); j++) {
                                if (tagx.size() - 1 == j) {
                                    tags += tagx.get(j).toString();
                                } else {
                                    tags += tagx.get(j).toString() + ",";
                                }
                            }










            // out.println(img_id+" == "+valid+" == "+name+" == "+url+" == "+descr+" == "+other+" == "+tags+" == "+linkss);





                        if (valid.equals("1")) {


            %>


            <div class="search_img_upload_thumb_main"><img src="imagepool/<%=fname%>" alt="<%=fname%>" /><div class="tippy" style="display: none;"> <table><tr><td><img src="imagepool/<%=fname%>" alt="<%=fname%>" class="image_preview" /></td><td><table><tr><td>
                                            Filename: <%=name%></td></tr><tr><td>Links: <% ArrayList linksx = new db_process().getLinks(img_id);
                                                                                                                                        for (int k = 0; k < linksx.size(); k++) {
                                                                                                                                            String linkss = linksx.get(k).toString();
                                                                                                                                            out.print("<a href=\"" + linkss + "\" target=\"_blank\">" + linkss + "</a>  ");
                                                                                                                                        }%></td></tr><tr><td>Details: <%=descr%></td></tr><tr><td>Comments: <%=other%></td></tr><tr><td>Tags: <%=tags%></td></tr></table></td></tr></table><a class="tiplink" href="img-similar-search.jsp?id=<%=img_id%>">Search similar</a></div></div>

            <%   tags = "";

                    }
                } }
                        else
                            out.print("<div class=\"tagtop\">Oops. No images tagged with <span style=\"background-color: #fbcb09;\">"+tag+"</span></div>");

            %>
        </div>
    </body>


        <script>

        $('.search_img_upload_thumb_main').each(function() {
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
         backgroundColor: '',
         zIndex: 5000  // Make sure the zIndex is below 6000 to keep it below tooltips!
      })
      .appendTo(document.body) // Append to the document body
      .hide(); // Hide it initially







                });




            $('.search_img_upload_thumb_main').remove('.tippy');

    </script>

</html>
