package url;

import java.net.*;
import java.io.*;
import java.util.*;
import java.util.regex.*;
import javax.media.jai.JAI;
import javax.media.jai.PlanarImage;

/*
 * @author Boaz
 */
public class udownload extends Thread {

    public static Queue<String> que = new LinkedList<String>();
    public static String path = null;

    public void run() {

        System.out.println("Running Thread");
        while (true) {
            try {
                if (!que.isEmpty()) {

                    String q = que.remove();
                    urlSubmit(q);
                    System.out.println("Thread url = " + q);

                }
            } catch (Exception e) {
                System.out.println("Thread Exception: " + e);
            }

        }

    }

    public void runQueue() {
        Thread t = new Thread(this);
        t.start();

    }

    public void viewQueue() {
        System.out.println("Queue=" + que.peek());


    }

    public void urlSubmit(String urll) {

        InputStream in = null;
        String urlcontent = "";
        try {
            URL ur1 = new URL(urll);
            in = ur1.openStream();
            int ch = 0;
            while ((ch = in.read()) != -1) {
                urlcontent += (char) ch;
                if (urlcontent.endsWith("\n") && !urlcontent.isEmpty()) {
                    regexMatcher(urlcontent, urll);
                    urlcontent = null;
                }
            }
        } catch (Exception e) {
            System.out.print(e);
        }
    }
    String strT = null;
    String strH = null;
    String strU = null;
    String strA = null;

    public void regexMatcher(String urlcontent, String urx) {
        try {
            if (urlcontent != null) {
                //----------------------

                Matcher m1 = Pattern.compile("<title.+</title>").matcher(urlcontent);
                while (m1.find()) {
                    strT = m1.group().replaceAll("\\<.*?\\>", "");
                    System.out.println(strT);
                }

                Matcher m2 = Pattern.compile("<h1.+</h1>").matcher(urlcontent);
                while (m2.find()) {
                    strH = m2.group().replaceAll("\\<.*?\\>", "");
                    System.out.println(strH);


                }

                //  Matcher m3 = Pattern.compile("<img.+(/>|</img>|>)").matcher(urlcontent);

                //  while (m3.find()) {
                //System.out.println("Test URL"+m3.group());
                Matcher m4 = Pattern.compile("(http://|www.|ftp://|https://)[a-zA-Z0-9!@#$%^&()-_=+}{.,~`';]+(.jpg|.png|.gif|.tif|.JPG|.GIF|.PNG|.TIF)").matcher(urlcontent);
                while (m4.find()) {
                    strU = m4.group().replaceAll("\\<.*?\\>", "");
                    System.out.println(strU);
                    imageDownload(strU, path, urx);
                }
                Matcher m5 = Pattern.compile("alt=\".+\"").matcher(urlcontent);
                while (m5.find()) {
                    strA = m5.group().replaceAll("alt=\"|\"", "");
                    strA = strA.replaceAll("\\<.*?\\>", "");
                    System.out.println(strA);

                }
            }
        } //  }
        catch (Exception e) {
            System.out.println("Matcher Exception " + e);
        }

    }

    public String imageDownSearch(String iurl, String pathx) {
        String bb = null;

        if (iurl != null && pathx != null) {
            try {
                System.out.println("Downloading...");
                InputStream in = null;
                URL ur1 = new URL(iurl);
                in = ur1.openStream();
                File file = new File(iurl);

                String fname = file.getName();
                // String fname = ur1.getFile();
                System.out.println("Path=" + fname);
                FileOutputStream fos = new FileOutputStream(pathx + "\\searchimg\\" + fname);
                byte data[] = new byte[in.available()];
                int x;
                System.out.println(in.available());
                if (in.available() != 0) {
                    bb = pathx + "\\searchimg\\" + fname;

                    while ((x = in.read(data)) != -1) {
                        fos.write(data, 0, x);


                    }
                    fos.close();
                }

                in.close();
            } catch (Exception e) {
                System.out.print(e);
            }
        }
        return bb;
    }

    public void imageDownload(String iurl, String path, String urx) {
        if (iurl != null && path != null) {
            try {

                InputStream in = null;
                URL ur1 = new URL(iurl);
                in = ur1.openStream();
                File file = new File(iurl);

                String fname = file.getName();
                int imagewidth = 0, imageheight = 0;
                PlanarImage pi = JAI.create("url", ur1);
                imagewidth = pi.getWidth();
                imageheight = pi.getHeight();

                System.out.println(" h and w" + imageheight + "   SAS  " + imagewidth);
                if (imageheight > 150 && imagewidth > 150) {
                    // String fname = ur1.getFile();
                    System.out.println("Path=" + fname);
                    int uno = new db.db_process().getImgid() + 1;
                    String ffname = null;
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
                    FileOutputStream fos = new FileOutputStream(path + "\\imagepool\\" + ffname);
                    byte data[] = new byte[in.available()];
                    int x;
                    System.out.println(in.available());
                    if (in.available() != 0) {
                        while ((x = in.read(data)) != -1) {
                            fos.write(data, 0, x);
                        }
                        db.db_process xx = new db.db_process();
                        xx.imgInsert(fname, strH, strT, 1, ffname);
                        int bb = xx.getImgid();
                        xx.linkInsert(urx, bb);
                        StringTokenizer st = new StringTokenizer(strA, " ", false);
                        try {
                            while (st.hasMoreTokens()) {
                                String str = st.nextToken();
                                xx.tagInsert(str, 1, uno);


                            }
                        } catch (Exception e) {
                            System.out.println("Exception in Links=" + e);
                        }
                    }
                    fos.close();
                }
                in.close();
            } catch (Exception e) {
                System.out.print(e);
            }
        }
    }
}
