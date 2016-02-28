/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package imgsearch;
import javax.imageio.*;
import java.awt.image.BufferedImage;
import java.io.File;

/**
 *
 * @author arungs
 */
import java.util.*;
public class rgbTest {

	   public static  Vector getRgb(String path,int r,int g,int b) {
               //System.out.println("ggdhsghdg");
           int cnt=0,a=0,c=0,d=0;
           Hashtable<File ,Integer> ht= new Hashtable<File,Integer>();
           Vector v=new Vector();
           File f=new File(path);
           String pa=path;
               System.out.println(""+pa);
          // String path="C:\\Users\\arungs\\Documents\\NetBeansProjects\\imagesearchengine\\build\\web\\uploadedimg";
           
           try {
                if(r==255 && g==255 && b==0){
                    a=220;
                    c=200;
                    b=16;
                    d=0;
                }
                if(r==255 && g==255 && b==255){
                    a=255;
                    c=255;
                    d=255;
                }
                if(r==0 && g==0 && b==0){
                    a=0;
                    c=0;
                    d=0;
                }
                if(r==255 && g==0 && b==0){
                    a=100;
                    g=20;
                    c=0;
                    b=10;
                    d=0;
                }
                if(r==0 && g==0 & b==255){
                    r=30;
                    a=0;
                    g=50;
                    c=0;
                    d=100;
                }
                if(r==0 && g==255 & b==0){
                    r=170;
                    a=0;
                    c=150;
                    b=50;
                    d=0;
                }
                if(r==205 && g==205 && b==205){
                 a=170;
                 r=210;
                 c=110;
                 g=180;
                 d=50;
                 b=105;
                }
                
                File f1[]=f.listFiles();
             for(int q=0;q<f1.length;q++){ 
                BufferedImage img=ImageIO.read(f1[q]);
                cnt=0;
                for(int i=0;i<img.getWidth();i++){
                for(int j=0;j<img.getHeight();j++)
                {
                     //System.out.println(img.getRGB(i,j));
                         
                    
                        int clr=img.getRGB(i, j);
                        
                        int  red   = (clr & 0x00ff0000) >> 16;
                        int  green = (clr & 0x0000ff00) >> 8;
                        int  blue  =  clr & 0x000000ff;
                     
                      //  System.out.println(""+red+" "+green+" "+blue+""+a+""+r+""+c+""+g+""+d+""+b);
                        if((red>=a && red<=r) && (green>=c && green<=g) && (blue>=d && blue<=b)) {
                             
                            cnt++;
                        }

                    

                    //int i,j;

                 }
                }
                // System.out.println("Try c= "+cnt+" <----> "+f1[q].getName());
                if(cnt!=0){
                ht.put(f1[q], cnt);
                 System.out.println("c= "+cnt+" <----> "+f1[q].getName());
                }
               }
                
                  Enumeration e=ht.keys();
            while (e.hasMoreElements()) {
                File ff=(File)e.nextElement();
                int data=ht.get(ff);
                 while (e.hasMoreElements()) {
                    File f2=(File)e.nextElement();
                    int data1=ht.get(f2) ;
                    if(data<data1){
                     data=data1;
                     ff=f2;
                    }
                }
                
                v.add(ff);
                ht.remove(ff);
                e=ht.keys();
            }
                
                
                
                
                  //  System.out.println(cnt);
               } catch (Exception e) {
                        System.out.println(e);

                    }
     
                return v;
       }

}

