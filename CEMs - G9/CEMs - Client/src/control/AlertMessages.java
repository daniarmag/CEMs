package control;

import java.util.Optional;
import javafx.application.Platform;
import javafx.scene.control.Alert;
import javafx.scene.control.ButtonType;

/**
 * Class that handles JOptionPane alerts used for Adapter Pattern Design
 */
public class AlertMessages 
{
	/**
	 * makes an information alert
	 * @param message
	 * @param title
	 */
	public static void makeAlert(String message,String title) 
	{
		Platform.runLater(() -> makeAlertNoPlatform(message, title));
	}
	
	/**
	 * makes an information alert
	 * @param message
	 * @param title
	 */
	public static void makeAlertNoPlatform(String message,String title) 
	{
		Alert alert = new Alert(Alert.AlertType.INFORMATION);
		localAlertMaker(alert, message, title);
		alert.showAndWait();
	} 
	
	/**
	 * makes a decision alert
	 * @param message
	 * @param title
	 * @return YES/NO (booleans)
	 */
	public static boolean makeDecisionAlert(String message,String title) 
	{
		Alert alert = new Alert(Alert.AlertType.CONFIRMATION);
        localAlertMaker(alert, message, title);
        // Add buttons for "Yes" and "No"
        ButtonType buttonTypeYes = new ButtonType("Yes");
        ButtonType buttonTypeNo = new ButtonType("No");
        alert.getButtonTypes().setAll(buttonTypeYes, buttonTypeNo);
        // Show the confirmation alert and wait for user input
        Optional<ButtonType> result = alert.showAndWait();
        return result.isPresent() && result.get() == buttonTypeYes;
	}
	
	/**
	 * @param alert
	 * @param message
	 * @param title
	 */
	public static void localAlertMaker(Alert alert, String message, String title)
	{
		alert.setTitle(title);
		alert.setHeaderText(null);
		alert.setContentText(message);
	}
}
