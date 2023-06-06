package entities;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.function.Consumer;

@SuppressWarnings("serial")
public class HeadOfDepartment extends User {
	private static ArrayList<?> studentArr=new ArrayList<>();
	private static ArrayList<?> professorArr= new ArrayList<>();
	private static Map<String,Consumer<ArrayList<?>>> mapArrays=new HashMap<>();//map between a function to fill a list
	private static Map<String,ArrayList<?>> mapData=new HashMap<>();
	static {
		mapArrays.put("professor",arr -> {setArrprofessor(arr);});
		mapArrays.put("student",arr -> {setArrStudent(arr);});
		}
	
	public HeadOfDepartment(String user_id, String first_name, String last_name, String email, String username,
			String password, String role) {
		super(user_id, first_name, last_name, email, username, password, role);
		
	}
	
	
	public ArrayList<?> getArray(String str)	{
//		if(str.equals("student"))
//			return studentArr;
//		return professorArr;
		return mapData.get(str);
	}
	
	/**
	 * @author czmat
	 * @param arr
	 * this method load both arrays ( student and professor) according to the input.
	 */
	public void setArrUser(ArrayList<?> arr) {
		String user=((User)arr.get(0)).getRole();
		mapArrays.get(user).accept(arr);
		}
		
	
	public static void setArrprofessor(ArrayList<?> arr) {
		professorArr.clear();
		HeadOfDepartment.professorArr=arr;
		mapData.put("professor", arr);
		
	}
	
	private static void setArrStudent(ArrayList<?> arr) {
		studentArr.clear();
		HeadOfDepartment.studentArr=arr;
		mapData.put("student", arr);
	}
	
	
}
