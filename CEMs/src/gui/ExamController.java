package gui;

import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.ResourceBundle;
import java.util.Timer;
import java.util.TimerTask;
import javax.swing.JOptionPane;
import client.ClientMessageHandler;
import client.ClientUI;
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
	Integer minutesLeft, secondsLeft = 1, actualTime = 0;
	
	private boolean startedExamFlag = false;
	
	private ArrayList<QuestionTemplateController> ansarry;
	
	private static User u;
	
	public static Exam onGoingExam;
	
	public static ActionEvent savedEvent;
	
	public static Timer timer = new Timer();

    @FXML
    private Text welcomeText;
    
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
    private Button submitBtn;
    
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
		welcomeText.setText(onGoingExam.getExam_name());
		submitBtn.setDisable(true);
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
			int res = AlertMessages.makeDecisionAlert
					("Are you sure you want to exit the exam? All progress will be lost.", "Exit Exam");
			if (res == JOptionPane.YES_OPTION)
				if(startedExamFlag) autoSubmit("finished exam");
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
				startedExamFlag = true;
				enterBtn.setDisable(true);
				idTextField.setDisable(true);
				savedEvent = event;
				submitBtn.setDisable(false);
			}
			else
				AlertMessages.makeAlert("Wrong ID!", "Exam");	
		}
	}
	
	/**
	 * Submits the request to the server.
	 * @param event
	 */
	@FXML
	public void submit(ActionEvent event)
	{
		if(!isAnyAnswerEmpty())
		{
			int res = AlertMessages.makeDecisionAlert
					("Are you sure you are ready to submit?", "Submit Exam");
			if (res == JOptionPane.YES_OPTION)
			{
				ArrayList<String> request = buildFinishedExam("finished exam");
				ClientUI.chat.accept(request);
				UserController.goBack(event, "/gui/StudentScreen.fxml");
				timer.cancel();
			}
		}
		else
			AlertMessages.makeAlert("You must answer all the questions!", "Submit Exam");
	}
	
	/**
	 * Automatically submits exam when time's up.
	 */
	public void autoSubmit(String req)
	{
		ArrayList<String> request = buildFinishedExam(req);
		ClientUI.chat.accept(request);
		Platform.runLater(() -> UserController.goBack(savedEvent, "/gui/StudentScreen.fxml"));
	}
    
	/**
	 * @return a finished exam
	 */
	public ArrayList<String> buildFinishedExam(String req)
	{
		//Array list that will be sent back to the server and uploaded to the DB.
		ArrayList<String> finishedExam = new ArrayList<>();
		StringBuilder correctAnswers = new StringBuilder();
		StringBuilder wrongAnswers = new StringBuilder();
		int grade = 0;
		finishedExam.add(req);
		finishedExam.add(onGoingExam.getExam_id());
		finishedExam.add(u.getUser_id());
		for (int i = 0; i < getNumberOfQuestions(); i++)
		{
			Question currQuestion = onGoingExam.getExamQuestions().get(i);
			//Retrieve the answer ("" if non was selected - for autoSubmit)
			String questionInExam = currQuestion.getCorrectAnswer();
			String answeredQuestion = ansarry.get(i).getSelectedAnswer();
			if (questionInExam.equals(answeredQuestion))
			{
				grade += Integer.parseInt(currQuestion.getScore());
				correctAnswers.append(currQuestion.getId()).append(",");
			}
			else
				//# sign to notify select wrong answer.
				wrongAnswers.append(currQuestion.getId()).append("#").append(answeredQuestion).append(",");
		}
		finishedExam.add(String.valueOf(grade));
		//Removing commas at the end of the string
		finishedExam.add(correctAnswers.toString().replaceAll(",$", ""));
		finishedExam.add(wrongAnswers.toString().replaceAll(",$", ""));
		finishedExam.add("0");
		finishedExam.add(onGoingExam.getTime().toString());
		finishedExam.add(String.valueOf(actualTime));
		return finishedExam;
	}
	
	/**
	 * @return array list full of exam statistics.
	 */
	public ArrayList<String> buildExamStats()
	{
		ArrayList<String> examStats = new ArrayList<>();
		return examStats;
	}
	
	/**
	 * @return true if any of the answers left unanswered.
	 */
	public boolean isAnyAnswerEmpty() 
	{
	    for (QuestionTemplateController q : ansarry) 
	        if (q.checkIfAnswersEmpty()) 
	            return true;
	    return false;
	}
	/**
	 * @param event
	 * this method load all the questions to the exam screen 
	 * and for each question add a controller so we can track the answer 
	 */
	void activateExam() 
	{
		ansarry = new ArrayList<>();
		for (int i = 0; i < getNumberOfQuestions(); i++) 
		{
			try 
			{
				//Load new question template (until number of questions in exam has been reached).
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
		if (u.getRole().equals("student"))	
		{
			ClientUI.chat.accept("count");
			startCountdown();
		}
			
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
	 * Sets exam time.
	 * @param time
	 */
	public void setTime(int time)
	{
		minutesLeft = time;
		onGoingExam.setTime(time);
		timerTXT.setText(String.valueOf(time));
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
	public void startCountdown() {
	    TimerTask task = new TimerTask() {
	        @Override
	        public void run() {
	            secondsLeft--;

	            // Calculate hours, minutes, and seconds
	            int hours = minutesLeft / 60;
	            int minutes = minutesLeft % 60;
	            int seconds = secondsLeft;

	            // Update the timer display
	            timerTXT.setText(String.format("%02d:%02d:%02d", hours, minutes, seconds));
	            
	            // Increment actualTime every minute
	            if (secondsLeft == 0) {
	                minutesLeft--;
	                actualTime++;
	                secondsLeft = 60;
	            }
	            if (minutesLeft == 0 && secondsLeft == 1) 
	            {
	            	secondsLeft--;
	            	timerTXT.setText(String.format("%02d:%02d:%02d", hours, minutes, secondsLeft));
	            	timer.cancel();
		            autoSubmit("unfinished exam");
		        }
	        }
	    };
	    // Schedule the task to run every second
	    timer.schedule(task, 0, 1000);
	}
}
