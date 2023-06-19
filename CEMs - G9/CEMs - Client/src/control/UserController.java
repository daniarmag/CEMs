package control;

import java.util.ArrayList;
import client.ClientUI;
import entities.User;
import gui.ScreenUtils;
import javafx.application.Platform;
import javafx.event.ActionEvent;
import javafx.scene.Node;
import javafx.stage.Stage;

/**
 * This class is responsible for some common user activities.
 */
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
	
	/**
	 * This method allows classes that are not a part of javafx to load 
	 * and use GUIs. In this case we hide the current window.
	 * @param e
	 */
	public static void hide(ActionEvent e)
	{
		Platform.runLater(()->((Node)e.getSource()).getScene().getWindow().hide());	  
	}	
	
	/**
	 * This method allows classes that are not a part of javafx to load 
	 * and use GUIs. In this case we we show the desired window (e).
	 * @param e
	 */
	public static void show(ActionEvent e) 
	{
	    Platform.runLater(() -> ((Stage) ((Node) e.getSource()).getScene().getWindow()).show());
	}
	
	/**
	 * This method allows classes that are not a part of javafx to load 
	 * and use GUIs. In this case we we close the desired window (e).
	 * @param e
	 */
	public static void close(ActionEvent e) 
	{
	    Platform.runLater(() -> 
	    {
	        Stage currentStage = (Stage) ((Node) e.getSource()).getScene().getWindow();
	        currentStage.close();
	    });
	}

	/**
	 * Moving back to the previous screen.
	 * @param e
	 * @param screen
	 */
	public static void goBack(ActionEvent e, String screen)
	{
		hide(e);
		ScreenUtils.createNewStage(screen).show();	  
	}
}
