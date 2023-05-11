package server;
 
import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import ocsf.server.*;

public class EchoServer extends AbstractServer 
{
	// Class variables *************************************************

	/**
	 * The default port to listen on.
	 */
	final public static int DEFAULT_PORT = 5555;
	private static String username;
	private static String password;
    public static HashMap<ConnectionToClient, String> clientList = new HashMap<>();


	// Constructors ****************************************************

	/**
	 * Constructs an instance of the echo server.
	 *
	 * @param port The port number to connect on.
	 */
	public EchoServer(int port, String username, String password) 
	{
		super(port);
		this.password = password;
		this.username = username;
	}

	// Instance methods ************************************************

	/**
	 * This method handles any messages received from the client.
	 *
	 * @param msg    The message received from the client.
	 * @param client The connection from which the message originated.
	 */
	public void handleMessageFromClient(Object msg, ConnectionToClient client) 
	{
		System.out.println("Message received: " + msg + " from " + client);
		String clientMsg = (String)msg;
		try
		{
			if (clientMsg.equals("connected"))
			{
				clientList.put(client, "Connected");
				client.sendToClient("Connected");
			}
			else if (clientMsg.equals("disconnected"))
			{
				clientList.put(client, "Disconnected");
				client.sendToClient("Disonnected");
			}
			else if (clientMsg.equals("Update Question"))
			{
				//Implement logic later
			}
			client.sendToClient("Response from server");
		}
        catch (IOException e) 
        {
            e.printStackTrace();
        }
	}

	/**
	 * This method overrides the one in the superclass. Called when the server
	 * starts listening for connections.
	 */
	protected void serverStarted() 
	{
		System.out.println("Server listening for connections on port " + getPort());
		try
		{
			MySQLConnection.connectToDB(username, password);
		}
		catch(Exception e)
		{
			System.out.println("Connection failed!");
		}
	}

	/**
	 * This method overrides the one in the superclass. Called when the server stops
	 * listening for connections.
	 */
	protected void serverStopped() 
	{
		System.out.println("Server has stopped listening for connections.");
	}

	// Class methods ***************************************************

	/**
	 * This method is responsible for the creation of the server instance (there is
	 * no UI in this phase).
	 *
	 * @param args[0] The port number to listen on. Defaults to 5555 if no argument
	 *                is entered.
	 */
	public static void main(String[] args)
	{
		int port = 0; // Port to listen on
		try 
		{
			port = Integer.parseInt(args[0]); // Get port from command line
		} 
		catch (Throwable t)
		{
			port = DEFAULT_PORT; // Set port to 5555
		}
		EchoServer sv = new EchoServer(port, username, password);
		try
		{
			sv.listen(); // Start listening for connections
		} catch (Exception ex) 
		{
			System.out.println("ERROR - Could not listen for clients!");
		}
	}
}
//End of EchoServer class
