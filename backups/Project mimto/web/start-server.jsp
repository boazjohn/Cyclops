<%-- 
    Document   : startServer
    Created on : Dec 14, 2010, 3:30:26 PM
    Author     : Jasir
--%>

<%@page import="org.apache.jasper.tagplugins.jstl.core.Redirect"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="url.udownload"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>\
        <%

                    udownload.path = config.getServletContext().getRealPath("/");
                    udownload u = new udownload();
                    if (!u.isAlive()) {
                        u.start();
                        if (u.isAlive()) {
                            System.out.println("Thread Started");
                            response.sendRedirect("admin-panel.jsp");
                        }
                    }
        %>
    </body>
</html>
