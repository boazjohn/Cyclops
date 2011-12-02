package imgsearch;

import java.awt.image.*;
import java.awt.image.PixelGrabber;
import java.io.*;
import java.awt.Graphics;
import java.awt.GraphicsConfiguration;
import java.awt.GraphicsDevice;
import java.awt.GraphicsEnvironment;
import java.awt.Image;
import java.awt.MediaTracker;
import java.awt.Toolkit;
import java.awt.Transparency;
import javax.imageio.*;

public class SobelTest {

    public static BufferedImage sobelEdgeDetection(BufferedImage img) {
        BufferedImage edge = new BufferedImage(img.getWidth(), img.getHeight(), BufferedImage.TYPE_INT_RGB);
        float[] hx = new float[]{-1, 0, 1, -2, 0, 2, -1, 0, 1};
        float[] hy = new float[]{-1, -2, -1, 0, 0, 0, 1, 2, 1};

        int rgbx[] = new int[3];
        int rgby[] = new int[3];
        for (int x = 1; x < img.getWidth() - 1; x++) {
            for (int y = 1; y < img.getHeight() - 1; y++) {
               rgbx=convolvePixel(hx, 3, 3, img, x, y, rgbx);
                rgby=convolvePixel(hy, 3, 3, img, x, y, rgby);
                //euclidean distance using estimation
                int r = Math.abs(rgbx[0]) + Math.abs(rgby[0]);
                int g = Math.abs(rgbx[1]) + Math.abs(rgby[1]);
                int b = Math.abs(rgbx[2]) + Math.abs(rgby[2]);
                // range check
                if (r > 255) {
                    r = 255;
                }
                if (g > 255) {
                    g = 255;
                }
                if (b > 255) {
                    b = 255;
                }
               

                edge.setRGB(x, y, (r << 16) | (g << 8) | b);
                
               
            }
        }
        return edge;
    }

    public static int[] convolvePixel(float[] kernel, int kernwidth, int kernHeight,
            BufferedImage src, int x, int y, int[] rgb) {
        if (rgb == null) {
            rgb = new int[3];
        }
        int halfwidth = kernwidth / 2;
        int halfheight = kernHeight / 2;
        for (int component = 0;
                component < 3;
                component++) {
            float sum = 0;
            for (int i = 0; i < kernel.length; i++) {
                int row = (i / kernwidth) - halfwidth;
                int column = (i - (kernwidth * row)) - halfheight;
                //range check
                if (x - row < 0 || x - row > src.getWidth()) {
                    continue;
                }
                if (y - column < 0 || y - column > src.getHeight()) {
                    continue;
                }
                int srcRGB = src.getRGB(x - row, y - column);
                sum = sum + kernel[i] * (srcRGB >> (16 - 8 * component) & 0xff);



            }
            rgb[component]=(int)sum;
        }

        return rgb;
    }

    // image to buffered image
    public static BufferedImage toBufferedImage(Image image){
       if(image instanceof BufferedImage ){
           return  (BufferedImage)image;
       }
        image=new javax.swing.ImageIcon(image).getImage();

        boolean hasAlpha=hasAlpha(image);
        BufferedImage bimage =null;
        GraphicsEnvironment ge=GraphicsEnvironment.getLocalGraphicsEnvironment();
        try {
            int transparency=Transparency.OPAQUE;
            if(hasAlpha==true){
                transparency=Transparency.BITMASK;

            }
            GraphicsDevice gs=ge.getDefaultScreenDevice();
            GraphicsConfiguration gc=gs.getDefaultConfiguration();
            bimage=gc.createCompatibleImage(image.getWidth(null),image.getHeight(null),transparency);

        } catch (Exception e) {
        }
        if(bimage==null){
            int type=BufferedImage.TYPE_INT_RGB;
            if(hasAlpha==true){
                type=BufferedImage.TYPE_INT_RGB;
            }
            bimage=new BufferedImage(image.getWidth(null), image.getHeight(null), type);

        }
        Graphics g=bimage.createGraphics();
       g.drawImage(image,0,0,null);
       g.dispose();
    return bimage;
    }

public static  boolean  hasAlpha(Image image){
if(image instanceof BufferedImage ){
    return ((BufferedImage)image).getColorModel().hasAlpha();
}
PixelGrabber pg=new PixelGrabber(image, 0, 0, 1, 1, false);
    try {
        pg.grabPixels();
    } catch (Exception e) {
    }
return pg.getColorModel().hasAlpha();

}
public static BufferedImage getBufferedImage(Image im){


    BufferedImage bimage=null;
    try {
        MediaTracker tracker= new MediaTracker(new java.applet.Applet());
        Image imm=im;
        tracker.addImage(imm, 1);
        tracker.waitForAll();
        int w=imm.getWidth(null);
        int h=imm.getHeight(null);
        bimage=new BufferedImage(w, h, BufferedImage.TYPE_INT_RGB);
        Graphics g=bimage.createGraphics();
        g.drawImage(imm, 0, 0, null);
        g.dispose();

    } catch (Exception e) {
    }
return  bimage;
}

public static  void callWrite(String src,String target){
    try {
        BufferedImage img=toBufferedImage(Toolkit.getDefaultToolkit().getImage(src));
        BufferedImage br=sobelEdgeDetection(img);
        ImageIO.write(br, "png", new File(target));
    } catch (Exception e) {
    }
}


    public static void main(String[] args) {
        callWrite("D:\\1.jpg", "D:\\1.png");
    }












}
