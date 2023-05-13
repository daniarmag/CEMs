package client;

import javafx.application.Application;
import javafx.stage.Stage;
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
		chat = new ClientController("localhost", 5555);
		//Starting window of client-side.
		HostSelectionScreenController clientScreen = new HostSelectionScreenController();
		clientScreen.start(primaryStage);
	}

}