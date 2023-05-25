package gui;

import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;

import client.ClientUI;
import entities.User;
import javafx.application.Platform;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.text.Text;


public class ProfessorScreenController implements Initializable 
{
	public static User u;
    @FXML
    private Button createExamBtn;

    @FXML
    private Button createQstBtn;
    
	@FXML
	private Button exitBtn;
	
    @FXML
    private Text welcomeText;
	
	
	/**
	 * Initializes the JavaFX controller during application startup.
	 *
	 * @param primaryStage The primary stage of the application.
	 * @throws Exception If an exception occurs during initialization.
	 */
	public static void start(User user) throws Exception 
	{
		u = user;
		Platform.runLater(new Runnable() 
		{
			@Override
			public void run() 
			{
				try 
			    {
					WindowUtils.createNewStage("/gui/ProfessorScreen.fxml", "Professor screen").show();
				} catch (IOException e) {} 
			}
		});
	}
	
	
	/*Exits the GUI window.*/
	   /*disconnects from the server and exits from the GUI. */
    @FXML
    void exit(ActionEvent event) 
    {
    	ClientUI.chat.accept("disconnected");
    	ClientUI.chat.quit();
    	System.exit(0);
    }


	@Override
	public void initialize(URL location, ResourceBundle resources) 
	{
		welcomeText.setText("Welcome back " + u.getFirst_name());
	}
}
