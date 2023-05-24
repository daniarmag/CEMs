package gui;

import client.ClientUI;
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
