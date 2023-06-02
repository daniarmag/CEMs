package entities;

/**
 * This class represents a professor-user
 * @author Daniel
 *
 */
@SuppressWarnings("serial")
public class Professor extends User
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
	public Professor(String user_id, String first_name, String last_name, String email, String username, String password, String role)
	{
		super(user_id, first_name, last_name, email, username, password, "professor");
	}

}
