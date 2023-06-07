package gui;

import java.util.ArrayList;
import java.util.Map;

import control.TimerController;
import control.UserController;
import entities.Exam;
import entities.User;
import javafx.application.Platform;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;
import javafx.scene.text.Text;

public class ManualExamController {
	public static User u;
	public static Exam e;
	static Integer minutesLeft;
	boolean oneMinuteFlag = false;


    @FXML
    private Button DeleteBtn;

    @FXML
    private Button DownloadBtn;

    @FXML
    private TextField FileUploadTXT;

    @FXML
    private Button SubmitBtn;

    @FXML
    private Button UploadBtn;

    @FXML
    private Button exitBtn;

    @FXML
    private Button goBackBtn;

    @FXML
    private Text welcomeText;
    
    @FXML
    private TextField TimerTXT;

    public static void start(User user, Exam exam) throws Exception 
	{
		u = user;
		e = exam;
		Platform.runLater(()-> ScreenUtils.createNewStage("/gui/QuestionBankScreen.fxml").show());
	}
    @FXML
    void DeleteBtn(ActionEvent event) {

    }

    @FXML
    void DownloadBtn(ActionEvent event) {
    	//System.out.println(startCountdown());	
    }

    @FXML
    void SubmitBtn(ActionEvent event) {

    }

    @FXML
    void UploadBtn(ActionEvent event) {

    }

    /*Disconnects from the server and closes GUI window.*/
   	@FXML
   	void exit(ActionEvent event) 
   	{
   		UserController.userExit(u);
   	}

	@FXML
	void goBack(ActionEvent event) 
	{	
		UserController.goBack(event, "/gui/StudentExamScreen.fxml");
	}
	
//	int startCountdown() {
//		TimerController timerController = new TimerController(u.getUser_id(), e.time);
//		return timerController.getRemainingTime();
//	}
}
