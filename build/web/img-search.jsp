

<%@page import="org.apache.catalina.Session"%>
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
        <script type="text/javascript" src="js/jquery.qtip-1.0.0.min.js"></script>
        
        <title>Cyclops - Search an image</title>

        <%@page import="java.io.*,java.util.*,java.net.*,imgsearch.ImageFinder,db.db_process"%>
    </head>
    <body>
        <div class="top_box">
            <div class="headline_span_search"

                 <a href="index.jsp"> <div class="headline_main">
                        <h1>Cyclops<span class="tag">The Reverse Image Search</span></h1>

                    </div></a><div class="circle"><img src="images/logo.png" /></div>

            </div>
            <table border="0"><tr><td><b>Begin a search,</b></td><td></td><td>Upload an image:</td><td><form id="upform" name="upload" method="post" action="img-search.jsp"  enctype="multipart/form-data">
                            <div class="fileinputs">
                                <input id="picup" name="upload" type="file" onchange="this.form.submit();" class="file" size="3"/>
                                <div class="fakefile">
                                    Upload
                                </div>
                            </div>
                        </form></td><td></td><td></td><td><b>OR</b></td><td></td><td>Enter URL:</td><td><td><form id="upformurl" name="upload2" method="POST" action="img-search-url.jsp">
                        <input type="text" name="uploadurl" class="search_textfield" /></td><td><input type="submit" name="uploadbtn2" value="Submit" class="search_button" /></form>
                    </td></tr>
            </table>
        </div>

        

        <div class="search_wrapper">
            <%


                        try {
                            if (session.getAttribute("path") != null) {
                                String imgpp = session.getAttribute("path").toString();
                                try {
                                    File imgurl =  new File(imgpp);
            %>

            <div class="search_img_box_top"> You've submitted:<br /><div class="img_upload_thumb_top"> <img src="searchimg/<%=imgurl.getName()%>" alt="<%=imgurl.getName()%>" /></div>

                <div class="search_user_box"><p><b>Not quiet it? Help Cyclops learn.</b></p><form name="user" id="user" method="POST" action="user-submit.jsp"><table><tr><td>Tag*:</td><td><input type="text" name="utag" class="textfield"></td></tr>
                            <tr><td>Links*:</td><td><input type="text" name="ulink" class="textfield"></td></tr><tr><td></td><td>* : separated by commas</tr><tr><td></td><td align="right"><input type="hidden" name="uloc" value="<%=imgurl.getName()%>" /><input type="submit" value="Submit" name="submit" class="button"></td></tr></table></form>
                </div>

            </div>


            <%
                                                String img_id = null;
                                                String name = "";
                                                String descr = "";
                                                String other = "";
                                                String valid = null;
                                                String tags = "";
                                                String tagbs = "";

                                                ArrayList tagbl = new ArrayList();

                                                ArrayList getx = new ArrayList();


            %>

            <div class="search_img_box_bottom">
                Similar images: <br />
                <%

                                                    ImageFinder img = new ImageFinder();
                                                    Vector vv = new Vector();


                                                    File imgdir = new File(config.getServletContext().getRealPath("/") + "\\imagepool\\");
                                                    System.out.println("Dir Data" + imgurl + "  <----->  " + imgdir);

                                                    vv = img.getCollection(imgurl.getAbsoluteFile(), imgdir.getAbsoluteFile());
                                                    if (vv.size() == 0) {
                %>
                <div class="tagtop">Oh snap! No Images Found. Bad Server. Try another search.</div>
                <%                                                                    } else {
                                                                                    for (int i = 0; i < vv.size(); i++) {
                                                                                        System.out.println(vv.elementAt(i));
                                                                                        String ufimg = vv.elementAt(i).toString();
                                                                                        File imgdisp = new File(ufimg);
                                                                                        String xx = imgdisp.getName();
                                                                                        // System.out.println("xxx  = = "+xx);
                                                                                        

                                                                                        getx = new db_process().getdetails(xx);

                                                                                        if (getx.get(0).toString() != null) {

                                                                                            img_id = getx.get(0).toString();
                                                                                            valid = getx.get(1).toString();
                                                                                            name = getx.get(2).toString();
                                                                                            descr = getx.get(3).toString();
                                                                                            other = getx.get(4).toString();
                                                                                            //    System.out.println(img_id+" == "+valid+" == "+name+" == "+url+" == "+descr+" == "+other);

                                                                                            ArrayList tagx = new ArrayList();
                                                                                            ArrayList tagb = new ArrayList();



                                                                                            tagx = new db_process().getTags(img_id);
                                                                                            for (int j = 0; j < tagx.size(); j++) {
                                                                                                if (tagx.size() - 1 == j) {
                                                                                                    tags += tagx.get(j).toString();
                                                                                                } else {
                                                                                                    tags += tagx.get(j).toString() + ",";
                                                                                                }
                                                                                            }



                                                                                            
                                                                                            tagb = new db_process().getTagsList(img_id);
                                                                                            //System.out.println("tag b = "+tagb);
                                                                                            for (int l = 0; l < tagb.size(); l++) {
                                                                                                tagbl.add(tagb.get(l).toString());
                                                                                            }







// out.println(img_id+" == "+valid+" == "+name+" == "+url+" == "+descr+" == "+other+" == "+tags+" == "+linkss);


                                                                                        }


                                                                                        if (valid.equals("1")) {


                %>

                <div class="search_img_upload_thumb_main"><img src="imagepool/<%=xx%>" alt="<%=xx%>" /><div class="tippy" style="display: none;"> <table><tr><td><img src="imagepool/<%=xx%>" alt="<%=xx%>" class="image_preview" /></td><td><table><tr><td>
                        Filename: <%=name%></td></tr><tr><td>Links: <% ArrayList linksx = new db_process().getLinks(img_id);
                                                                                                                    for (int k = 0; k < linksx.size(); k++) {
                                                                                                                        String linkss = linksx.get(k).toString();
                                                                                                                        out.print("<a href=\"" + linkss + "\" target=\"_blank\">" + linkss + "</a>  ");
                                                                                                                    } %> </td></tr><tr><td>Details: <%=descr%></td></tr><tr><td>Comments: <%=other%></td></tr><tr><td>Tags: <%=tags%></td></tr></table></td></tr></table><a class="tiplink" href="img-similar-search.jsp?id=<%=img_id%>">Search similar</a></div></div>

                <%   tags = "";

                                                                                        }
                                                                                    }

                %>
            <div class="search_img_box_top_tag">

                                        <%
                                        ArrayList tagcollection = new ArrayList();
                    ArrayList tagdisp = new ArrayList();
                    ArrayList tagweight = new ArrayList();




                                                                                        if (tagbl.size()!=0) {
                                                                                       //     System.out.println("Ta l = "+tagbl);
                                                                                            try {
                                                                                                String tg = null;


                                                                                                for(int pk=0;pk<tagbl.size();pk++) {
                                                                                                    if((pk%2)==0)
                                                                                                        {
                                                                                                     tg=tagbl.get(pk).toString();
                                                                                                        if(tagbl.get(pk+1).toString().equals("1"))
                                                                                                        {
                                                                                                    tagcollection.add(tg);
                                                                                                    }
                                                                                                    }
                                                                                                    }









                                                                                                System.out.println("Tag collection = "+tagcollection);
                                                                                                for(int tt=0;tt<tagcollection.size();tt++)
                                                                                                    {
                                                                                                    if(tt==0)
                                                                                                        {
                                                                                                        tagdisp.add(tagcollection.get(tt).toString());
                                                                                                        tagweight.add("18");
                                                                                                        }
                                                                                                    else {
                                                                                                        int ctx = 0;
                                                                                                        for(int kk=0;kk<tagdisp.size();kk++)
                                                                                                            {
                                                                                                           // System.out.println("kk="+kk+" tt="+tt+" size="+tagcollection.size()+" size 0f = "+tagdisp.size()+" wet ="+tagweight.size());
                                                                                                          //  System.out.println("disp "+tagdisp.get(kk)+" col "+tagcollection.get(tt));
                                                                                                            if(tagdisp.get(kk).toString().equals(tagcollection.get(tt).toString()))
                                                                                                                {
                                                                                                                ArrayList tempx = new ArrayList();
                                                                                                                String ppp = tagweight.get(kk).toString();
                                                                                                                int cc = Integer.parseInt(ppp)+4;
                                                                                                                //System.out.println(+kk+" < kk size of  "+tagdisp.size()+" size of wt "+tagweight.size());
                                                                                                                for(int uu=0;uu<kk;uu++)
                                                                                                                    {
                                                                                                                    tempx.add(tagweight.get(uu).toString());
                                                                                                                    }
                                                                                                                tempx.add(cc);
                                                                                                                for(int uu=kk+1;uu<tagweight.size();uu++)
                                                                                                                    {
                                                                                                                   tempx.add(tagweight.get(uu).toString());
                                                                                                                    }
                                                                                                                tagweight.clear();
                                                                                                                tagweight.addAll(tempx);

                                                                                                                ctx = 1;
                                                                                                                //System.out.println(+kk+" << kk size of  "+tagdisp.size()+" size of wt "+tagweight.size());

                                                                                                            }
                                                                                                            //break;
                                                                                                            }
                                                                                                        if(ctx!=1)
                                                                                                            {
                                                                                                          //  System.out.println("in ctx");
                                                                                                            tagdisp.add(tagcollection.get(tt).toString());
                                                                                                            tagweight.add("18");
                                                                                                            }
                                                                                                        }

                                                                                                    }
                                                                                               // System.out.println("tt = "+tagdisp+" = "+tagweight);
                                                                                                for(int pp = 0;pp<tagdisp.size()&&pp<tagweight.size();pp++)
                                                                                                    {
                                                                                                   System.out.println("Val = "+tagdisp.get(pp).toString()+" wt = "+tagweight.get(pp).toString());
                                                                                                    out.print(" <span style=\"font-size:"+tagweight.get(pp).toString()+"px\"><a href=\"get-img-tag.jsp?t="+tagdisp.get(pp).toString()+"\">"+tagdisp.get(pp).toString()+"</a></span> ");

                                                                                                    }
                                                                                            } catch (Exception e) {
                                                                                                System.out.println("Exception=" + e);
                                                                                            }
                                                                                        }

                    %>
                </div></div>


                <%

                                                    }
                                                    session.setAttribute("path", null);
                                                } catch (Exception e) {
                                                }


                %>

            

            <%
                                        } else {

                                            try {
                                                String ufname = null;
                                                String boundary = "";
                                                String sz = "";
                                                String fname = "";
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
                                                        //out.print(config.getServletContext().getRealPath("/")+"lrms/images/"+fname);
                                                        //out.print("p="+config.getServletContext().getRealPath("/")+fname);
                                                        //java.io.FileOutputStream fout=new java.io.FileOutputStream(config.getServletContext().getRealPath("/")+"lrms/images/"+fname);
                                                        java.io.FileOutputStream fout = new java.io.FileOutputStream(config.getServletContext().getRealPath("/") + "\\searchimg\\" + fname);
                                                        fout.write(b, 2, pos - 4);
                                                        // System.out.print("fname="+fname);
                                                        ufname = fname;
                                                        fout.close();
                                                        //            scale.scale(config.getServletContext().getRealPath("/")+"/uploadedimg/"+fname, 300, 300,config.getServletContext().getRealPath("/")+"/scaledimg/" +fname);
                                                        //response.sendRedirect("uploaded-image.jsp");
                                                    }

                                                }

                                                if(ufname==null) {
                                                    ufname = "default.jpg";
                                                    }
                                                if(!ufname.endsWith(".jpg")&&!ufname.endsWith(".png")&&!ufname.endsWith(".gif")&&!ufname.endsWith(".tif")&&!ufname.endsWith(".JPG")&&!ufname.endsWith(".JPEG")&&!ufname.endsWith(".jpeg")&&!ufname.endsWith(".PNG")&&!ufname.endsWith(".GIF")&&!ufname.endsWith(".TIF")) {
                                                    ufname = "default.jpg";
                                                    }




                                                //File ff=new File("/root/NetBeansProjects/Beans/web/imaget/Desktop/miniicon_d05.jpg");

            %>
            <div class="search_img_box_top"> You've submitted:<br /><div class="img_upload_thumb_top"> <img src="searchimg/<%=ufname%>" alt="<%=ufname%>" /></div>
                <div class="search_user_box"><p><b>Not quiet it? Help Cyclops learn.</b></p><form name="user" id="user" method="POST" action="user-submit.jsp"><table><tr><td>Tag*:</td><td><input type="text" name="utag" class="textfield"></td></tr>
                            <tr><td>Links*:</td><td><input type="text" name="ulink" class="textfield"></td></tr><tr><td></td><td>* : separated by commas</tr><tr><td></td><td align="right"><input type="hidden" name="uloc" value="<%=fname%>" /><input type="submit" value="Submit" name="submit" class="button"></td></tr></table></form>
                </div></div>
                <%




                                                                String img_id = null;
                                                                String name = "";
                                                                String descr = "";
                                                                String other = "";
                                                                String valid = null;
                                                                String tags = "";
                                                                ArrayList tagbl = new ArrayList();
                                                                



                                                                ArrayList getx = new ArrayList();


                %>

            <div class="search_img_box_bottom">
                Similar images: <br />
                <%

                                                                ImageFinder img = new ImageFinder();
                                                                Vector vv = new Vector();

                                                                File imgurl = new File(config.getServletContext().getRealPath("/") + "\\searchimg\\" + fname);
                                                                File imgdir = new File(config.getServletContext().getRealPath("/") + "\\imagepool\\");
                                                                System.out.println("Dir Data" + imgurl.getAbsolutePath() + "  <----->  " + imgdir.getAbsolutePath());

                                                                vv = img.getCollection(imgurl, imgdir);
                                                                if (vv.size() == 0) {
                %>
                <div class="tagtop">Oh snap! No Images Found. Bad Server. Try another search.</div>
                <%                                                                    } else {
                                                                                    for (int i = 0; i < vv.size(); i++) {
                                                                                        System.out.println(vv.elementAt(i));
                                                                                        String ufimg = vv.elementAt(i).toString();
                                                                                        File imgdisp = new File(ufimg);
                                                                                        String xx = imgdisp.getName();
//System.out.println("xxx  = = "+xx);

                                                                                        getx = new db_process().getdetails(xx);

                                                                                        if (getx.get(0).toString() != null) {

                                                                                            img_id = getx.get(0).toString();
                                                                                            valid = getx.get(1).toString();
                                                                                            name = getx.get(2).toString();
                                                                                            descr = getx.get(3).toString();
                                                                                            other = getx.get(4).toString();
                                                                                            //    System.out.println(img_id+" == "+valid+" == "+name+" == "+url+" == "+descr+" == "+other);

                                                                                            ArrayList tagx = new ArrayList();
                                                                                            ArrayList tagb = new ArrayList();
                                                                                            


                                                                                            tagx = new db_process().getTags(img_id);
                                                                                            for (int j = 0; j < tagx.size(); j++) {
                                                                                                if (tagx.size() - 1 == j) {
                                                                                                    tags += tagx.get(j).toString();
                                                                                                } else {
                                                                                                    tags += tagx.get(j).toString() + ",";
                                                                                                }
                                                                                            }



                                                                                            tagb = new db_process().getTagsList(img_id);
                                                                                            //System.out.println("tag b = "+tagb);
                                                                                            for (int l = 0; l < tagb.size(); l++) {
                                                                                                tagbl.add(tagb.get(l).toString());
                                                                                            }






// out.println(img_id+" == "+valid+" == "+name+" == "+url+" == "+descr+" == "+other+" == "+tags+" == "+linkss);


                                                                                        }


                                                                                        if (valid.equals("1")) {


                %>


                <div class="search_img_upload_thumb_main"><img src="imagepool/<%=xx%>" alt="<%=xx%>" /><div class="tippy" style="display: none;"> <table><tr><td><img src="imagepool/<%=xx%>" alt="<%=xx%>" class="image_preview" /></td><td><table><tr><td>
                        Filename: <%=name%></td></tr><tr><td>Links: <% ArrayList linksx = new db_process().getLinks(img_id);
                                                                                                                    for (int k = 0; k < linksx.size(); k++) {
                                                                                                                        String linkss = linksx.get(k).toString();
                                                                                                                        out.print("<a href=\"" + linkss + "\" target=\"_blank\">" + linkss + "</a>  ");
                                                                                                                    } %></td></tr><tr><td>Details: <%=descr%></td></tr><tr><td>Comments: <%=other%></td></tr><tr><td>Tags: <%=tags%></td></tr></table></td></tr></table><a class="tiplink" href="img-similar-search.jsp?id=<%=img_id%>">Search similar</a></div></div>

                <%   tags = "";

                                                                                        }
                                                                                    }

                %>
             <div class="search_img_box_top_tag">
                 
                    <%
                    ArrayList tagcollection = new ArrayList();
                    ArrayList tagdisp = new ArrayList();
                    ArrayList tagweight = new ArrayList();




                                                                                        if (tagbl.size()!=0) {
                                                                                       //     System.out.println("Ta l = "+tagbl);
                                                                                            try {
                                                                                                String tg = null;


                                                                                                for(int pk=0;pk<tagbl.size();pk++) {
                                                                                                    if((pk%2)==0)
                                                                                                        {
                                                                                                     tg=tagbl.get(pk).toString();
                                                                                                        if(tagbl.get(pk+1).toString().equals("1"))
                                                                                                        {
                                                                                                    tagcollection.add(tg);
                                                                                                    }
                                                                                                    }
                                                                                                    }




                                                                                                    


                                                                                                    

                                                                                                System.out.println("Tag collection = "+tagcollection);
                                                                                                for(int tt=0;tt<tagcollection.size();tt++)
                                                                                                    { 
                                                                                                    if(tt==0)
                                                                                                        {
                                                                                                        tagdisp.add(tagcollection.get(tt).toString());
                                                                                                        tagweight.add("18");
                                                                                                        }
                                                                                                    else {
                                                                                                        int ctx = 0;
                                                                                                        for(int kk=0;kk<tagdisp.size();kk++)
                                                                                                            {
                                                                                                           // System.out.println("kk="+kk+" tt="+tt+" size="+tagcollection.size()+" size 0f = "+tagdisp.size()+" wet ="+tagweight.size());
                                                                                                          //  System.out.println("disp "+tagdisp.get(kk)+" col "+tagcollection.get(tt));
                                                                                                            if(tagdisp.get(kk).toString().equals(tagcollection.get(tt).toString()))
                                                                                                                {
                                                                                                                ArrayList tempx = new ArrayList();
                                                                                                                String ppp = tagweight.get(kk).toString();
                                                                                                                int cc = Integer.parseInt(ppp)+4;
                                                                                                                //System.out.println(+kk+" < kk size of  "+tagdisp.size()+" size of wt "+tagweight.size());
                                                                                                                for(int uu=0;uu<kk;uu++)
                                                                                                                    {
                                                                                                                    tempx.add(tagweight.get(uu).toString());
                                                                                                                    }
                                                                                                                tempx.add(cc);
                                                                                                                for(int uu=kk+1;uu<tagweight.size();uu++)
                                                                                                                    {
                                                                                                                   tempx.add(tagweight.get(uu).toString());
                                                                                                                    }
                                                                                                                tagweight.clear();
                                                                                                                tagweight.addAll(tempx);
                                                                                                                            
                                                                                                                ctx = 1;
                                                                                                                //System.out.println(+kk+" << kk size of  "+tagdisp.size()+" size of wt "+tagweight.size());
                                                                                                                
                                                                                                            }
                                                                                                            //break;
                                                                                                            }
                                                                                                        if(ctx!=1)
                                                                                                            {
                                                                                                          //  System.out.println("in ctx");
                                                                                                            tagdisp.add(tagcollection.get(tt).toString());
                                                                                                            tagweight.add("18");
                                                                                                            }
                                                                                                        }

                                                                                                    }
                                                                                               // System.out.println("tt = "+tagdisp+" = "+tagweight);
                                                                                                for(int pp = 0;pp<tagdisp.size()&&pp<tagweight.size();pp++)
                                                                                                    {
                                                                                                   System.out.println("Val = "+tagdisp.get(pp).toString()+" wt = "+tagweight.get(pp).toString());
                                                                                                    out.print(" <span style=\"font-size:"+tagweight.get(pp).toString()+"px\"><a href=\"get-img-tag.jsp?t="+tagdisp.get(pp).toString()+"\">"+tagdisp.get(pp).toString()+"</a></span> ");

                                                                                                    }
                                                                                            } catch (Exception e) {
                                                                                                System.out.println("Exception=" + e);
                                                                                            }
                                                                                        }
                                                                                        
                    %>
                  </div> </div>


                <%

                                        }








                                    } catch (Exception e) {
                                        System.out.println("Exception=" + e);
                                    }
                                }

                            } catch (Exception e) {
                                System.out.println("Exception=" + e);
                            }


                %>
            </div>
        



    </body>


    <script>        

        $('.search_img_upload_thumb_main').each(function() {
            $(this).qtip({
                content: {
                    title: {
            text: 'Image Preview',
            button: 'Close'
         },

                text: $(this).children('.tippy')

                },


                
                    position: {
                        target: $(document.body), // Position it via the document body...
                        corner: 'center' // ...at the center of the viewport
                    },
                    show: {
                        when: 'click', // Show it on click
                        solo: true // And hide all other tooltips
                    },
                    hide: false,
                    style: {
                        width: 'auto',
                        padding: '14px',
                        border: {
                            width: 9,
                            radius: 9,
                            color: '#666666'
                        },
                        name: 'light'
                    },
                    api: {
         beforeShow: function()
         {
            // Fade in the modal "blanket" using the defined show speed
            $('#qtip-blanket').fadeIn(this.options.show.effect.length);
         },
         beforeHide: function()
         {
            // Fade out the modal "blanket" using the defined hide speed
            $('#qtip-blanket').fadeOut(this.options.hide.effect.length);
         }
      }
   });

   // Create the modal backdrop on document load so all modal tooltips can use it
   $('<div id="qtip-blanket">')
      .css({
         position: 'absolute',
         top: $(document).scrollTop(), // Use document scrollTop so it's on-screen even if the window is scrolled
         left: 0,
         height: $(document).height(), // Span the full document height...
         width: '100%', // ...and full width
         
         opacity: 0.7, // Make it slightly transparent
         backgroundColor: '',
         zIndex: 5000  // Make sure the zIndex is below 6000 to keep it below tooltips!
      })
      .appendTo(document.body) // Append to the document body
      .hide(); // Hide it initially







                });

                

            
            $('.search_img_upload_thumb_main').remove('.tippy');
        
    </script>




</html>
