package control;

import javax.swing.JOptionPane;

public class AlertMessages {

	public static void makeAlert(String message,String title) {
		JOptionPane.showMessageDialog(null, message, title,JOptionPane.INFORMATION_MESSAGE);
	}
	
}
