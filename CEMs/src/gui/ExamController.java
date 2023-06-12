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
import javafx.scene.text.Text;

public class ExamController implements Initializable
{
	public static Exam onGoingExam;
	
	private static User u;
	
	public static ActionEvent e;
	
	public static Timer timer = new Timer();
	
	Integer minutesLeft;
	
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
				e = event;
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
                controller.setQuestionNumText("Question " + (i+1));
                ansarry.add(controller);
                
               questionContainer.getChildren().add(questionComponent);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        scrollPane.setContent(questionContainer);
        startCountdown();
	}
	 
	/**
	* This method closes the current window.
	*/
	public void closeWindow() 
	{
		UserController.goBack(e, "/gui/StudentScreen.fxml");
	}

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
	 
	@Override
	public void initialize(URL location, ResourceBundle resources)
	{
		if (u.getRole().equals("professor"))
			activateExam();
		else {
			ClientMessageHandler.setExamController(this);
			minutesLeft = onGoingExam.getTime();
		}
	}
	
	public void startCountdown() {
		TimerTask task = new TimerTask() {
			@Override
	        public void run() {
				minutesLeft--;
	            timerTXT.setText(minutesLeft.toString());
	            if (minutesLeft == 0) 
	            	timer.cancel();
	        }
		};
		// Schedule the task to run every minute
		timer.schedule(task, 0, 60_000);
	}
}
