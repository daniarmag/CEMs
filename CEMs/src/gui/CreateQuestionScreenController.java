package gui;

import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.ResourceBundle;
import javax.swing.JOptionPane;

import client.ClientMessageHandler;
import client.ClientUI;
import control.UserController;
import entities.Question;
import entities.User;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.ListView;
import javafx.scene.control.MenuButton;
import javafx.scene.control.MenuItem;
import javafx.scene.control.RadioButton;
import javafx.scene.control.SelectionMode;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.scene.control.ToggleGroup;

public class CreateQuestionScreenController implements Initializable 
{
	public static User u;
	
	Question newQuestion = new Question(null, null, null, null, null, null, null, null);
	
    ArrayList<String> subjectsArr, coursesArr;
    
    public static Map<String, ArrayList<String>> teachingMap;
    
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

    @FXML
    private ListView<String> courseListview;

	public void setQuestionNumber(String number)
	{
		number = Integer.toString(Integer.parseInt(number) + 1);
		String newQuestionNum = String.format("%03d", Integer.parseInt(number));
		newQuestion.setQuestionNumber(newQuestionNum);
	}
	
	public void selectSubject(MenuItem m)
	{
		courseListview.getItems().clear();
		String selected = m.getText();
		subjectMenu.setText(selected);
		ArrayList<String> selectedValues = teachingMap.get(selected);
		courseListview.getItems().addAll(selectedValues);
	}

	@FXML
	void goBack(ActionEvent event) 
	{
		UserController.goBack(event, "/gui/QuestionBankScreen.fxml");
	}

	/**
	 * Initializes the JavaFX controller during application startup.
	 * 
	 * @param primaryStage The primary stage of the application.
	 * @param user
	 * @param teachingMap 
	 * @throws Exception
	 */
	public static void start(User user, Map<String, ArrayList<String>> map) throws Exception 
	{
		u = user;
		teachingMap =  map;
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
		String[] subjectId = subjectMenu.getText().split("\\s+");
		String[] answers = {aAnswerText.getText(), bAnswerText.getText(), 
							cAnswerText.getText(), dAnswerText.getText()};
		newQuestion.setSubject(subjectId[0]);
		newQuestion.setAnswers(answers);
		newQuestion.setId(subjectId[0] + newQuestion.getQuestionNumber());
		newQuestion.setQuestionText(questionTextArea.getText());
		newQuestion.setAuthor(u.getFirst_name() + " " + u.getLast_name());
		newQuestion.setProfessorId(u.getUser_id());
		HashMap <Boolean, String> answerMap = createAnswerMap(answers);
		newQuestion.setCorrectAnswer(answerMap.get(true));
	    ClientUI.chat.accept(newQuestion);
	    ArrayList<String> request = new ArrayList<>();
	    request.add("update question courses");
	    request.add(newQuestion.id);
	    request.addAll(courseListview.getSelectionModel().getSelectedItems());
	    ClientUI.chat.accept(request);
	    goBack(event);
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
		courseListview.getSelectionModel().setSelectionMode(SelectionMode.MULTIPLE);
		ToggleGroup toggleGroup = new ToggleGroup();
	    aRadio.setToggleGroup(toggleGroup);
	    bRadio.setToggleGroup(toggleGroup);
	    cRadio.setToggleGroup(toggleGroup);
	    dRadio.setToggleGroup(toggleGroup);
	    for (String s : teachingMap.keySet())
		{
	    	MenuItem m = new MenuItem(s);
			m.setOnAction(e -> selectSubject((MenuItem)e.getSource()));
			subjectMenu.getItems().add(m);
		}
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
	    errorMap.put(courseListview.getSelectionModel().getSelectedItems().isEmpty(), "Course(s) is required");
	    errorMap.put(subjectMenu.getText().isEmpty(), "Subject is required.");
	    return errorMap;
	}
}
