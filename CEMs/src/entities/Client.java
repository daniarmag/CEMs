package entities;

import java.io.Serializable;

@SuppressWarnings("serial")
public class Client implements Serializable 
{
	private String ip;
	private String host;
	private String status;

	public Client(String ip, String host, String status) 
	{
		this.ip = ip;
		this.host = host;
		this.status = status;
	}

	public String getIp() 
	{
		return ip;
	}

	public String getHost() 
	{
		return host;
	}

	public String getStatus() 
	{
		return status;
	}

	public void setIp(String ip) 
	{
		this.ip = ip;
	}

	public void setHost(String host)
	{
		this.host = host;
	}

	public void setStatus(String status) 
	{
		this.status = status;
	}
}
