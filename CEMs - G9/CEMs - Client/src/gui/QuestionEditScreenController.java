package gui;

import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.ResourceBundle;
import client.ClientUI;
import control.AlertMessages;
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

/**
 * A GUI for editing question.
 */
public class QuestionEditScreenController implements Initializable
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
    
    @FXML
    private Text idTXT;

    @FXML
    private Text nameTXT;

	/**
	 * Initializes the JavaFX controller during application startup.
	 * @param user
	 * @param question
	 * @throws Exception
	 */
	public static void start(User user, Question question) throws Exception 
	{
		editQuestion = question;
		u = user;
		ScreenUtils.createNewStage("/gui/QuestionEditScreen.fxml").show();
	}

    /**
	 * Initializes the GUI with the given logic.
	 * @param location
	 * @param resources
	 */
	@Override
	public void initialize(URL location, ResourceBundle resources) 
	{
		ToggleGroup toggleGroup = new ToggleGroup();
	    aRadio.setToggleGroup(toggleGroup);
	    bRadio.setToggleGroup(toggleGroup);
	    cRadio.setToggleGroup(toggleGroup);
	    dRadio.setToggleGroup(toggleGroup);
	    nameTXT.setText(u.get_fullName());
		idTXT.setText(u.getUser_id());
		questionTextArea.setText(editQuestion.getQuestionText());
		questionIdText.setText("Edit question " + editQuestion.getId());
		aAnswerText.setText(editQuestion.getAnswers()[0]);
		bAnswerText.setText(editQuestion.getAnswers()[1]);
		cAnswerText.setText(editQuestion.getAnswers()[2]);
		dAnswerText.setText(editQuestion.getAnswers()[3]);
		toggleGroup.getToggles().get(Integer.parseInt(editQuestion.correctAnswer) - 1).setSelected(true);
	}
	
	/**
	 * Exits from client GUI - disconnectes from DB aswell.
	 * @param event
	 */
    @FXML
    void exit(ActionEvent event)
    {
    	UserController.userExit(u);
    }
    
    /**
	 * Goes back to QuestionBankScreen.
	 * @param event
	 */
    @FXML
    void goBack(ActionEvent event) 
    {
    	UserController.goBack(event, "/gui/QuestionBankScreen.fxml");
    }

    /**
	 * A method that submits the question to the DB if no errors occurred.
	 * @param event
	 */
    @FXML
    void submit(ActionEvent event) 
    {
    	HashMap<Boolean, String> errorMap = createErrorMap();
		if (errorMap.containsKey(true))
		{
			AlertMessages.makeAlert(errorMap.get(true), "Edit Question");
		    return;
		}
		HashMap <Boolean, String> answerMap = createAnswerMap();
	    ArrayList<String> request = new ArrayList<>();
	    request.add("update question");
	    request.add(editQuestion.getId());
	    request.add(questionTextArea.getText());
	    request.add(answerMap.get(true));
	    request.add(aAnswerText.getText());
	    request.add(bAnswerText.getText());
	    request.add(cAnswerText.getText());
	    request.add(dAnswerText.getText());
	    ClientUI.chat.accept(request);
	    goBack(event);
    }

	/**
	 * @return an answer map, where the only true key is the selected radio
	 */
	private HashMap<Boolean, String> createAnswerMap() 
	{
	    HashMap<Boolean, String> answerMap = new HashMap<>();
	    answerMap.put(aRadio.isSelected(), "1");
	    answerMap.put(bRadio.isSelected(), "2");
	    answerMap.put(cRadio.isSelected(), "3");
	    answerMap.put(dRadio.isSelected(), "4");
	    return answerMap;
	}
	
	/**
	 * @return a map with all kinds of error messages
	 */
	private HashMap<Boolean, String> createErrorMap() 
	{
	    HashMap<Boolean, String> errorMap = new HashMap<>();
	    errorMap.put(!aRadio.isSelected() && !bRadio.isSelected()
	              && !cRadio.isSelected() && !dRadio.isSelected(), "Select the correct answer.");
	    errorMap.put(aAnswerText.getText().isEmpty() || aAnswerText.getText().isEmpty() ||
	                 cAnswerText.getText().isEmpty() || dAnswerText.getText().isEmpty(), 
	                 "All answer options are required.");
	    errorMap.put(questionTextArea.getText().isEmpty(), "Question is required.");
	    return errorMap;
	}
}
