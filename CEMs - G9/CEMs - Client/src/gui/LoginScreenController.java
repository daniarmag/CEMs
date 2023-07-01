package gui;

import java.io.IOException;
import java.util.ArrayList;
import client.ClientUI;
import control.UserController;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;

/**
 * A GUI for the login screen.
 */
public class LoginScreenController
{
	private static ActionEvent e;
	
    @FXML
    private Button exitBtn;

    @FXML
    private Button loginBtn;

    @FXML
    private PasswordField  txtLoginPassword;

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
    	ArrayList<String> info =  new ArrayList<>();
    	info.add("login");
    	info.add(txtLoginUsername.getText().trim());
    	info.add(txtLoginPassword.getText().trim());
    	e = event;
    	ClientUI.chat.accept(info);
    	
    }
    
    /*disconnects from the server and exits from the GUI. */
    @FXML
    void exit(ActionEvent event) 
    {
    	ClientUI.chat.accept("disconnected");
    	ClientUI.chat.quit();
    	System.exit(0);
    }
    
    /**
     * Hides the screen.
     * @throws Exception
     */
    public static void hideCurrentScene() throws Exception 
    {
    	try 
    	{
    		UserController.hide(e);
    	}
    	catch(Exception e){}
	}
}
