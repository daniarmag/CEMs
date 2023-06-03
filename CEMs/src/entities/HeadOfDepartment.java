package entities;

import java.util.ArrayList;

@SuppressWarnings("serial")
public class HeadOfDepartment extends User {
	private static ArrayList<?> studentarr=new ArrayList<>();
	public HeadOfDepartment(String user_id, String first_name, String last_name, String email, String username,
			String password, String role) {
		super(user_id, first_name, last_name, email, username, password, role);
	}
	
	public ArrayList<?> getAllStudent()	{
		return studentarr;
	}
	
	public void setArrStudent(ArrayList<?> arr) {
		studentarr.clear();
		HeadOfDepartment.studentarr=arr;
	}

}
