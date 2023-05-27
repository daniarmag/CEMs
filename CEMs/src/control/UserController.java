package control;

import java.util.ArrayList;
import client.ClientUI;
import entities.User;
import javafx.application.Platform;
import javafx.event.ActionEvent;
import javafx.scene.Node;

public class UserController 
{
	/**
	 * Logs out the user.
	 * @param user
	 */
	public static void logoutUser(User user)
	{
		ArrayList<String> logoutUser = new ArrayList<String>();
		logoutUser.add("logout");
		logoutUser.add(user.getUser_id());
		ClientUI.chat.accept(logoutUser);
	}
	
	/**
	 * If the user force exits the window, he must also be logged out.
	 * @param user
	 */
	public static void userExit(User user)
	{
		logoutUser(user);
		ClientUI.chat.accept("disconnected");
    	ClientUI.chat.quit();
    	System.exit(0);
	}
	
	public static void Hide(ActionEvent e)
	{
		  Platform.runLater(()->((Node)e.getSource()).getScene().getWindow().hide());	  
	}	
}
