package server;

import java.awt.Desktop;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.*;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entities.Professor;
import entities.Question;
import entities.Student;
import entities.User;

public class MySQLController 
{
	static Connection conn;
	private static volatile MySQLController INSTANCE;
	
	
	
	/**
	 * private constructor for Singleton DP
	 */
	private MySQLController() {	
	}
	
	/**
	 * @return
	 */
	public static MySQLController getInstance() {
		if(INSTANCE==null)
			synchronized(MySQLController.class) {
				if(INSTANCE==null)
			INSTANCE=new MySQLController();
			}
		return INSTANCE;
	}
	
	/**
	 * Establishing a connection to a MySQL database
	 * @param username of database
	 * @param password of database
	 * @return
	 */
	public  boolean connectToDB(String URL, String username, String password) 
	{
		try 
		{
            Class.forName("com.mysql.cj.jdbc.Driver").getConstructor().newInstance();
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
	
	//this method should sent the path of the exam to the client
		// notice that this is only a prototype for the function but those are the
		//function needed /
		@SuppressWarnings("unused")
		private void openBLOB() throws SQLException {
			Statement st=conn.createStatement();
			ResultSet r=st.executeQuery("SELECT q.exam_path FROM  physical_exam as q");
			try {
			while(r.next()) {
				String path=r.getString(1);
				File file=new File(path);
				  try {
				    	Desktop desktop= Desktop.getDesktop();	
				    	desktop.open(file);
				    	
				    }catch(Exception e) {
				    	e.printStackTrace();
				    }
			}}catch(SQLException e) {e.printStackTrace();}
		}
	
	//this method  a Blob
	// notice that this is only a prototype for the function but those are the
	//function needed /
	@SuppressWarnings("unused")
	private void openBLOB2() throws SQLException {
		Statement st=conn.createStatement();
		ResultSet r=st.executeQuery("SELECT q.physical_exam FROM  physical_exam as q");
		try {
			Blob blob=null;
		while(r.next()) {
			 	blob = r.getBlob(1);
		}
			byte[] bufferout = null;

			bufferout = blob.getBytes(1, (int)blob.length());
			File output = null;
			String outputFileName = "C:\\Test\\output.docx";
			try {
				output = new File(outputFileName);
			} catch (Exception e) {
				e.printStackTrace();
			}
			FileOutputStream fos = null;
			try {
				fos = new FileOutputStream(output);
				fos.write(bufferout);
				fos.close();
				fos.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
            
			  try {
			    	Desktop desktop= Desktop.getDesktop();	
			    	desktop.open(output);
			    }catch(Exception e) {
			    	e.printStackTrace();
			    }
		}catch(SQLException e) {e.printStackTrace();}
	}
	
	
	/**
	 * This method, loadQuestions, retrieves a list of questions from a database table
	 * @return an ArrayList of Question objects
	 */
	public  ArrayList<Question> loadProfessorQuestions(String id)
	{
		ArrayList<Question> qArr = new ArrayList<Question>();
	    try
		{
	    	//loading all the questions from the table
	    	PreparedStatement ps = conn.prepareStatement("SELECT * FROM question WHERE professor_id = ?");
		    ps.setString(1, id);
		    ResultSet rs = ps.executeQuery();
			while (rs.next()) 
			{
				Question q = new Question(rs.getString("question_number"), rs.getString("id"),
				rs.getString("subject_id"), rs.getString("question_text"), rs.getString("professor_full_name"),
				rs.getString("professor_id"), rs.getString("correct_answer"), 
				new String[]{rs.getString("answer1"), rs.getString("answer2"), rs.getString("answer3"), rs.getString("answer4")});
				qArr.add(q);
			}
		} 
		catch (SQLException e) {e.printStackTrace();}
		return qArr;
	}
	
	/**
	 * This method is responsible for updating question text and question number records in the database. 
	 * @param arr represents the updated question data.
	 */
	public void editQuestionInDb(ArrayList<String> arr) 
	{
	    try 
	    {
	        PreparedStatement ps = conn.prepareStatement("UPDATE question SET question_text = ?, correct_answer = ?, "
	        									       + "answer1 = ?, answer2 = ?, answer3 = ?, answer4 = ? WHERE id = ?");
	        ps.setString(1, arr.get(1));
	        ps.setString(2, arr.get(2));
	        ps.setString(3, arr.get(3));
	        ps.setString(4, arr.get(4));
	        ps.setString(5, arr.get(5));
	        ps.setString(6, arr.get(6));
	        ps.setString(7, arr.get(0));
	        ps.executeUpdate();
	    } 
	    catch (SQLException e) {e.printStackTrace();}
	}
	
	/**
	 * This method is responsible for adding a question to the database. 
	 * @param question represents the updated question data.
	 */
	public void addQuestionToDB(Question question) 
	{
	    try 
	    {
	    	PreparedStatement ps = conn.prepareStatement( "INSERT INTO question (question_number, id, "
										    			+ "subject_id, question_text, professor_full_name, professor_id, "
										    			+ "correct_answer, answer1, answer2, answer3, answer4) "
										    			+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
	       ps.setString(1, question.getQuestionNumber());
	       ps.setString(2, question.getId());
	       ps.setString(3, question.getSubject());
	       ps.setString(4, question.getQuestionText());
	       ps.setString(5, question.getAuthor());
	       ps.setString(6, question.getProfessorId());
	       ps.setString(7, question.getCorrectAnswer());
	       ps.setString(8, question.getAnswers()[0]);
	       ps.setString(9, question.getAnswers()[1]);
	       ps.setString(10, question.getAnswers()[2]);
	       ps.setString(11, question.getAnswers()[3]);
	       ps.executeUpdate();
	    } 
	    catch (SQLException e){e.printStackTrace();}
	}
	
	/**
	 * Verifies user info for login.
	 * @param loginInfo
	 * @return user object or null.
	 */
	public  User verifyLogin(ArrayList<String> loginInfo)
	{
		String username = loginInfo.get(1);
		String password = loginInfo.get(2);
		User newUser = null;
		//lOading all the questions from the table
		try
		{
			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM users WHERE username = ? AND password = ?");
			stmt.setString(1, username);
			stmt.setString(2, password);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) 
			{
				String user_id = rs.getString("user_id");
				String first_name = rs.getString("first_name");
				String last_name = rs.getString("last_name");
				String email = rs.getString("email");
				String role = rs.getString("role");
				int isLogged = rs.getInt("isLogged");
				if (isLogged == 0)
				{
					PreparedStatement ps = conn.prepareStatement("UPDATE users SET isLogged = 1 WHERE user_id = ?");
					ps.setString(1, user_id);
					ps.executeUpdate();
					switch(role)
					{
						case "student":
							newUser = new Student(user_id, first_name, last_name, email, username, password, "student");
							break;
						case "professor":
							newUser = new Professor(user_id, first_name, last_name, email, username, password, "professor");
							break;
					}
				}
				else 
				{
					return new User("logged", null, null, null, null, null, null);
				}
			}
		}
		catch (SQLException e){}
		return newUser;
	}
	
	public  void logout(String id)
	{
		try
		{
			PreparedStatement ps = conn.prepareStatement("UPDATE users SET isLogged = 0 WHERE user_id = ?");
			ps.setString(1, id);
			ps.executeUpdate();
		}
		catch(SQLException e){}
	}
	
	public  ArrayList<String> getProfessorSubjects(String id)
	{
		ArrayList<String> answer = new ArrayList<String>();
		answer.add("professor subjects");
		try
		{
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM professor_subject WHERE professor_id = ?");
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) 
			{
				String subject_id = rs.getString("subject_id");
				PreparedStatement tempPs = conn.prepareStatement("SELECT * FROM subject WHERE subject_id = ?");
				tempPs.setString(1, subject_id);
				ResultSet tempRs = tempPs.executeQuery();
				while (tempRs.next())
				{
					String subject_name = tempRs.getString("subject_name");
					answer.add(subject_id + " - " + subject_name);
				}
			}
		}
		catch(SQLException e){e.printStackTrace();}
		return answer;
	}
	
	public  ArrayList<String> getSubjectCourses(String id)
	{
		ArrayList<String> answer = new ArrayList<String>();
		answer.add("subject courses");
		try
		{
			PreparedStatement ps = conn.prepareStatement("SELECT course_id, course_name FROM course WHERE course_subject_id = ?");
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) 
			{
				String course_id = rs.getString("course_id");
				String course_name = rs.getString("course_name");
				answer.add(course_id + " - " + course_name);
			}
		}
		catch(SQLException e){e.printStackTrace();}
		return answer;
	}
	
	public ArrayList<String> getAmountOfQuestions()
	{
		ArrayList<String> answer = new ArrayList<String>();
		answer.add("amount of questions");
		try 
		{
			ResultSet rs = conn.createStatement().executeQuery("SELECT MAX(question_number) FROM question");
			while (rs.next())
			{
				String maxQuestion = rs.getString("MAX(question_number)");
				answer.add(maxQuestion);
			}
				
		}
		catch(SQLException e){e.printStackTrace();}
		return answer;
	}
	
	public  void addQuestionCourses(ArrayList<String> courses)
	{
		String question_id = courses.get(0);
		courses.remove(0);
		try 
		{
			PreparedStatement ps = conn.prepareStatement("INSERT INTO question_course (question_id, course_id) VALUES (?, ?)");
			for (String s : courses)
			{
				ps.setString(1, question_id);
				String[] tempStr = s.split("\\s+");
				ps.setString(2, tempStr[0]);
				ps.executeUpdate();
			}
		}
		catch(SQLException e){e.printStackTrace();}
	}
	
	public  void logoutAllUsers()
	{
		try 
		{
			Statement st = conn.createStatement();
			st.executeUpdate("UPDATE users SET isLogged = 0");
		}
		catch(SQLException e){e.printStackTrace();}
	}

	public  void deleteQuestionFromDb(String string) 
	{
		
		try 
		{
			PreparedStatement ps = conn.prepareStatement("DELETE FROM question WHERE id = ?");
			ps.setString(1, string);
			ps.executeUpdate();
		}
		catch(SQLException e){e.printStackTrace();}
	}
	
}
