package db;

import java.util.*;
import java.sql.*;
import java.util.ArrayList;

/**
 *
 * @author Boaz
 */
public class db_process extends db_class {

    db_class db1 = new db_class();
    ResultSet rss = null;
    ResultSet rss1 = null;
    int cc;

    public db_process() {

        super();
    }

    public boolean validator(String usrn, String pass) {
        boolean b = false;
        try {
            String xo = "SELECT * FROM admin WHERE usrname='" + usrn + "' AND passwd='" + pass + "'";
            rss = db1.selectq(xo);
            if (rss.next()) {
                b = true;
            }

        } catch (Exception e) {
            System.out.println("Exception" + e);
        }
        return b;
    }

    public boolean exec(String qry) {
        boolean b = false;
        try {
            cc = db1.execq(qry);
            System.out.print("cc=" + cc);
            if (cc > 0) {
                b = true;
            }
        } catch (Exception e) {
            System.out.print("Exception" + e);
        }
        return b;
    }

    public boolean imgInsert(String name, String desc, String other, int valid, String fname) {
        boolean b = false;
        String qry = "INSERT INTO up_images(name,descr,other,valid,fname) VALUES('" + name + "','" + desc + "','" + other + "','" + valid + "','" + fname + "')";
        cc = db1.execq(qry);
        if (cc > 0) {
            b = true;
        }
        return b;
    }

