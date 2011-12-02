package db;
import java.sql.*;

/**
 *
 * @author Boaz
 */
public class db_class {
  Connection con = null;
  Statement stt = null;
  ResultSet res = null;
  int x;
  private boolean tryAgain = true;

    public db_class()
    {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://localhost/mimto","root","root");
            stt = con.createStatement();

        } catch (Exception e) {
        System.out.println("Exception"+e);

                }
   }
public ResultSet selectq(String slctq)
    {
    try {
        res = stt.executeQuery(slctq + ";");
        return res;
        }
    catch (Exception e){
    System.out.println("Exception"+e);

    }
   return null;
    }
public int execq(String exeq)
    {
    try {
        x = stt.executeUpdate(exeq + ";");
        }
    catch (Exception e){
    System.out.println("Exception"+e);

    }
    return x;
    }

}
    
