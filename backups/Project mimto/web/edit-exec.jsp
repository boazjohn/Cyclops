<%@page import="java.util.*,java.io.*,db.db_process" %>
<%

            String name = request.getParameter("name");
            String desc = request.getParameter("desc");
            String link = request.getParameter("link");
            String tag = request.getParameter("tags");
            String other = request.getParameter("other");
            String img_id = request.getParameter("img_idd");


            db_process ddd = new db_process();
            ddd.updateImageData(img_id, name, desc, other, tag, link);
            response.sendRedirect("admin-panel.jsp");



%>