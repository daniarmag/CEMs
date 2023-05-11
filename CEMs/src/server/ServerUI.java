package server;

import java.io.IOException;

import gui.ServerScreenController;
import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;
import server.EchoServer;

public class ServerUI extends Application {
	final public static int DEFAULT_PORT = 5555;
	static EchoServer es;

	public static void main(String args[]) throws Exception {
		launch(args);
	}

	@Override
	public void start(Stage primaryStage) throws Exception {
		ServerScreenController serverScreen = new ServerScreenController();
		serverScreen.start(primaryStage);
	}

	public static void runServer(String p, String username, String password) {
		int port = 0; // Port to listen on
		try {
			port = Integer.parseInt(p); // Set port to 5555

		} catch (Throwable t) {
			System.out.println("ERROR - Could not connect!");
		}

		es = new EchoServer(port, username, password);

		try {
			es.listen(); // Start listening for connections
		} catch (Exception ex) {
			System.out.println("ERROR - Could not listen for clients!");
		}
	}
	
	public static boolean closeServer() 
	{
		if (es != null) 
		{
			try 
			{
				es.close();
			} catch (IOException e) 
			{
				e.printStackTrace();
				return false;
			}
		}
		return true;
	}
}
