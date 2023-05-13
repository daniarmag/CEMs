package server;
 
import java.io.*;
import java.util.ArrayList;

import entities.Client;
import entities.Question;
import gui.ServerScreenController;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
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
	static ObservableList<Client> clientsInfoList = FXCollections.observableArrayList();
	public static ServerScreenController serverScreenController;
	
    public static ServerScreenController getServerScreenController() 
    {
		return serverScreenController;
	}

	public static void setServerScreenController(ServerScreenController serverScreenController) 
	{
		EchoServer.serverScreenController = serverScreenController;
	}

	public static ObservableList<Client> getClientsInfoList() 
    {
		return clientsInfoList;
	}

	public static void setClientsInfoList(ObservableList<Client> clientsInfoList) 
	{
		EchoServer.clientsInfoList = clientsInfoList;
	}

	


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

	
	static void updateclientsInfoList(ConnectionToClient client, String status) 
	{
	    for (Client existingClient : clientsInfoList) 
	        {
	            try {
	                if (existingClient.getIp().equals(client.getInetAddress().getHostAddress())) 
	                {
	                    existingClient.setStatus(status);
	                    clientsInfoList.remove(existingClient);
	                    break;
	                }
	            } 
	            catch (NullPointerException ex) {
	                System.out.println("Client not found!");
	            }
	        }

	        try 
	        {
	            String clientIP = client.getInetAddress().getHostAddress();
	            String clientHostName = client.getInetAddress().getHostName();
	            Client newClient = new Client(clientIP, clientHostName, status);
	            clientsInfoList.add(newClient);
	        } 
	        catch (NullPointerException ex) 
	        {
	            System.out.println("Client not found!");
	        }
	    
	}
	
	/**
	 * This method handles any messages received from the client.
	 *
	 * @param msg    The message received from the client.
	 * @param client The connection from which the message originated.
	 */
	public void handleMessageFromClient(Object msg, ConnectionToClient client) 
	{
		System.out.println("Message received: " + msg + " from " + client);
		try
		{
			if (msg.toString().equals("connected"))
			{
				updateclientsInfoList(client, "Connected");
				serverScreenController.clientConnected();
				client.sendToClient("Connected");
			}
			
			else if (msg.toString().equals("disconnected"))
			{
				updateclientsInfoList(client, "Disconnected");
				client.sendToClient("Disonnected");
			}
			else if (msg.toString().equals("Load questions"))
			{
				client.sendToClient(MySQLConnection.loadQuestions());
			}

			else if (msg.toString().startsWith("[entities.Question"))
			{
				MySQLConnection.saveQuestionToDB((ArrayList<Question>)msg);
				this.sendToAllClients("Question updated");
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
