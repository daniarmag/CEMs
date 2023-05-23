package entities;

import java.io.Serializable;

@SuppressWarnings("serial")
public class User implements Serializable 
{
	private String user_id;
	private String first_name;
	private String last_name;
	private String email;
	private String username;
	private String password;
	private String role;
	
	public User(String user_id, String first_name, String last_name, String email, String username, String password, String role) 
	{
		super();
		this.user_id = user_id;
		this.first_name = first_name;
		this.last_name = last_name;
		this.email = email;
		this.username = username;
		this.password = password;
		this.role = role;
	}

	public String getUser_id() 
	{
		return user_id;
	}

	public void setUser_id(String user_id) 
	{
		this.user_id = user_id;
	}

	public String getFirst_name() 
	{
		return first_name;
	}

	public void setFirst_name(String first_name) 
	{
		this.first_name = first_name;
	}

	public String getLast_name() 
	{
		return last_name;
	}

	public void setLast_name(String last_name)
	{
		this.last_name = last_name;
	}

	public String getEmail() 
	{
		return email;
	}

	public void setEmail(String email) 
	{
		this.email = email;
	}

	public String getUsername() 
	{
		return username;
	}

	public void setUsername(String username) 
	{
		this.username = username;
	}

	public String getPassword() 
	{
		return password;
	}

	public void setPassword(String password) 
	{
		this.password = password;
	}

	public String getRole()
	{
		return role;
	}

	public void setRole(String role) 
	{
		this.role = role;
	}
	
	
}
