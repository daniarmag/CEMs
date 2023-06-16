package entities;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.function.Consumer;

/**
 * Represents a head of department.
 */
@SuppressWarnings("serial")
public class HeadOfDepartment extends User {
	private static ArrayList<?> studentArr=new ArrayList<>();
	private static ArrayList<?> professorArr= new ArrayList<>();
	private static ArrayList<?> courseArr= new ArrayList<>();
	private static Map<String,Consumer<ArrayList<?>>> mapArrays=new HashMap<>();//map between a function to fill a list
	private static Map<String,ArrayList<?>> mapData=new HashMap<>();
	static {
		mapArrays.put("professor",arr -> {setArrprofessor(arr);});
		mapArrays.put("student",arr -> {setArrStudent(arr);});
		mapArrays.put("course",arr -> {setArrCourses(arr);});
		}
	
	/**
	 * @param user_id
	 * @param first_name
	 * @param last_name
	 * @param email
	 * @param username
	 * @param password
	 * @param role
	 */
	public HeadOfDepartment(String user_id, String first_name, String last_name, String email, String username,
			String password, String role) {
		super(user_id, first_name, last_name, email, username, password, role);
	}
	
	/**
	 * @param str
	 * @return
	 */
	public ArrayList<?> getArray(String str)	{
		return mapData.get(str);
		
	}
	
	/**
	 * 	@param arr the array containing user objects
	 */
	public void setArrUser(ArrayList<?> arr) {
		
		if( arr.get(0).getClass().equals(User.class)) {		
		String user=((User)arr.get(0)).getRole();
		mapArrays.get(user).accept(arr);//activate the specific set method to the array 
		}
		else
			mapArrays.get("course").accept(arr);
		}

	/**
	 * set the courses array
	 * @param arr
	 */
	private static void setArrCourses(ArrayList<?> arr) {
		courseArr.clear();
		HeadOfDepartment.courseArr=arr;
		mapData.put("course", courseArr);
	}
	
	/**
	 * set arrapy of all professors
	 * @param arr
	 */
	private static  void setArrprofessor(ArrayList<?> arr) {
		professorArr.clear();
		HeadOfDepartment.professorArr=arr;
		mapData.put("professor", arr);
	}
	
	/**
	 * set array for all studens
	 * @param arr
	 */
	private static void setArrStudent(ArrayList<?> arr) {
		studentArr.clear();
		HeadOfDepartment.studentArr=arr;
		mapData.put("student", arr);
	}
}
