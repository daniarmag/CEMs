package gui;

import java.io.IOException;
import java.util.ArrayList;
import client.ClientUI;
import javafx.application.Platform;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.Node;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;


/*A GUI for the login screen.*/
public class LoginScreenController
{
	private static ActionEvent e;
	
    @FXML
    private Button exitBtn;

    @FXML
    private Button loginBtn;

    @FXML
    private TextField txtLoginPassword;

    @FXML
    private TextField txtLoginUsername;
    
    /**
     * Logs the user into the system and opens the next screen. 
     * @param event
     * @throws IOException
     */
    @FXML
    void Login(ActionEvent event) throws IOException 
    {
    	//FXMLLoader loader = new FXMLLoader();
    	ArrayList<String> info =  new ArrayList<>();
    	info.add("LoggedIn");
    	info.add(txtLoginUsername.getText().trim());
    	info.add(txtLoginPassword.getText().trim());
    	e = event;
    	ClientUI.chat.accept(info);
    	
    }
    
    public static void hideCurrentScene() throws Exception 
    {
	    Platform.runLater(new Runnable() 
	    {
	        @Override
	        public void run() 
	        {
	            ((Node)e.getSource()).getScene().getWindow().hide();
	        }
	    });
	}

    /*disconnects from the server and exits from the GUI. */
    @FXML
    void exit(ActionEvent event) 
    {
    	ClientUI.chat.accept("disconnected");
    	ClientUI.chat.quit();
    	System.exit(0);
    }
}
