package gui;

import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;
import javax.swing.JOptionPane;
import client.ClientUI;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;
import javafx.stage.Stage;

/*A GUI for when the client needs to enter the host IP */
public class HostSelectionScreenController implements Initializable 
{
    @FXML
    private Button connectToServerBtn;

    @FXML
    private Button exitBtn;

    @FXML
    private TextField txtServerIP;

    /**
     * @return The IP address entered in the text field as a string.
     */
    private String getIP() 
    {
  		return txtServerIP.getText();
  	}
  	
    /**
     * Initializes the JavaFX controller during application startup.
     *
     * @param primaryStage The primary stage of the application.
     * @throws Exception If an exception occurs during initialization.
     */
    public void start(Stage primaryStage) throws Exception
    {	
    	FXMLLoader loader = new FXMLLoader();
		loader.setLocation(getClass().getResource("/gui/HostSelectionScreen.fxml"));
		Parent root = loader.load();
		WindowUtils.enableWindowDraggable(root, primaryStage);
		Scene scene = new Scene(root);
		primaryStage.setTitle("Server Connection");
		primaryStage.setScene(scene);
		primaryStage.show();	   
	}
    
    /**
     * Handles the connect button click event.
     *
     * @param event The action event triggered by the connect button.
     * @throws IOException If an I/O exception occurs.
     */
    @FXML
    void connect(ActionEvent event) throws IOException 
    {
    	FXMLLoader loader = new FXMLLoader();
    	String IP = getIP().trim();
    	// A case for invalid IP
    	if(IP.isEmpty())
    		JOptionPane.showMessageDialog(null, "You must enter server IP!", "Connect to Server", JOptionPane.INFORMATION_MESSAGE);
    	else
    	{	
    		ClientUI.chat.accept(IP);
    		if(!IP.equals("localhost") && !IP.equals("127.0.0.1"))
    		{
    			JOptionPane.showMessageDialog(null, "Wrong IP!", "Connect to Server", JOptionPane.INFORMATION_MESSAGE);
    		}
    		else
    		{
    			//notify ClientUI that a successful connection has been established.
    			ClientUI.chat.accept("connected");
    	        // Hide the current window
    			((Node)event.getSource()).getScene().getWindow().hide();
    	        // Create a new stage for the login screen
    			Stage primaryStage = new Stage();
    			loader.setLocation(getClass().getResource("/gui/LoginScreen.fxml"));
    			Parent root = loader.load();
    			WindowUtils.enableWindowDraggable(root, primaryStage);
    			Scene scene = new Scene(root);
    			primaryStage.setTitle("Login");
    			primaryStage.setScene(scene);
    			primaryStage.show();	
    		}
    	}	
    }
    
    /**
     * Handles the exit button click event.
     *
     * @param event The action event triggered by the exit button.
     */

    @FXML
    void exit(ActionEvent event) 
    {
    	System.exit(0);	
    }

    /**
     * Initializes the controller during application startup.
     *
     * @param location  The location used to resolve relative paths.
     * @param resources The resources used to localize the root object.
     */
	@Override
	public void initialize(URL location, ResourceBundle resources) 
	{
		txtServerIP.setText("localhost");
	}
}