    public int getImgid() {
        int img_id = 0;
        try {
            String qry1 = "SELECT * FROM up_images ORDER BY img_id DESC LIMIT 1";
            res = db1.selectq(qry1);
            while (res.next()) {
                img_id = res.getInt("img_id");
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return img_id;
    }

    public boolean tagInsert(String tag, int wt, int img_id) {
        boolean b = false;
        String qry = "INSERT INTO im_tag(tag,tag_weight,img_id) VALUES('" + tag + "','" + wt + "','" + img_id + "')";
        cc = db1.execq(qry);
        if (cc > 0) {
            b = true;
        }
        return b;
    }

    public boolean linkInsert(String link, int img_id) {
        boolean b = false;
        String qry = "INSERT INTO im_link(link,img_id) VALUES('" + link + "','" + img_id + "')";
        cc = db1.execq(qry);
        if (cc > 0) {
            b = true;
        }
        return b;
    }

    public ArrayList getdetails(String fname) {
        String img_id = null;
        String name = null;
        String descr = null;
        String other = null;
        String valid = null;
        ArrayList ccd = new ArrayList();
        try {
            String qry1 = "SELECT * FROM up_images WHERE fname=\"" + fname + "\"";
            res = db1.selectq(qry1);
            while (res.next()) {
                img_id = res.getString("img_id");
                valid = res.getString("valid");
                name = res.getString("name");
                descr = res.getString("descr");
                other = res.getString("other");
            }


            ccd.add(img_id);
            ccd.add(valid);
            ccd.add(name);
            ccd.add(descr);
            ccd.add(other);



        } catch (Exception e) {
            System.out.println(e);
        }
        return ccd;

    }

    public boolean updateValid(int valid, String img_id) {
        boolean b = false;
        String qry = "UPDATE up_images SET valid = '" + valid + "' WHERE img_id = '" + img_id + "'";
        cc = db1.execq(qry);
        if (cc > 0) {
            b = true;
        }
        return b;

    }

    public boolean deleteValid(String img_id) {
        boolean b = false;
        String qry = "DELETE FROM up_images WHERE img_id = '" + img_id + "'";
        String qry2 = "DELETE FROM im_tag WHERE img_id = '" + img_id + "'";
        String qry3 = "DELETE FROM im_link WHERE img_id = '" + img_id + "'";
        cc = db1.execq(qry);
        cc = db1.execq(qry2);
        cc = db1.execq(qry3);
        if (cc > 0) {
            b = true;
        }
        return b;

    }

    public ArrayList getNotValid() {
        String img_id = null;
        String name = null;
        String descr = null;
        String other = null;
        String fname = null;

        ArrayList ccf = new ArrayList();
        try {
            /*   String qry0 = "SELECT COUNT(*) as \"size\" FROM up_images WHERE valid = '0'";
            ResultSet ress = db1.selectq(qry0);
            int count = 0;
            while (ress.next()) {
            count = ress.getInt("size");
            System.out.println("count = "+count);
            }
            for(int k = 0;k<count;k++) { */
            String qry1 = "SELECT * FROM up_images WHERE valid='0'";
            res = db1.selectq(qry1);

            while (res.next()) {

                img_id = res.getString("img_id");
                name = res.getString("name");
                fname = res.getString("fname");
                descr = res.getString("descr");
                other = res.getString("other");
                //System.out.println(img_id + " = " + fname + " = " + name + " = " + descr + " = " + other);



                ccf.add(img_id);
                ccf.add(fname);
                ccf.add(name);
                ccf.add(descr);
                ccf.add(other);
            }



        } catch (Exception e) {
            System.out.println(e);
        }
        return ccf;

    }

    public ArrayList getLatestImages() {
        String img_id = null;
        String name = null;
        String descr = null;
        String other = null;
        String fname = null;

        ArrayList ccs = new ArrayList();
        try {
            /*   String qry0 = "SELECT COUNT(*) as \"size\" FROM up_images WHERE valid = '0'";
            ResultSet ress = db1.selectq(qry0);
            int count = 0;
            while (ress.next()) {
            count = ress.getInt("size");
            System.out.println("count = "+count);
            }
            for(int k = 0;k<count;k++) { */
            String qry1 = "SELECT * FROM up_images ORDER BY img_id DESC";
            res = db1.selectq(qry1);
            for (int xp = 0; xp < 6; xp++) {
                res.next();
                img_id = res.getString("img_id");
                name = res.getString("name");
                fname = res.getString("fname");
                descr = res.getString("descr");
                other = res.getString("other");
                // System.out.println(img_id + " = " + fname + " = " + name + " = " + descr + " = " + other);



                ccs.add(img_id);
                ccs.add(fname);
                ccs.add(name);
                ccs.add(descr);
                ccs.add(other);

            }



        } catch (Exception e) {
            System.out.println(e);
        }
        return ccs;

    }

    public ArrayList getCollectionFirst() {
        String img_id = null;
        String name = null;
        String descr = null;
        String other = null;
        String fname = null;
        int valid = 0;

        ArrayList ccs = new ArrayList();
        try {
            /*   String qry0 = "SELECT COUNT(*) as \"size\" FROM up_images WHERE valid = '0'";
            ResultSet ress = db1.selectq(qry0);
            int count = 0;
            while (ress.next()) {
            count = ress.getInt("size");
            System.out.println("count = "+count);
            }
            for(int k = 0;k<count;k++) { */
            String qry1 = "SELECT * FROM up_images ORDER BY img_id ASC";
            res = db1.selectq(qry1);
            int xr = 0;
            while (res.next()) {
                img_id = res.getString("img_id");
                valid = res.getInt("valid");
                name = res.getString("name");
                fname = res.getString("fname");
                descr = res.getString("descr");
                other = res.getString("other");

                //   System.out.println(img_id + " = " + fname + " = " + name + " = " + descr + " = " + other);


                if (valid == 1) {
                    ccs.add(img_id);
                    ccs.add(fname);
                    ccs.add(name);
                    ccs.add(descr);
                    ccs.add(other);
                }
                if (xr == 9) {
                    // break;
                } else {
                    xr++;
                }

            }



        } catch (Exception e) {
            System.out.println(e);
        }
        return ccs;

    }

    public ArrayList getTags(String img_id) {
        ArrayList ccg = new ArrayList();
        try {
            String qry1 = "SELECT * FROM im_tag WHERE img_id='" + img_id + "'";
            res = db1.selectq(qry1);
            while (res.next()) {
                ccg.add(res.getString("tag"));

            }


        } catch (Exception e) {
            System.out.println(e);
        }
        return ccg;

    }

    public ArrayList getTagsList(String img_id) {
        ArrayList cch = new ArrayList();
        try {
            String qry1 = "SELECT * FROM im_tag WHERE img_id='" + img_id + "'";
            res = db1.selectq(qry1);
            while (res.next()) {
                cch.add(res.getString("tag"));
                cch.add(res.getInt("tag_weight"));

            }


        } catch (Exception e) {
            System.out.println(e);
        }
        return cch;

    }

    public ArrayList getLinks(String img_id) {
        ArrayList ccj = new ArrayList();
        try {
            String qry1 = "SELECT * FROM im_link WHERE img_id='" + img_id + "'";
            res = db1.selectq(qry1);
            while (res.next()) {
                ccj.add(res.getString("link"));

            }


        } catch (Exception e) {
            System.out.println(e);
        }
        return ccj;

    }

    public ArrayList gettingTag(String imgd) {
        String fname = null;
        String name = null;
        String descr = null;
        String other = null;
        String valid = null;
        ArrayList ccd = new ArrayList();

        try {


            String qry2 = "SELECT * FROM up_images WHERE img_id='" + imgd + "'";
            ResultSet resp = db1.selectq(qry2);
            while (resp.next()) {
                fname = resp.getString("fname");
                valid = resp.getString("valid");
                name = resp.getString("name");
                descr = resp.getString("descr");
                other = resp.getString("other");
            }
            int ttx = 0;
            for (int i = 0; i < ccd.size(); i++) {
                System.out.println(" img " + ccd.get(i).toString());
                if (ccd.get(i).toString().equals(imgd)) {
                    ttx = 1;
                    break;
                }
                i += 5;

            }
            if (ttx == 0) {
                ccd.add(imgd);
                ccd.add(valid);
                ccd.add(fname);
                ccd.add(name);
                ccd.add(descr);
                ccd.add(other);
            }
        } catch (Exception e) {
            System.out.println("Exception  = " + e);
        }
        return ccd;
    }

    public ArrayList getByTagName(String tag) {
        ArrayList ccx = new ArrayList();
        ArrayList lis = new ArrayList();

        try {
            String qry1 = "SELECT * FROM im_tag WHERE tag='" + tag + "'";
            ResultSet resx = db1.selectq(qry1);
            while (resx.next()) {
                lis.add(resx.getString("img_id"));
            }
            for(int i=0;i<lis.size();i++)
            {
                String imgd = lis.get(i).toString();
                System.out.println("imgid at 1 = "+imgd);
                ccx.addAll(gettingTag(imgd));
                System.out.println("the list at 1="+ccx);
            }
            
        } catch (Exception e) {
            System.out.println(e);
        }
        return ccx;

    }

    public ArrayList getImageDetails(String img_id) {
        String fname = null;
        String name = null;
        String descr = null;
        String other = null;

        ArrayList ccdx = new ArrayList();
        try {
            String qry1 = "SELECT * FROM up_images WHERE img_id='" + img_id + "'";
            res = db1.selectq(qry1);
            while (res.next()) {
                fname = res.getString("fname");
                name = res.getString("name");
                descr = res.getString("descr");
                other = res.getString("other");
            }


            ccdx.add(fname);
            ccdx.add(name);
            ccdx.add(descr);
            ccdx.add(other);



        } catch (Exception e) {
            System.out.println(e);
        }
        return ccdx;

    }

    public boolean deleteTags(String img_id) {
        boolean b = false;
        String qry1 = "DELETE FROM im_tag WHERE img_id = '" + img_id + "'";
        cc = db1.execq(qry1);
        if (cc > 0) {
            b = true;
        }
        return b;
    }

    public boolean deleteLinks(String img_id) {
        boolean b = false;
        String qry1 = "DELETE FROM im_link WHERE img_id = '" + img_id + "'";
        cc = db1.execq(qry1);
        if (cc > 0) {
            b = true;
        }
        return b;
    }

    public boolean updateImageData(String img_id, String name, String descr, String other, String tags, String link) {
        boolean b = false;
        try {
            String qry = "UPDATE up_images SET name = '" + name + "', descr = '" + descr + "', other = '" + other + "' WHERE img_id = '" + img_id + "'";
            cc = db1.execq(qry);
            int xx = Integer.parseInt(img_id);

            if (!tags.isEmpty()) {
                deleteTags(img_id);
                StringTokenizer st = new StringTokenizer(tags, ",", false);


                while (st.hasMoreTokens()) {
                    tagInsert(st.nextToken(), 1, xx);
                }


            }

            if (!link.isEmpty()) {
                ArrayList ll = getLinks(img_id);
                ArrayList lll = new ArrayList();


                deleteLinks(img_id);
                StringTokenizer st = new StringTokenizer(link, ",", false);

                while (st.hasMoreTokens()) {
                    String strx = st.nextToken();
                    lll.add(strx);
                    linkInsert(strx, xx);

                    for (int d = 0; d < ll.size(); d++) {
                        for (int ddd = 0; ddd < lll.size(); ddd++) {
                            if (ll.get(d).toString().equals(lll.get(ddd).toString())) {
                                lll.remove(ddd);
                            }
                        }

                    }
                }
                for (int xo = 0; xo < lll.size(); xo++) {
                    url.udownload.que.add(lll.get(xo).toString());
                }


            }


        } catch (Exception e) {
            System.out.println("Exception in Links=" + e);
        }
        if (cc > 0) {
            b = true;
        }
        return b;

    }

    public String getNameNow(String img_id) {
        String fname = null;


        try {
            String qry1 = "SELECT * FROM up_images WHERE img_id='" + img_id + "'";
            res = db1.selectq(qry1);
            while (res.next()) {
                fname = res.getString("name");

            }



        } catch (Exception e) {
            System.out.println(e);
        }
        return fname;

    }

        public String getFnameNow(String img_id) {
        String fname = null;


        try {
            String qry1 = "SELECT * FROM up_images WHERE img_id='" + img_id + "'";
            res = db1.selectq(qry1);
            while (res.next()) {
                fname = res.getString("fname");

            }



        } catch (Exception e) {
            System.out.println(e);
        }
        return fname;

    }


}
