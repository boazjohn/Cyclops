

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
        <title>Cyclops - Search an image</title>

        <%@page import="java.io.*,java.util.*,java.net.*,imgsearch.ImageFinder,db.db_process"%>
    </head>
    
            <%

                        String submit = request.getParameter("submit");
                        String img_id = request.getParameter("id");
                        
                        db_process dd = new db_process();
                        if(submit.equals("Approve"))
                            {
                            boolean cc = dd.updateValid(1, img_id);
                            if(cc)
                                System.out.println(" CC = "+cc);
                                response.sendRedirect("admin-panel.jsp");
                            }
                        else if(submit.equals("Delete"))
                            {
                            String fname = request.getParameter("img");
                            File ff = new File(config.getServletContext().getRealPath("/")+"\\imagepool\\"+fname);
                            File ffx = new File(config.getServletContext().getRealPath("/").replace("\\build\\", "\\") + "\\imagepool\\" + fname);
                            ff.delete();
                            ffx.delete();
                            boolean cc = dd.deleteValid(img_id);
                            if(cc)
                                System.out.println(" CC = "+cc);
                                response.sendRedirect("admin-panel.jsp");
                            }
                        

                        

           %>


</html>
