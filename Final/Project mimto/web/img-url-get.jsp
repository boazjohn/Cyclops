
<%@page import="java.io.*,java.util.*,db.db_process"%>

<%
            ArrayList getx = new db_process().getdetails(request.getParameter("q"));

            //out.print("ddd " + request.getParameter("q"));

            if (getx.get(0).toString() != null) {

                String img_id = getx.get(0).toString();
                String valid = getx.get(1).toString();
                String name = getx.get(2).toString();
                String descr = getx.get(3).toString();
                String other = getx.get(4).toString();
                out.print(img_id + "=" + valid + "=" + name + "=" + descr + "=" + other);

                ArrayList tagx = new ArrayList();

                ArrayList linksx = new ArrayList();


                /*  tagx = new db_process().getTags(img_id);
                for (int j = 0; j < tagx.size(); j++) {
                if (tagx.size() - 1 == j) {
                tags += tagx.get(j).toString();
                } else {
                tags += tagx.get(j).toString() + ",";
                }
                }

                linksx = new db_process().getLinks(img_id);
                for (int k = 0; k < linksx.size(); k++) {
                linkss += linksx.get(k).toString() + ",";
                } */
            }
%>

