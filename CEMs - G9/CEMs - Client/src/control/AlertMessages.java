package control;

import javax.swing.JOptionPane;
import javafx.application.Platform;

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
		Platform.runLater(() ->JOptionPane.showMessageDialog(null, message, title,JOptionPane.INFORMATION_MESSAGE));
	}
	
	/**
	 * makes an information alert
	 * @param message
	 * @param title
	 */
	public static void makeAlertNoPlatform(String message,String title) 
	{
		JOptionPane.showMessageDialog(null, message, title,JOptionPane.INFORMATION_MESSAGE);
	} 
	
	/**
	 * makes a decision alert
	 * @param message
	 * @param title
	 * @return YES/NO (integers)
	 */
	public static int makeDecisionAlert(String message,String title) 
	{
		return JOptionPane.showConfirmDialog(null, message, title, JOptionPane.YES_NO_OPTION);
	}
}
