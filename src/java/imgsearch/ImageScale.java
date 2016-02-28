package imgsearch;



import java.awt.Graphics;
import java.awt.Image;
import java.awt.MediaTracker;
import java.awt.Toolkit;
import java.awt.image.BufferedImage;
import java.io.File;

import javax.imageio.ImageIO;

public class ImageScale
{
		public static void scale(String src,int w,int h,String target)
                {
			try
                        {
				Image img=Toolkit.getDefaultToolkit().getImage(src);
				Image img2=img.getScaledInstance(w, h,Image.SCALE_DEFAULT );
				MediaTracker mt=new MediaTracker(new java.applet.Applet());
				mt.addImage(img2, 0);
				mt.waitForAll();
                        	BufferedImage br=new BufferedImage(w,h,BufferedImage.TYPE_INT_RGB);
				Graphics g=br.getGraphics();
				g.drawImage(img2,0,0,null);
				ImageIO.write(br,"jpg",new File(target));
			}
			catch(Exception e)
                        {
				System.out.println("Err>>"+e);
			}
		}
             public static void main(String[] args) {

                 File f=new File("C:\\Users\\arungs\\Documents\\NetBeansProjects\\imagesearchengine\\web\\uploadedimg");
                 File fl[]=f.listFiles();
                 for (int i = 0; i < fl.length; i++) {
                    // System.out.println(""+fl[i].getAbsolutePath());
                   ImageScale.scale(fl[i].getAbsolutePath(), 200, 200, "C:\\Users\\arungs\\Documents\\NetBeansProjects\\imagesearchengine\\web\\scaledimage\\"+fl[i].getName());
                 }
        }

}
	
