
<%@page import="java.io.*,db.db_process" %>

<%
String user=request.getParameter("usr");
String pass=request.getParameter("pass");
//out.println("Your username: "+user+" and your password: "+pass);
db_process logg=new db_process();
boolean cc=logg.validator(user, pass);
System.out.println(""+cc);
if(cc)
    {
    session.setAttribute("log", 1);
    response.sendRedirect("admin-panel.jsp");
    }
else
    {
    response.sendRedirect("login-error.jsp");
    } 
%>
    