package entities;

/**
 * This class represents a student-user
 * @author Daniel
 *
 */
@SuppressWarnings("serial")
public class Student extends User
{

	/**
	 * @param user_id
	 * @param first_name
	 * @param last_name
	 * @param email
	 * @param username
	 * @param password
	 * @param role
	 */
	public Student(String user_id, String first_name, String last_name, String email, String username, String password, String role) 
	{
		super(user_id, first_name, last_name, email, username, password, "student");
	}

	@Override
	public String toString() {
		return "Student [getUser_id()=" + getUser_id() + ", getFirst_name()=" + getFirst_name() + ", getLast_name()="
				+ getLast_name() + ", getEmail()=" + getEmail() + ", getUsername()=" + getUsername()
				+ ", getPassword()=" + getPassword() + ", getRole()=" + getRole() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	
	
	

}
