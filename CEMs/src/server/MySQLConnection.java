package server;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class MySQLConnection 
{
	static Connection conn;
	
	public static void connectToDB(String username, String password) 
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
            conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1/cems?serverTimezone=IST", username, password);
            System.out.println("SQL connection succeed");

     	} 
        catch (SQLException ex) 
     	{/* handle any errors*/
        
         	System.out.println("SQLException: " + ex.getMessage());
            System.out.println("SQLState: " + ex.getSQLState());
            System.out.println("VendorError: " + ex.getErrorCode());
        }
   	}
	
	public static void getTableQuestion(Connection con1)
	{
		Statement stmt;
		try {
			stmt = con1.createStatement();
			stmt.executeUpdate("create table courses(num int, name VARCHAR(40), semestr VARCHAR(10));");
			stmt.executeUpdate("load data local infile \"courses.txt\" into table courses");
	 		
		} catch (SQLException e) {	e.printStackTrace();}
		 		
	}
}
