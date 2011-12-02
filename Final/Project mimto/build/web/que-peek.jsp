<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.*,java.io.*,url.udownload" %>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="module.css" />
    </head>
    <body>
<%
String str = "";
if(udownload.que.isEmpty()) {
    str+="<h3 class=\"que_watch_h3\">Download Queue</h3><ul>";
    str+="<li>Download list empty!</li>";
    str+="</ul>";
    }
else {
    str+="<h3 class=\"que_watch_h3\">Download Queue</h3><ul>";
    str+="<li>"+udownload.que.peek() +"</li>";
    str+="</ul>";
    
    
}

out.print(str);

%>
    </body>
</html>