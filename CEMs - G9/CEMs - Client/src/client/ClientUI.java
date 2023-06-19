package client;

import javafx.application.Application;
import javafx.stage.Stage;
import java.io.IOException;
import gui.HostSelectionScreenController;

/**
 * This is the main class of client side
 */
public class ClientUI extends Application 
{
	public static ClientController chat;

	/**
	 * @param args
	 * @throws Exception
	 */
	public static void main(String args[]) throws Exception 
	{
		launch(args);
	} 

	/**
	 * Initializes the JavaFX controller during application startup.
	 * @param primaryStage The primary stage of the application.
	 * @throws Exception
	 */
	@Override
	public void start(Stage primaryStage) throws Exception 
	{
		//Starting window of client-side.
		HostSelectionScreenController clientScreen = new HostSelectionScreenController();
		clientScreen.start(primaryStage);
		
	}

	/**
	 * Initializing an instance of a client.
	 * @param host
	 * @param port
	 * @return true or false
	 * @throws IOException
	 */
	public static boolean connect(String host, int port) throws IOException
	{
		chat = new ClientController(host, port);
		try
		{
			chat.client.openConnection();
		}catch (Exception e)
		{
			return false;
		}
		return true;
	}

}