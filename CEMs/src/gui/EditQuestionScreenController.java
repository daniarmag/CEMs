package gui;

import java.net.URL;
import java.util.ResourceBundle;

import control.UserController;
import entities.Question;
import entities.User;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.RadioButton;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;

public class EditQuestionScreenController implements Initializable
{
	public static User u;
	
	
	
    @FXML
    private TextField aAnswerText;

    @FXML
    private RadioButton aRadio;

    @FXML
    private TextField bAnswerText;

    @FXML
    private RadioButton bRadio;

    @FXML
    private TextField cAnswerText;

    @FXML
    private RadioButton cRadio;

    @FXML
    private TextField dAnswerText;

    @FXML
    private RadioButton dRadio;

    @FXML
    private Button exitBtn;

    @FXML
    private Button goBackBtn;

    @FXML
    private TextArea questionTextArea;

    @FXML
    private Button submitBtn;

	/**
	 * Initializes the JavaFX controller during application startup.
	 * 
	 * @param primaryStage The primary stage of the application.
	 * @param user
	 * @throws Exception
	 */
	public static void start(User user, Question question) throws Exception 
	{
		
		u = user;
		ScreenUtils.createNewStage("/gui/EditQuestionScreen.fxml").show();
	}
	
    @FXML
    void exit(ActionEvent event)
    {
    	UserController.userExit(u);
    }

    @FXML
    void goBack(ActionEvent event) 
    {
    	UserController.goBack(event, "/gui/QuestionBankScreen.fxml");
    }

    @FXML
    void submit(ActionEvent event) 
    {

    }

	@Override
	public void initialize(URL location, ResourceBundle resources) 
	{

	}

}
