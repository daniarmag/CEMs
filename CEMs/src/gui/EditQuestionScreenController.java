package gui;

import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.ResourceBundle;

import javax.swing.JOptionPane;

import client.ClientUI;
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
    	HashMap<Boolean, String> errorMap = createErrorMap();
		if (errorMap.containsKey(true))
		{
			JOptionPane.showMessageDialog(null, errorMap.get(true), "Question Creation", JOptionPane.INFORMATION_MESSAGE);
		    return;
		}
		String[] answers = {aAnswerText.getText(), bAnswerText.getText(), 
				cAnswerText.getText(), dAnswerText.getText()};
		HashMap <Boolean, String> answerMap = createAnswerMap(answers);
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
		int i;
		for (i = 0; i < editQuestion.getAnswers().length; i++) 
		    if (editQuestion.getAnswers()[i].equals(editQuestion.correctAnswer)) 
		    	break;
		toggleGroup.getToggles().get(i).setSelected(true);
	}
	private HashMap<Boolean, String> createAnswerMap(String[] answers) 
	{
	    HashMap<Boolean, String> answerMap = new HashMap<>();
	    answerMap.put(aRadio.isSelected(), answers[0]);
	    answerMap.put(bRadio.isSelected(), answers[1]);
	    answerMap.put(cRadio.isSelected(), answers[2]);
	    answerMap.put(dRadio.isSelected(), answers[3]);
	    return answerMap;
	}
	
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
