
<html>
    <head>
        <%@page import="java.util.*,java.io.*,db.db_process,url.udownload" %>
        <link rel="stylesheet" type="text/css" href="module.css" />

    </head>
    <body>
        <%
                    db_process imgr = new db_process();
                    
                    String name = request.getParameter("name");
                    String desc = request.getParameter("desc");
                    String link = request.getParameter("link");
                    String tag = request.getParameter("tags");
                    String other = request.getParameter("other");
                    String fname = request.getParameter("fname");
                    int img_id;
                    int valid = 1;
                    int wt = 1;
                    
                    out.print(name);
                    out.print(desc);
                    System.out.print(link);
                    System.out.print(tag);
                    out.print(other);
                    boolean cc = imgr.imgInsert(name, desc, other, valid, fname);
                    System.out.println("up bool=" + cc);
                    img_id = imgr.getImgid();
                    if (tag != null) {
                        StringTokenizer st = new StringTokenizer(tag, ",", false);
                        try {
                            while (st.hasMoreTokens()) {
                                String str = st.nextToken();
                                cc = imgr.tagInsert(str, wt, img_id);
                                System.out.println("up bool=" + cc);
                                out.println(str);
                            }
                        } catch (Exception e) {
                            System.out.println("Exception=" + e);
                        }
                    }

                    if (link != null) {
                        StringTokenizer st2 = new StringTokenizer(link, ",", false);
                        try {
                            while (st2.hasMoreTokens()) {
                                String str = st2.nextToken();
                                cc = imgr.linkInsert(str, img_id);
                                System.out.println("up bool=" + cc);
                                out.println(str);
                                udownload.que.add(str);
                            }
                        } catch (Exception e) {
                            System.out.println("Exception in Links=" + e);
                        }
                    }
                    //if(cc)
                    //{



                   // }
                   // else
                   // {
                   // response.sendRedirect("upload-error.jsp");
                   // }
                     

        %>

                   <script type="text/JavaScript">
<!--
setTimeout("location.href = 'admin-panel.jsp';",5000);
-->
</script>
        <div class="wrapper">
            <div class="search_box2">
        <img src="imagepool/<%=fname%>" alt="<%=fname%>" class="upload_thumb_top" />
</div>

    <div class="headline">
                <img src="images/logo.png" />
                <h1>Cyclops<span class="tag">The Reverse Image Search</span></h1>

            </div>
    


        </div>

    </body>
</html>

