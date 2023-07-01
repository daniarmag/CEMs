package control;

import javafx.scene.control.Alert;

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
		
		Alert alert = new Alert(Alert.AlertType.INFORMATION);
		localAlertMaker(alert, message, title);
		alert.showAndWait();
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
