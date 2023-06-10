package entities;

import java.util.ArrayList;
import java.util.Map;

/**
 * This class represents a professor-user
 * 
 * @author Daniel
 *
 */
@SuppressWarnings("serial")
public class Professor<T, E> extends User {

	private Map<T, E> teachingMap;// map to navigate between two types - our use is course - subject but can be any
									// type

	private ArrayList<ProfessorExam> exams_array;
	/**
	 * @param user_id
	 * @param first_name
	 * @param last_name
	 * @param email
	 * @param username
	 * @param password
	 * @param role
	 */
	public Professor(String user_id, String first_name, String last_name, String email, String username,
			String password, String role) {
		super(user_id, first_name, last_name, email, username, password, "professor");
	}

	
	public Professor(String user_id ,ArrayList<ProfessorExam>arr) {
		super(user_id,null,null,null,null,null,"professor");
		exams_array=arr;
		
	}
	
	
	
	public void setExamArray(ArrayList<ProfessorExam> arr) {
		exams_array=arr;
	}
	
	public ArrayList<ProfessorExam> getExamArray() {
		return exams_array;
	}
	
	/**
	 * @return map
	 */
	public Map<?, ?> getMap() {
		return teachingMap;

	}

	/**
	 * @param map
	 */
	@SuppressWarnings("unchecked")
	public void setMap(Map<?, ?> map) {
		teachingMap = (Map<T, E>) map;
	}
}
