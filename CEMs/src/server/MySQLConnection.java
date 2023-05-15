package server;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import entities.Question;

public class MySQLConnection 
{
	static Connection conn;
	
	/**
	 * Establishing a connection to a MySQL database
	 * @param username of database
	 * @param password of database
	 * @return
	 */
	public static boolean connectToDB(String URL, String username, String password) 
	{
		try 
		{
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            System.out.println("Driver definition succeed");
        } catch (Exception ex) {
        	/* handle the error*/
        	 System.out.println("Driver definition failed");
        	 return false;
        	 }
        
        try 
        {
            conn = DriverManager.getConnection(URL, username, password);
            System.out.println("SQL connection succeed");
            return true;

     	} 
        catch (SQLException ex) 
     	{/* handle any errors*/
        
         	System.out.println("SQLException: " + ex.getMessage());
            System.out.println("SQLState: " + ex.getSQLState());
            System.out.println("VendorError: " + ex.getErrorCode());
            return false;
        }
   	}
	
	/**
	 * This method, loadQuestions, retrieves a list of questions from a database table
	 * @return an ArrayList of Question objects
	 */
	public static ArrayList<Question> loadQuestions()
	{
		ArrayList<Question> qArr = new ArrayList<Question>();
		if (conn != null) 
		{
			try
			{
				//lOading all the questions from the table
				ResultSet rs = conn.createStatement().executeQuery("Select * FROM question");
				while (rs.next()) 
				{
					Question q = new Question(rs.getString("id"), rs.getString("subject"),
					rs.getString("course_name"), rs.getString("question_text"), rs.getInt("question_number"),
					rs.getString("lecturer"));
					qArr.add(q);
				}
			} 
			catch (SQLException e) 
			{
				e.printStackTrace();
			}
		}
		return qArr;
	}
	
	/**
	 * This method is responsible for updating question text and question number records in the database. 
	 * @param arr represents the updated question data.
	 */
	public static void saveQuestionToDB(ArrayList<Question> arr) 
	{
	    try 
	    {
	        PreparedStatement ps = conn.prepareStatement("UPDATE question SET question_text = ?, question_number = ? WHERE id = ?");
	        for (Question question : arr) 
	        {
	            ps.setString(1, question.questionText);
	            ps.setInt(2, question.questionNumber);
	            ps.setString(3, question.getId());
	            ps.executeUpdate();
	        }
	    } 
	    catch (SQLException e)
	    {
	        e.printStackTrace();
	    }
	}

}
