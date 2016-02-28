/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package imgsearch;

/**
 *
 * @author root
 */
import java.io.File;

   import javax.swing.filechooser.FileFilter;

   /*
    * This class implements a generic file name filter that allows the listing/selection
    * of JPEG files.
    */
   public class JPEGImageFileFilter extends FileFilter implements java.io.FileFilter
     {
     public boolean accept(File f)
       {
       if (f.getName().toLowerCase().endsWith(".jpeg")) return true;
       if (f.getName().toLowerCase().endsWith(".jpg")) return true;
       return false;
       }
     public String getDescription()
       {
       return "JPEG files";
       }

     } 
