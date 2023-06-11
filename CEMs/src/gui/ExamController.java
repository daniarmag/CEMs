package gui;

import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.ResourceBundle;

import javax.swing.JOptionPane;

import control.UserController;
import entities.Exam;
import javafx.application.Platform;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Node;
import javafx.scene.control.Button;
import javafx.scene.control.ScrollPane;
import javafx.scene.layout.VBox;

public class ExamController implements Initializable
{
	private static Exam onGoingExam;
	
	@FXML
	private ScrollPane scrollPane;
    @FXML
    private VBox questionContainer;
    @FXML 
    private Button start;
    
    private ArrayList<QuestionTemplateController> ansarry;
    
   
    public static void start(Exam exam, String string) throws  Exception{
    	onGoingExam = exam;
    	Platform.runLater(()->ScreenUtils.createNewStage("/gui/ExamScreen.fxml").show());
    }
    
	@FXML
	public void exit(ActionEvent event)
	{
		UserController.hide(event);
	}
	
    @FXML
    private void show(ActionEvent event){
    	
    	try {
    	if(ansarry!=null) {
    		System.out.println("check printing ");
    		for(int i=0;i<ansarry.size();i++)
    			System.out.println(ansarry.get(i).getQuestionText()+" "+ i );
    
    	}
    	}catch(Exception e) {e.printStackTrace(); System.out.println("controller not connected");}
    }
    
	/**
	 * @author czmat
	 * @param event
	 * this method load all the questions to the exam screen 
	 * and for each question add a controller so we can track the answer 
	 */
	 void activateExam() {
		int numberOfQuestions = getNumberOfQuestions(); // Retrieve the number of questions from user input or a data source
		ansarry=new ArrayList<>();
        for (int i = 0; i < numberOfQuestions; i++) {
            try {
                FXMLLoader loader = new FXMLLoader(getClass().getResource("/gui/QuestionTemplate.fxml"));
                Node questionComponent = loader.load();//this line must be before line @@@
                QuestionTemplateController controller = loader.getController();//@@@
                controller.questionHandler(onGoingExam.examQuestions.get(i));
                controller.setQuestionNumText("Question: " + (i+1));
                ansarry.add(controller);
                
               questionContainer.getChildren().add(questionComponent);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        scrollPane.setContent(questionContainer);
		
		
	}

	 int getNumberOfQuestions() {
		// TODO Auto-generated method stub
		return onGoingExam.getNum_questions();
	}

	 
	@Override
	public void initialize(URL location, ResourceBundle resources)
	{
		
		activateExam();
//			String input = JOptionPane.showInputDialog("Insert 4 digit password:");
//			validatePasswords(input);
	
	}

//	private void validatePasswords(String input) 
//	{
//		while(!input.equals(onGoingExam.getPassword()))
//				input = JOptionPane.showInputDialog("Wrong password! Insert 4 digit password:");
//
//		activateExam();
//	}




}
