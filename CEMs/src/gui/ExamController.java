package gui;

import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.ResourceBundle;
import control.AlertMessages;
import control.UserController;
import entities.Exam;
import entities.User;
import javafx.application.Platform;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Node;
import javafx.scene.control.Button;
import javafx.scene.control.ScrollPane;
import javafx.scene.control.TextField;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

public class ExamController implements Initializable
{
	private static Exam onGoingExam;
	
	private static User u;
	
    @FXML
    private TextField idTextField;
    
	@FXML
	private ScrollPane scrollPane;
    @FXML
    private VBox questionContainer;
    @FXML 
    private Button start;
    
    private ArrayList<QuestionTemplateController> ansarry;
    
   
    public static void start(Exam exam, User user) throws  Exception
    {
    	onGoingExam = exam;
    	u = user;
    	Platform.runLater(()->ScreenUtils.createNewStage("/gui/ExamScreen.fxml").show());
    }
    
	@FXML
	public void exit(ActionEvent event)
	{
		UserController.hide(event);
	}
	
	@FXML
	public void enter(ActionEvent event)
	{
		if (u.getRole().equals("student"))
		{
			if(idTextField.getText().trim().equals(u.getUser_id()))
			{
				AlertMessages.makeAlert("Good luck!", "Exam");
				activateExam();
			}
			else
				AlertMessages.makeAlert("Wrong ID!", "Exam");	
		}
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
	 
	/**
	* This method closes the current window.
	*/
	public void closeWindow() 
	{
		Platform.runLater(() -> 
		{
	    	Stage stage = (Stage) start.getScene().getWindow();
	    	stage.close();
		});
	}

	 int getNumberOfQuestions() 
	 {
		return onGoingExam.getNum_questions();
	 }

	 
	 
	@Override
	public void initialize(URL location, ResourceBundle resources)
	{
		if (u.getRole().equals("professor"))
			activateExam();
	}
}
