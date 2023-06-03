
package gui;


import java.io.IOException;
import java.util.ArrayList;

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
    
    private ArrayList<question_templateController> ansarry;
    
   
    public void start() throws  Exception{
    	Platform.runLater(()->ScreenUtils.createNewStage("/gui/examScreen.fxml").show());
    	
    }
    
    
    @FXML
    private void show(ActionEvent event){
    	
    	try {
    	if(ansarry!=null) {
    		System.out.println("check printing ");
    		for(int i=0;i<ansarry.size();i++)
    			System.out.println(ansarry.get(i).getQuestiontest()+" "+ i );
    
    	}
    	}catch(Exception e) {e.printStackTrace(); System.out.println("controller not connected");}
    }
    
	/**
	 * @author czmat
	 * @param event
	 * this method load all the questions to the exam screen 
	 * and for each question add a controller so we can track the answer 
	 */
	@FXML
	 void init(ActionEvent event) {
		int numberOfQuestions = getNumberOfQuestions(); // Retrieve the number of questions from user input or a data source
		ansarry=new ArrayList<>();
        for (int i = 0; i < numberOfQuestions; i++) {
            try {
                FXMLLoader loader = new FXMLLoader(getClass().getResource("/gui/question_template.fxml"));
                Node questionComponent = loader.load();//this line must be before line @@@
                question_templateController contorller =loader.getController();//@@@
                System.out.println(contorller.hashCode());
                ansarry.add(contorller);
                
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
