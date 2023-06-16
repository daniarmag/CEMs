package gui;

import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;
import client.ClientUI;
import control.AlertMessages;
import control.UserController;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;
import javafx.stage.Stage;

/*A GUI for when the client needs to enter the host IP */
public class HostSelectionScreenController implements Initializable 
{
	public static int DEFAULT_PORT = 5555;
	
	@FXML
	private Button connectToServerBtn;

	@FXML
	private Button exitBtn;

	@FXML
	private TextField txtServerIP;

	/**
	 * Initializes the JavaFX controller during application startup.
	 * @param primaryStage
	 * @throws Exception
	 */
	public void start(Stage primaryStage) throws Exception 
	{
		ScreenUtils.createNewStage("/gui/HostSelectionScreen.fxml").show(); 
	}
	
	/**
	 * Initializes the controller during application startup.
	 * @param location  The location used to resolve relative paths.
	 * @param resources The resources used to localize the root object.
	 */
	@Override
	public void initialize(URL location, ResourceBundle resources) 
	{
		//txtServerIP.setText(InetAddress.getLocalHost().getHostAddress());
		txtServerIP.setText("localhost");
	}
	
	/**
	 * Handles the exit button click event.
	 * @param event The action event triggered by the exit button.
	 */
	
	@FXML
	void exit(ActionEvent event) 
	{
		System.exit(0);
	}
	
	/**
	 * Handles the connect button click event.
	 * @param event The action event triggered by the connect button.
	 * @throws IOException If an I/O exception occurs.
	 */
	@FXML
	void connect(ActionEvent event) throws IOException 
	{
		String IP = getIP().trim();
		// A case for invalid IP
		if (IP.isEmpty())
			AlertMessages.makeAlert("You must enter server IP!", "Connect to Server");
		else 
		{
			//Server IP is correct AND server is running.
			if(ClientUI.connect(IP, DEFAULT_PORT))
			{
				//notify ClientUI that a successful connection has been established.
				ClientUI.chat.accept("connected");		
				UserController.hide(event);
				ScreenUtils.createNewStage("/gui/LoginScreen.fxml").show();
			}
			//Wrong IP OR server is not running.
			else
			{
				AlertMessages.makeAlert("Couldn't connect to server.", "Connect to Server");
				System.exit(0);
			}
		}
	}
	
	/**
	 * @return The IP address entered in the text field as a string.
	 */
	private String getIP() 
	{
		return txtServerIP.getText();
	}
}
