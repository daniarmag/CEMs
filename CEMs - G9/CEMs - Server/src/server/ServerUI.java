package server;

import java.io.IOException;
import javafx.application.Application;
import javafx.stage.Stage;
import serverGui.ServerScreenController;

/**
 * A main class for server-side
 */
public class ServerUI extends Application 
{
	final public static int DEFAULT_PORT = 5555;
	
	static EchoServer es;
	
	static MySQLController sqlController;
	
	/**
	 * @return instance of es
	 */
	public static EchoServer getEs() 
	{
		return es;
	}


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
	public void start(Stage primaryStage) throws Exception {
		ServerScreenController serverScreen = new ServerScreenController();
		serverScreen.start(primaryStage);
	}

	/**
	 * Starting the server.
	 * @param p
	 * @param URL
	 * @param username
	 * @param password
	 * @return
	 */
	public static boolean runServer(String p, String URL, String username, String password)
	{
	    int port = 0; // Port to listen on
	    try {
	    	sqlController=MySQLController.getInstance();
	    
	        port = Integer.parseInt(p); 
	    } catch (Throwable t) {
	        System.out.println("ERROR - Could not connect!");
	        return false;
	    }
	    if(sqlController.connectToDB(URL, username, password))
	    {
	    	 es = new EchoServer(port);
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

	/**
	 * @return bool for whether the server was closed successfully.
	 */
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
