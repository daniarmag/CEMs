package client;

import javafx.application.Application;
import javafx.stage.Stage;

import java.io.IOException;

import gui.HostSelectionScreenController;



public class ClientUI extends Application 
{
	public static ClientController chat;

	public static void main(String args[]) throws Exception 
	{
		launch(args);
	} 

	@Override
	public void start(Stage primaryStage) throws Exception 
	{
		//Starting window of client-side.
		HostSelectionScreenController clientScreen = new HostSelectionScreenController();
		clientScreen.start(primaryStage);
	}
	
	/*Initializing an instance of a client.*/
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