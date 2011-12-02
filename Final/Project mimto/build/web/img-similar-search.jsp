
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

        <title>Project MIMTO - Main</title>

    <%@page import="java.io.*,java.util.*,imgsearch.ImageFinder,db.db_process"%>
    </head>
    <%
    String img_id=request.getParameter("id");
    db_process dd = new db_process();
    String pp = dd.getNameNow(img_id);
    String ppz = dd.getFnameNow(img_id);
    String ppx = config.getServletContext().getRealPath("/") + "\\searchimg\\" + pp;
    session.setAttribute("path", ppx);

                            try {
                                
                                
                                int xx = dd.getImgid() + 1;
                                File uimg = new File(config.getServletContext().getRealPath("/") + "\\imagepool\\" + ppz);

                                

                                File timg = new File(config.getServletContext().getRealPath("/") + "\\searchimg\\" + pp);
                                


                                InputStream in = new FileInputStream(uimg);
                                InputStream inn = new FileInputStream(uimg);

                                OutputStream outx = new FileOutputStream(timg);
                                

                                byte[] buf = new byte[in.available()];
                                int len;
                                while ((len = in.read(buf)) > 0) {
                                    outx.write(buf, 0, len);
                                }
                               
                                in.close();
                                outx.close();
                                
                                }
                            catch (Exception e) {
                                System.out.println("Exec = "+e);
                                }
    response.sendRedirect("img-search.jsp");
    %>

   
</html>
       