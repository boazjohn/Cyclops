
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

    <%@page import="java.io.*,java.util.*,imgsearch.ImageFinder,url.udownload"%>
    </head>
    <%
    String url1=request.getParameter("uploadurl");
    out.println(url1);
    udownload dd = new udownload();
    String cc=dd.imageDownSearch(url1, config.getServletContext().getRealPath("/"));
    out.println(cc);
    session.setAttribute("path", cc);
    response.sendRedirect("img-search.jsp");
    %>

   
</html>
       