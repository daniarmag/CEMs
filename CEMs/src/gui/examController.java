
package gui;


import java.io.IOException;

import javafx.application.Platform;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.control.Button;
import javafx.scene.control.ScrollPane;
import javafx.scene.layout.VBox;

public class examController
{

	 @FXML
	    private ScrollPane scrollPane;
    @FXML
    private VBox questionContainer;
    @FXML 
    private Button start;
    
    
    
   
    public void start() throws  Exception{
    	Platform.runLater(()->ScreenUtils.createNewStage("/gui/examScreen.fxml").show());
    	
    }
    
    
    
	@FXML
	 void init(ActionEvent event) {
		int numberOfQuestions = getNumberOfQuestions(); // Retrieve the number of questions from user input or a data source

        for (int i = 0; i < numberOfQuestions; i++) {
            try {
                FXMLLoader loader = new FXMLLoader(getClass().getResource("/gui/question_template.fxml"));
                Node questionComponent = loader.load();
                questionContainer.getChildren().add(questionComponent);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        scrollPane.setContent(questionContainer);
		
		
	}

	 int getNumberOfQuestions() {
		// TODO Auto-generated method stub
		return 4;
	}

}
