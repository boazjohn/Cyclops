<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" type="text/css" href="module.css" />


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrator Cpanel - Edit Details</title>
    </head>

    <%@page import="java.io.*,java.util.*,db.db_process"%>

    <body>
        <div class="wrapper">
            <%          
                     try {
                        String img_id = request.getParameter("e");

                        String fname = "";
                        String name = "";
                        String descr = "";
                        String other = "";


                        db_process dd = new db_process();
                        ArrayList dup = dd.getImageDetails(img_id);


                        fname = dup.get(0).toString();
                        name = dup.get(1).toString();
                        descr = dup.get(2).toString();
                        other = dup.get(3).toString();


                        String tagx = "";
                        String linkx = "";
                        ArrayList tagget = dd.getTags(img_id);
                        for (int j = 0; j < tagget.size(); j++) {
                            tagx += tagget.get(j).toString() + ", ";
                        }
                        ArrayList linkget = dd.getLinks(img_id);
                        for (int j = 0; j < linkget.size(); j++) {
                            linkx += linkget.get(j).toString() + ", ";
                        }



            %>
            <div class="edit_container"> <table><tr><td><table>
                                <form name="upload" action="edit-exec.jsp" method="POST">
                                    <input type="hidden" name="img_idd" value="<%=img_id%>" />
                                 
                                    <tr><td align="right">Filename</td><td><input type="text" value="<%=name%>" name="name" class="upload_textfield"></td></tr>
                                    <tr><td align="right">Links*</td><td><input type="text" value="<%=linkx%>" name="link" class="upload_textfield"></td></tr>
                                    <tr><td align="right">Tags*</td><td><input type="text" value="<%=tagx%>" name="tags" class="upload_textfield"></td></tr>
                                    <tr><td align="right">Description</td><td><textarea name="desc" class="upload_textarea"><%=descr%></textarea></td><tr>
                                    <tr><td align="right">Extra Info</td><td><input type="text" name="other" value="<%=other%>" class="upload_textfield"></td></tr>
                                    <tr><td></td><td> * : seperated by comma</td></tr>


                                    <tr><td></td><td align="right"><input type="submit" name="submit" value="Update" class="button" /></td></tr>
                                </form></table></td><td><img src="imagepool/<%=fname%>" alt="<%=fname%>" class="search_img_upload_thumb" /></td></tr></table>
            </div>
                               

        </div>

                                <%
                               
                                }
                                catch(Exception e) {
                                    System.out.println("Except = "+e);
                                    }
          %>
          
        <div class="headline">
            <img src="images/logo.png" />
            <h1>Cyclops<span class="tag">The Reverse Image Search</span></h1>
            <a href="admin-panel.jsp" class="linkback">Back to Cpanel Home</a>
        </div>


    </body>
</html>
