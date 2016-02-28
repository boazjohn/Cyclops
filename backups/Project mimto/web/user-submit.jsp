

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
        <script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
        <script type="text/javascript" src="js/jquery.qtip-1.0.0.min.js"></script>
        <script type="text/javascript" src="js/ajax.js"></script>
        <title>Cyclops - Search an image</title>

        <%@page import="java.io.*,java.util.*,java.net.*,imgsearch.ImageFinder,db.db_process"%>
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

                        String submit = request.getParameter("submit");
                        String tags = request.getParameter("utag");
                        String link = request.getParameter("ulink");
                        String uloc = request.getParameter("uloc");
                        //out.print(tags+" = "+link+" = "+uloc+" = "+submit);

                        if (submit.equals("Submit")) {

            %><div class="search_wrapper">
                <div class="user_submit">
                <span class="highline">Thanks for making Cyclops learn. Continue submitting the image. Our boys are waiting :)</span>
                <div class="line"></div>
                    <table><tr><td> <div  class="img_upload_thumb_top"><img src ="searchimg/<%=uloc%>" alt="<%=uloc%>"></div></td><td>
                    <form name="user" action="user-submit.jsp" method="POST">
                        <input type="hidden" name="uloc" value="<%=uloc%>" />
                        <input type="hidden" name="utag" value="<%=tags%>" />
                        <input type="hidden" name="ulink" value="<%=link%>" />
                        <table><tr><td>Tags:<%=tags%></td></tr>
                            <tr><td>Links:<%=link%></td></tr>
                           <tr><td> Give us a short description:</td></tr>
                           <tr><td> <textarea name="txtd" class="upload_textarea"></textarea></td></tr>
                            <tr><td align="right"><input type="submit" value="Done" name="submit" class="button"></td></tr></table></td></tr></table></form>

                </div></div>

            <% } else if (submit.equals("Done")) {
                            %>

                            <br />Thank you for submitting the image.<br />
                            <%
                            String dess = request.getParameter("txtd");
                            try {
                                String fuloc = null;
                                db_process dd = new db_process();
                                int xx = dd.getImgid() + 1;
                                File uimg = new File(config.getServletContext().getRealPath("/") + "\\searchimg\\" + uloc);

                                if (uloc.toLowerCase().endsWith(".jpg")) {
                                    fuloc = xx + ".jpg";
                                } else if (uloc.toLowerCase().endsWith(".jpeg")) {
                                    fuloc = xx + ".jpeg";
                                } else if (uloc.toLowerCase().endsWith(".gif")) {
                                    fuloc = xx + ".gif";
                                } else if (uloc.toLowerCase().endsWith(".png")) {
                                    fuloc = xx + ".png";
                                } else if (uloc.toLowerCase().endsWith(".tif")) {
                                    fuloc = xx + ".tif";
                                }

                                File timg = new File(config.getServletContext().getRealPath("/") + "\\imagepool\\" + fuloc);
                                File timgx = new File(config.getServletContext().getRealPath("/").replace("\\build\\", "\\") + "\\imagepool\\" + fuloc);


                                InputStream in = new FileInputStream(uimg);
                                InputStream inn = new FileInputStream(uimg);

                                OutputStream outx = new FileOutputStream(timg);
                                OutputStream outy = new FileOutputStream(timgx);

                                byte[] buf = new byte[in.available()];
                                int len;
                                while ((len = in.read(buf)) > 0) {
                                    outx.write(buf, 0, len);
                                }
                                byte[] buff = new byte[inn.available()];
                                int lenn;
                                while ((lenn = inn.read(buff)) > 0) {
                                    outy.write(buff, 0, lenn);
                                }
                                in.close();
                                outx.close();
                                outy.close();
                                System.out.println("File copied.");

                                dd.imgInsert(uloc, dess, "User Submitted", 0, fuloc);
                                if (tags != null) {
                                    StringTokenizer st = new StringTokenizer(tags, ",", false);
                                    try {
                                        while (st.hasMoreTokens()) {
                                            String str = st.nextToken();
                                            dd.tagInsert(str, 14, xx);


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
                                            dd.linkInsert(str, xx);

                                        }
                                    } catch (Exception e) {
                                        System.out.println("Exception in Links=" + e);
                                    }
                                }
                            } catch (Exception e) {
                                System.out.println("Exception=" + e);
                            }


                            response.sendRedirect("index.jsp");
                        }

            %>

        </div>



</html>
