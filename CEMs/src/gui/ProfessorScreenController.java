package gui;

import java.io.IOException;
import client.ClientUI;
import javafx.application.Platform;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Button;


public class ProfessorScreenController {

    @FXML
    private Button createExamBtn;

    @FXML
    private Button createQstBtn;
    
	@FXML
	private Button exitBtn;
	
	
	/**
	 * Initializes the JavaFX controller during application startup.
	 *
	 * @param primaryStage The primary stage of the application.
	 * @throws Exception If an exception occurs during initialization.
	 */
	public static void start() throws Exception 
	{
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
}
