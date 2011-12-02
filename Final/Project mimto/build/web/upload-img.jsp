
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>Uploading...</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link rel="stylesheet" type="text/css" href="module.css" />
    </head>
    <%@page import="java.io.*,java.util.*,imgsearch.ImageFinder,db.db_process"%>


    <%

                try {
                    String ufname = null;
                    String boundary = "";
                    String sz = "";
                    String fname = "";
                    String ffname = "";
                    String img_id = null;
                    String name = "";
                    String urlx = "";
                    String descr = "";
                    String other = "";
                    String valid = null;
                    String tags="";
                    String linkss="";
                    int uno = new db.db_process().getImgid() + 1;
                    Enumeration enum1 = request.getHeaderNames();
                    while (enum1.hasMoreElements()) {
                        String header = (String) enum1.nextElement();
                        String hvalue = request.getHeader(header);
                        // out.println(header+":"+hvalue+"<br>");

                        if ("content-length".equalsIgnoreCase(header)) {
                            sz = "" + hvalue;
                        }
                        if ("content-type".equalsIgnoreCase(header)) {
                            int idx = hvalue.lastIndexOf("boundary=");
                            if (idx != -1) {
                                boundary = hvalue.substring(idx + 9, hvalue.length());
                                //out.println("<br>Boundary: "+ boundary+"<br>");
                            }
                        }

                    }

                    ServletInputStream sv = request.getInputStream();
                    int ch = 0;
                    String val = "";



                    while ((ch = sv.read()) != -1) {
                        val += (char) ch;

                        if (val.indexOf("Content-Type: ") >= 0) { //out.print(val);
                            String tp = "Content-Type: ";
                            fname = val.substring(val.indexOf("filename=") + "filename=".length(), val.indexOf(tp));
                            fname = fname.replace('"', ' ');
                            fname = fname.trim();
                            // fname="default.jpeg";
                            int j = fname.lastIndexOf("/") + 1;
                            fname = fname.substring(j);
                            //out.print("fname"+fname);

                            while ((ch = sv.read()) != '\n');

                            // System.out.println("size"+sz);
                            byte[] b = new byte[Integer.parseInt(sz)];
                            int cntr = 0;
                            while (cntr < b.length) {
                                b[cntr] = (byte) sv.read();
                                cntr++;
                            }
                            String str = new String(b);
                            int pos = str.indexOf(boundary) - 2;
                            pos = b.length;

                            /**********************************/
                            //String user=""+session.getAttribute("username");
                            //String type=""+session.getAttribute("type");
                            //String sysid=""+session.getAttribute("sysid");
                            // File f=new File(config.getServletContext().getRealPath("/")+"lrms/images/");
                            File f = new File(config.getServletContext().getRealPath("/"));
                            if (!f.exists()) {
                                f.mkdirs();
                            }
                            if (fname.toLowerCase().endsWith(".jpg")) {
                                ffname = uno + ".jpg";
                            } else if (fname.toLowerCase().endsWith(".jpeg")) {
                                ffname = uno + ".jpeg";
                            } else if (fname.toLowerCase().endsWith(".gif")) {
                                ffname = uno + ".gif";
                            } else if (fname.toLowerCase().endsWith(".png")) {
                                ffname = uno + ".png";
                            } else if (fname.toLowerCase().endsWith(".tif")) {
                                ffname = uno + ".tif";
                            }
                            //out.print(config.getServletContext().getRealPath("/")+"lrms/images/"+fname);
                            //out.print("p="+config.getServletContext().getRealPath("/")+fname);
                            //java.io.FileOutputStream fout=new java.io.FileOutputStream(config.getServletContext().getRealPath("/")+"lrms/images/"+fname);
                            java.io.FileOutputStream fout = new java.io.FileOutputStream(config.getServletContext().getRealPath("/") + "\\imagepool\\" + ffname);
                            fout.write(b, 2, pos - 4);
                            java.io.FileOutputStream foutn = new java.io.FileOutputStream(config.getServletContext().getRealPath("/").replace("\\build\\", "\\") + "\\imagepool\\" + ffname);
                            foutn.write(b, 2, pos - 4);

                            //out.print("fname"+fname);
                            ufname = fname;
                            fout.close();
                            foutn.close();
                            //            scale.scale(config.getServletContext().getRealPath("/")+"/uploadedimg/"+fname, 300, 300,config.getServletContext().getRealPath("/")+"/scaledimg/" +fname);
                            //response.sendRedirect("uploaded-image.jsp");
                        }

                    }







    %>
    <div class="wrapper">
        <div class="search_box2">

            <img src="imagepool/<%=ffname%>" alt="<%=ffname%>" class="upload_thumb_top" />

            <%
                                try {
                                    ImageFinder img = new ImageFinder();
                                    Vector vv = new Vector();

                                    File imgurl = new File(config.getServletContext().getRealPath("/") + "\\imagepool\\" + ffname);
                                    File imgdir = new File(config.getServletContext().getRealPath("/") + "\\imagepool\\");
                                    System.out.println("Dir Data" + imgurl.getAbsolutePath() + "  <----->  " + imgdir.getAbsolutePath());

                                    vv = img.getImageMatch(imgurl, imgdir);

                                    if (vv.size() == 0) {
            %>
            <br /><b>Oops! No Images Found. Try another search.</b>
            <%                                                                    } else {
                                        for (int i = 0; i < vv.size(); i++) {
                                            System.out.println(vv.elementAt(i));
                                            String ufimg = vv.elementAt(i).toString();
                                            File imgdisp = new File(ufimg);
                                            String xx = imgdisp.getName();
                                            if (imgurl.getName().equals(imgdisp.getName())) {
                                            } else {



                                                out.print("<img src=\"imagepool/" + xx + "\" alt=\"" + xx + "\" class=\"search_img_upload_thumb\"/>");
                                                ArrayList get = new ArrayList();
                                                ArrayList tag = new ArrayList();
                                                ArrayList links = new ArrayList();
                                                        get = new db_process().getdetails(imgdisp.getName());

                                                img_id = get.get(0).toString();
                                                valid = get.get(1).toString();
                                                name = get.get(2).toString();
                                                descr = get.get(3).toString();
                                                other = get.get(4).toString();
                                                // System.out.println(img_id+" == "+valid+" == "+name+" == "+urlx+" == "+descr+" == "+other);

                                                tag=new db_process().getTags(img_id);
                                                for(i=0;i<tag.size();i++)
                                                    {
                                                    tags+=tag.get(i)+",";
                                                    }

                                                links=new db_process().getLinks(img_id);
                                                for(i=0;i<links.size();i++)
                                                    {
                                                   linkss+=links.get(i)+",";
                                                    }


                                            }
                                        }
                                    }
                                } catch (Exception e) {
                                    System.out.println("Exception = " + e);
                                }



            %>



            <table class="img_upload_details">
                <form name="upload" action="uploaded-image.jsp" method="POST">
                    <tr><td align="right">File Name</td><td><input type="text" name="name" value="<%=fname%>" class="upload_textfield" READONLY /></td></tr>
                    <tr><td align="right">Links*</td><td><input type="text" value="<%=linkss%>"name="link" class="upload_textfield"></td></tr>
                    <tr><td align="right">Tags*</td><td><input type="text" value="<%=tags%>"name="tags" class="upload_textfield"></td></tr>

                    <tr><td align="right">Description</td><td><textarea name="desc" class="upload_textarea"><%=descr%></textarea></td><tr>
                    <tr><td align="right">Extra Info</td><td><input type="text" name="other" value="<%=other%>" class="upload_textfield"></td></tr>
                    <tr><td></td><td> * : seperated by comma</td></tr>
                    <input type="hidden" name ="fname" value ="<%=ffname%>" />

                    <tr><td></td><td align="right"><input type="submit" name="submit" value="Update"class="button" /></td></tr>
                </form></table>
        </div>

        <div class="headline">
            <img src="images/logo.png" />
            <h1>Cyclops<span class="tag">The Reverse Image Search</span></h1>

        </div>



    </div>
    <%

                } catch (Exception e) {
                    System.out.println("Exception = " + e);
                    out.print("Error");

                }
    %>

</html>
