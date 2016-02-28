<%-- 
    Document   : home
    Created on : Aug 26, 2010, 3:06:20 PM
    Author     : Student
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*,java.io.*,db.db_process" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" type="text/css" href="module.css" />
<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="js/jquery.qtip-1.0.0.min.js"></script>
<script type="text/javascript" src="js/jquery.timer.js"></script>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrator Cpanel</title>
    </head>
    <body>
        <%
        if(session.getAttribute("log")==null)
            { response.sendRedirect("login-req.jsp"); }


        %>


        <div class="wrapper">        




            <div class="admin_box_side">

                <div class="table_container">
                <%

                            db_process dd = new db_process();
                            ArrayList list = dd.getNotValid();

                            System.out.println("List = " + list.size());
                            out.println("<div class=\"tag\">You have " + list.size() / 5 + " images to approve.</div>");

                            for (int i = 0; i < list.size(); i++) {

                                String img_id = list.get(i).toString();
                                String fname = list.get(i + 1).toString();
                                String name = list.get(i + 2).toString();
                                String descr = list.get(i + 3).toString();
                                String other = list.get(i + 4).toString();
                                i += 4;
                                String tagx = "";
                                String linkx = "";
                                ArrayList tagget = dd.getTags(img_id);
                                for (int j = 0; j < tagget.size(); j++) {
                                    tagx += tagget.get(j).toString() + ", ";
                                }
                                ArrayList linkget = dd.getLinks(img_id);
                                for (int j = 0; j < linkget.size(); j++) {
                                    linkx += linkget.get(j).toString() + "<br />";
                                }

                %>

                <form action ="approve-exec.jsp" method="POST" name ="<%=img_id%>uform">
                    <div class="tablex"><div class="tablex_img">
                        <img src="imagepool/<%=fname%>" alt="<%=fname%>">
                        <div class="tippy" style="display: none;"> <table><tr><td><img src="imagepool/<%=fname%>" alt="<%=fname%>" class="image_preview" /></td><td><table><tr><td>
                        Filename: <%=name%></td></tr><tr><td>Links: <%=linkx%></td></tr><tr><td>Details: <%=descr%></td></tr><tr><td>Comments: <%=other%></td></tr><tr><td>Tags: <%=tagx%></td></tr></table></td></tr></table><a class="tiplink" href="edit-details.jsp?e=<%=img_id%>">Edit</a></div></div>

                        <div class="tagx"><%=tagx%><br /><div class="line"></div>
                            <%=linkx%></div>
                        <input type="hidden" value="<%=img_id%>" name="id">
                        <input type="hidden" value="<%=fname%>" name="img">
                        
                        <input type="submit" name="submit" value="Approve" class="bty">
                        <input type="submit" name="submit" value="Delete" class="btx">
                    </div></form>

                <%

                            }
                            
                            


                          %>


                </div>
            </div>

        </div>
        <div class="admin_cutter"><div class="que_watch"><img src="images/loading.gif" /></div></div>
        

        <div class="admin_box_recent">
            <%
            ArrayList listd = dd.getLatestImages();

                            System.out.println("List = " + listd.size());

                            for (int i = 0; i < listd.size(); i++) {

                                String img_id = listd.get(i).toString();
                                String fname = listd.get(i + 1).toString();
                                String name = listd.get(i + 2).toString();
                                String descr = listd.get(i + 3).toString();
                                String other = listd.get(i + 4).toString();
                                i += 4;
                                String tagx = "";
                                String linkx = "";
                                ArrayList tagget = dd.getTags(img_id);
                                for (int j = 0; j < tagget.size(); j++) {
                                    tagx += tagget.get(j).toString() + ", ";
                                }
                                ArrayList linkget = dd.getLinks(img_id);
                                for (int j = 0; j < linkget.size(); j++) {
                                    linkx += linkget.get(j).toString() + "<br />";
                                }


                                %>
                                <span class="admin_box_recent_img"> <img src="imagepool/<%=fname%>" alt="<%=fname%>">
                                 <div class="tippy" style="display: none;"> <table><tr><td><img src="imagepool/<%=fname%>" alt="<%=fname%>" class="image_preview" /></td><td><table><tr><td>
                        Filename: <%=name%></td></tr><tr><td>Links: <%=linkx%></td></tr><tr><td>Details: <%=descr%></td></tr><tr><td>Comments: <%=other%></td></tr><tr><td>Tags: <%=tagx%></td></tr></table></td></tr></table></div></span>
                                <%

                                }
            %>
            <b>Recent Uploads</b>
        </div>
            
        <div class="headline">
            <img src="images/logo.png" />
            <h1>Cyclops<span class="tag">The Reverse Image Search</span></h1>

        </div>

        <div class="admin_box">
            <table><tr><td>New image:</td><td><form id="upform" name="upload" method="post" action="upload-img.jsp"  enctype="multipart/form-data">
                            <div class="fileinputs">
                                <input id="picup" name="upload" type="file" onchange="this.form.submit();" class="file" size="3"/>
                                <div class="fakefile">
                                    Upload
                                </div>
                            </div></td></tr>                </form>

                <tr><td>Submit URL:</td><td><form id="xx" name="urlx" method="POST" action="url-submit.jsp"><input type="text" name="urll" class="xtextfield"></td><td><input type="submit" name="submit" value="Go" class="xbutton" /></form></td></tr></table>

            <br /><span class="line"></span><a href="start-server.jsp">Start Thread</a> <a href="get-image-collection.jsp">View Collection</a> <a href="admin-panel.jsp">Admin</a> <a href="logout.jsp">Logout</a>
        </div>

            <script>

                $('.admin_box_recent_img').each(function() {
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




            $('.admin_box_recent_img').remove('.tippy');
</script>

            <script>


            $('.tablex_img').each(function() {
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




            $('.tablex_img').remove('.tippy');
            
            $.get("que-peek.jsp", function(data) {
    $(".que_watch").html(data);

  });

$.timer(60000, function (timer) {
    
    $.get("que-peek.jsp", function(data) {
    $(".que_watch").html(data);
    
  });
});




    </script>



    </body>
</html>
