package server;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySQLConnection 
{
	static Connection conn;
	
	public static void connectToDB() 
	{
		try 
		{
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            System.out.println("Driver definition succeed");
        } catch (Exception ex) {
        	/* handle the error*/
        	 System.out.println("Driver definition failed");
        	 }
        
        try 
        {
            conn = DriverManager.getConnection("jdbc:mysql://localhost/cems?serverTimezone=IST","root","Daniel123456!");
            System.out.println("SQL connection succeed");

     	} 
        catch (SQLException ex) 
     	{/* handle any errors*/
         	System.out.println("SQLException: " + ex.getMessage());
            System.out.println("SQLState: " + ex.getSQLState());
            System.out.println("VendorError: " + ex.getErrorCode());
        }
   	}
}
