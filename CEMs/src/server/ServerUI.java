package server;

import java.io.IOException;
import gui.ServerScreenController;
import javafx.application.Application;
import javafx.stage.Stage;


public class ServerUI extends Application {
	final public static int DEFAULT_PORT = 5555;
	static EchoServer es;

	public static EchoServer getEs() 
	{
		return es;
	}


	public static void main(String args[]) throws Exception {
		launch(args);
	}

	@Override
	public void start(Stage primaryStage) throws Exception {
		ServerScreenController serverScreen = new ServerScreenController();
		serverScreen.start(primaryStage);
	}

	public static boolean runServer(String p, String username, String password) {
	    int port = 0; // Port to listen on
	    try {
	        port = Integer.parseInt(p); 
	    } catch (Throwable t) {
	        System.out.println("ERROR - Could not connect!");
	        return false;
	    }
	    if(MySQLConnection.connectToDB(username, password))
	    {
	    	 es = new EchoServer(port, username, password);
	 	    try 
	 	    {
	 	        es.listen(); 
	 	        return true;
	 	    } catch (Exception ex) 
	 	    {
	 	    	ex.printStackTrace();
	 	        System.out.println("ERROR - Could not listen for clients!");
	 	        return false;
	 	    }
	    }
	    return false;
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
