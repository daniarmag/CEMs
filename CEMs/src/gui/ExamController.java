package gui;

import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.ResourceBundle;
import java.util.Timer;
import java.util.TimerTask;

import javax.swing.JOptionPane;
import client.ClientMessageHandler;
import control.AlertMessages;
import control.UserController;
import entities.Exam;
import entities.Question;
import entities.User;
import javafx.application.Platform;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Node;
import javafx.scene.control.Button;
import javafx.scene.control.ScrollPane;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.scene.layout.VBox;
import javafx.scene.text.Text;

/**
 * Class that represents the computerized exam.
 */
public class ExamController implements Initializable
{
	Integer minutesLeft;
	
	private ArrayList<QuestionTemplateController> ansarry;
	
	private static User u;
	
	public static Exam onGoingExam;
	
	public static ActionEvent savedEvent;
	
	public static Timer timer = new Timer();

    @FXML
    private TextArea professorNotes;

    @FXML
    private TextArea studentNotes;
	
    @FXML
    private TextField idTextField;
    
    @FXML
    private Text timerTXT;
    
	@FXML
	private ScrollPane scrollPane;
	
    @FXML
    private VBox questionContainer;
    
    @FXML 
    private Button start;
    
    @FXML
    private Button enterBtn;
   
    /**
   	 * Initializes the JavaFX controller during application startup.
   	 * @param user
   	 * @param exam
   	 * @throws Exception
   	 */
    public static void start(Exam exam, User user) throws  Exception
    {
    	onGoingExam = exam;
    	u = user;
    	Platform.runLater(()->ScreenUtils.createNewStage("/gui/ExamScreen.fxml").show());
    }
    
    /**
	 * Initializes the GUI with the given logic.
	 * @param location
	 * @param resources
	 */
	@Override
	public void initialize(URL location, ResourceBundle resources)
	{
		studentNotes.setText(onGoingExam.getExaminees_notes());
		professorNotes.setText(onGoingExam.getProfessor_notes());
		if (u.getRole().equals("professor"))
			activateExam();
		else 
		{
			ClientMessageHandler.setExamController(this);
			professorNotes.setVisible(false);
			minutesLeft = onGoingExam.getTime();
		}
	}
	
	/**
	 * Exits the exam screen. Different functionality for student/professor.
	 * @param event
	 */
	@FXML
	public void exit(ActionEvent event)
	{
		if (u.getRole().equals("professor"))
			UserController.hide(event);
		else
		{
			int res = JOptionPane.showConfirmDialog(null, 
					"Are you sure you want to exit the exam? All progress will be lost.", "Exit Exam", 
					JOptionPane.YES_NO_OPTION);
			if (res == JOptionPane.YES_OPTION)
				UserController.goBack(event, "/gui/StudentScreen.fxml");
		}
	}
	
	/**
	 * Checks if the ID the student used is correct.
	 * @param event
	 */
	@FXML
	public void enter(ActionEvent event)
	{
		if (u.getRole().equals("student"))
		{
			if(idTextField.getText().trim().equals(u.getUser_id()))
			{
				AlertMessages.makeAlert("Good luck!", "Exam");
				activateExam();
				enterBtn.setDisable(true);
				idTextField.setDisable(true);
				savedEvent = event;
			}
			else
				AlertMessages.makeAlert("Wrong ID!", "Exam");	
		}
	}
    
	/**
	 * @param event
	 * this method load all the questions to the exam screen 
	 * and for each question add a controller so we can track the answer 
	 */
	void activateExam() {
		// Retrieve the number of questions from user input or a data source
		int numberOfQuestions = getNumberOfQuestions();
		ansarry = new ArrayList<>();
		for (int i = 0; i < numberOfQuestions; i++) 
		{
			try 
			{
				FXMLLoader loader = new FXMLLoader(getClass().getResource("/gui/QuestionTemplate.fxml"));
				Node questionComponent = loader.load();
				QuestionTemplateController controller = loader.getController();
				Question currentQuestion = onGoingExam.examQuestions.get(i);
				controller.questionHandler(currentQuestion);
				controller.setQuestionNumText("Question " + (i + 1) + " (" + currentQuestion.getScore() + " points)");
				ansarry.add(controller);
				questionContainer.getChildren().add(questionComponent);
			}
			catch (IOException e) {e.printStackTrace();}
		}
		scrollPane.setContent(questionContainer);
		startCountdown();
	}
	 
	/**
	* This method closes the current window.
	*/
	public void closeWindow() 
	{
		Platform.runLater(() -> UserController.goBack(savedEvent, "/gui/StudentScreen.fxml"));
	}

	
	/**
	 * @return amount of questions in exam
	 */
	int getNumberOfQuestions() 
	{
		return onGoingExam.getNum_questions();
	}

	    
	/**
     * @return the onGoingExam
	 */
	public Exam getOnGoingExam() 
	{
		return onGoingExam;
	}
	 
	/**
	 * Starts the timer for the exam.
	 */
	public void startCountdown() 
	{
		TimerTask task = new TimerTask() 
		{
			@Override
	        public void run()
			{
				minutesLeft--;
	            timerTXT.setText(minutesLeft.toString());
	            if (minutesLeft == 0) 
	            	timer.cancel();
	        }
		};
		//Schedule the task to run every minute
		timer.schedule(task, 0, 60_000);
	}
}
