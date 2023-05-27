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
import javafx.scene.control.MenuButton;
import javafx.scene.control.MenuItem;
import javafx.scene.control.RadioButton;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.scene.control.ToggleGroup;
import message.ClientMessageHandler;

public class CreateQuestionScreenController implements Initializable 
{
	public static User u;
	
	Question newQuestion = new Question(null, null, null, null, null, null, null, null);
	
    ArrayList<String> subjectsArr;
	
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
	private Button goBackBtn;

	@FXML
	private TextArea questionTextArea;

	@FXML
	private MenuButton subjectMenu;

	@FXML
	private Button submitBtn;

	public void setSubjects(ArrayList<String> subjects)
	{
		  subjectsArr = subjects;
		  for (String s : subjectsArr)
		  {
			  MenuItem m = new MenuItem(s);
			  m.setOnAction(e -> selectSubject((MenuItem)e.getSource()));
			  subjectMenu.getItems().add(m);
		  }
	}
	
	public void setQuestionNumber(int number)
	{
		newQuestion.setQuestionNumber(number);
	}
	
	public void selectSubject(MenuItem m)
	{
		String selected = m.getText();
		subjectMenu.setText(selected);
	}
	
	@FXML
	void goBack(ActionEvent event) 
	{
		
		UserController.Hide(event);
		ScreenUtils.createNewStage("/gui/ProfessorScreen.fxml").show();
	}

	/**
	 * Initializes the JavaFX controller during application startup.
	 * 
	 * @param primaryStage The primary stage of the application.
	 * @param user
	 * @throws Exception
	 */
	public static void start(User user) throws Exception 
	{
		u = user;
		ScreenUtils.createNewStage("/gui/CreateQuestionScreen.fxml").show();
	}
	
	@FXML
	public void submit(ActionEvent event)
	{
		HashMap<Boolean, String> errorMap = createErrorMap();
		if (errorMap.containsKey(true))
		{
			JOptionPane.showMessageDialog(null, errorMap.get(true), "Question Creation", JOptionPane.INFORMATION_MESSAGE);
		    return;
		}
		ClientUI.chat.accept("get amount of questions");
		String[] subject = subjectMenu.getText().split("\\s+");
		String[] answers = {aAnswerText.getText(), bAnswerText.getText(), 
							cAnswerText.getText(), dAnswerText.getText()};
		newQuestion.setSubject(subject[0]);
		newQuestion.setAnswers(answers);
		newQuestion.setId(subject[0] + newQuestion.getQuestionNumber());
		newQuestion.setQuestionText(questionTextArea.getText());
		newQuestion.setProfessorFirstName(u.getFirst_name());
		newQuestion.setProfessorLastName(u.getLast_name());
		HashMap <Boolean, String> answerMap = createAnswerMap(answers);
		newQuestion.setCorrectAnswer(answerMap.get(true));
		ClientUI.chat.accept(newQuestion);
	}
	
	@FXML
	public void exit(ActionEvent event)
	{
		UserController.userExit(u);
	}

	@Override
	public void initialize(URL location, ResourceBundle resources) 
	{
		ClientMessageHandler.setCreateQuestionScreenController(this);
		ToggleGroup toggleGroup = new ToggleGroup();
	    aRadio.setToggleGroup(toggleGroup);
	    bRadio.setToggleGroup(toggleGroup);
	    cRadio.setToggleGroup(toggleGroup);
	    dRadio.setToggleGroup(toggleGroup);
		ArrayList<String> request = new ArrayList<String>();
		request.add("find professor subjects");
		request.add(u.getUser_id());
		ClientUI.chat.accept(request);	
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
	    errorMap.put(subjectMenu.getText().isEmpty(), "Subject is required.");
	    return errorMap;
	}

}
