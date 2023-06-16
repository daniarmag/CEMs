package entities;

import java.io.Serializable;

/**
 * Client class represents the client and hold his connection-information.
 */
@SuppressWarnings("serial")
public class Client implements Serializable 
{
	private String ip;
	private String host;
	private String status;

	/**
	 * @param ip
	 * @param host
	 * @param status
	 */
	public Client(String ip, String host, String status) 
	{
		this.ip = ip;
		this.host = host;
		this.status = status;
	}

	/**
	 * @return The IP of the client
	 */
	public String getIp() 
	{
		return ip;
	}

	/**
	 * @return The host-name of the client
	 */
	public String getHost() 
	{
		return host;
	}

	/**
	 * @return The status of the client's connection
	 */
	public String getStatus() 
	{
		return status;
	}

	/**
	 * @param ip of the client
	 */
	public void setIp(String ip) 
	{
		this.ip = ip;
	}

	/**
	 * @param host-name of the client
	 */
	public void setHost(String host)
	{
		this.host = host;
	}

	/**
	 * @param status of client's connection
	 */
	public void setStatus(String status) 
	{
		this.status = status;
	}
}
