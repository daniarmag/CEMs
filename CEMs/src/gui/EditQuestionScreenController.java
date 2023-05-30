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
import javafx.scene.control.ToggleGroup;
import javafx.scene.text.Text;

public class EditQuestionScreenController implements Initializable
{
	public static User u;
	
	public static Question editQuestion;
	
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
    
    @FXML
    private Text questionIdText;

	/**
	 * Initializes the JavaFX controller during application startup.
	 * 
	 * @param primaryStage The primary stage of the application.
	 * @param user
	 * @throws Exception
	 */
	public static void start(User user, Question question) throws Exception 
	{
		editQuestion = question;
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
		ToggleGroup toggleGroup = new ToggleGroup();
	    aRadio.setToggleGroup(toggleGroup);
	    bRadio.setToggleGroup(toggleGroup);
	    cRadio.setToggleGroup(toggleGroup);
	    dRadio.setToggleGroup(toggleGroup);
		questionTextArea.setText(editQuestion.getQuestionText());
		questionIdText.setText("Edit question " + editQuestion.getId());
		aAnswerText.setText(editQuestion.getAnswers()[0]);
		bAnswerText.setText(editQuestion.getAnswers()[1]);
		cAnswerText.setText(editQuestion.getAnswers()[2]);
		dAnswerText.setText(editQuestion.getAnswers()[3]);
	}

}
