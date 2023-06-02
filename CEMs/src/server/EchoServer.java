package server;
 
import entities.Client;
import gui.HostSelectionScreenController;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import ocsf.server.*;
import serverGui.ServerScreenController;

/**
 * The EchoServer class represents a server that handles client connections and message communication.
 */
public class EchoServer extends AbstractServer 
{
	// Class variables *************************************************

	/**
	 * The default port to listen on.
	 */
	final public static int DEFAULT_PORT = 5555;
	static ObservableList<Client> clientsInfoList = FXCollections.observableArrayList();
	public static ServerScreenController serverScreenController;
	public static HostSelectionScreenController hostSelectionScreenController;
	
	

	public static void setHostSelectionScreenController(HostSelectionScreenController hostSelectionScreenController) {
		EchoServer.hostSelectionScreenController = hostSelectionScreenController;
	}

	/**
	 * @return The ServerScreenController instance.
	 */
    public static ServerScreenController getServerScreenController() 
    {
		return serverScreenController;
	}

	/**
	 * Sets the correct instance of serverScreenController.
	 * 
	 * @paramserverScreenController
	 */
	public static void setServerScreenController(ServerScreenController serverScreenController) 
	{
		EchoServer.serverScreenController = serverScreenController;
	}

	/**
	 * @returns the list of clients.
	 */
	public static ObservableList<Client> getClientsInfoList() 
    {
		return clientsInfoList;
	}

	// Constructors ****************************************************

	/**
	 * Constructs an instance of the echo server.
	 *
	 * @param port The port number to connect on.
	 */
	public EchoServer(int port) 
	{
		super(port);
	}

	// Instance methods ************************************************

	
	/**
	 * Updates the clientsInfoList with the connection status of a client.
	 *
	 * @param client The ConnectionToClient object representing the client connection.
	 * @param status The status of the client connection.
	 */
	public static void updateclientsInfoList(ConnectionToClient client, String status) 
	{
		//Update existing client's status.
	    for (Client existingClient : clientsInfoList) 
	        {
	            try {
	            	//Check if the existing client's IP matches the client's IP.
	                if (existingClient.getIp().equals(client.getInetAddress().getHostAddress())) 
	                {
	                    existingClient.setStatus(status);
	                    clientsInfoList.remove(existingClient);
	                    break;
	                }
	            } 
	            catch (NullPointerException ex)
	            {
	                System.out.println("Client not found!");
	            }
	        }
	        try 
	        {
	        	//Get the IP and hostname of the client.
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
	 * @param msg    The message received from the client.
	 * @param client The connection from which the message originated.
	 */
	public void handleMessageFromClient(Object msg, ConnectionToClient client) 
	{
		System.out.println("Message received: " + msg + " from " + client);
		ServerMessageHandler.messageHandler(msg, client);
	}

	/**
	 * This method overrides the one in the superclass. Called when the server
	 * starts listening for connections.
	 */
	protected void serverStarted() 
	{
		System.out.println("Server listening for connections on port " + getPort());
	}

	/**
	 * This method overrides the one in the superclass. Called when the server stops
	 * listening for connections.
	 */
	protected void serverStopped() 
	{
		System.out.println("Server has stopped listening for connections.");
	}

	


}

