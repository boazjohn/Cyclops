<%@page import="java.util.*,java.io.*,url.udownload" %>
<%
String urlx = request.getParameter("urll");
if(urlx!=null) {
    udownload.que.add(urlx);

}
response.sendRedirect("admin-panel.jsp");
%>