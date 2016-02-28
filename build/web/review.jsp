
<%@page import="java.io.*,db.db_process" %>

<%
String img_id=request.getParameter("q");
db_process dd =new db_process();
boolean cc=dd.updateValid(0, img_id);

if(cc)
    {
    response.sendRedirect("get-image-collection.jsp");
    }
%>
    