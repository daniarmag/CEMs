package gui;

import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.ResourceBundle;
import client.ClientMessageHandler;
import client.ClientUI;
import control.AlertMessages;
import control.UserController;
import entities.Question;
import entities.User;
import entities.Professor;
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
import javafx.scene.text.Text;

/**
 * A GUI for question creation.
 */
public class QuestionCreationScreenController implements Initializable 
{
	public static User u;
	
	Question newQuestion = new Question(null, null, null, null, null, null, null, null);
	
    ArrayList<String> subjectsArr, coursesArr;
    
    public static Map<String, ArrayList<String>> teachingMap;
    
    @FXML
    private Text idTXT;

    @FXML
    private Text nameTXT;
    
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

    /**
	 * Initializes the JavaFX controller during application startup.
	 * @param user
	 * @param map
	 * @throws Exception
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public static void start(User user) throws Exception 
	{
		u = user;
		teachingMap = ((Professor)user).getMap();
		ScreenUtils.createNewStage("/gui/QuestionCreationScreen.fxml").show();
	}

	/**
	 * Initializes the GUI with the given logic.
	 * @param location
	 * @param resources
	 */
	@Override
	public void initialize(URL location, ResourceBundle resources) 
	{
		ClientMessageHandler.setCreateQuestionScreenController(this);
		courseListview.getSelectionModel().setSelectionMode(SelectionMode.MULTIPLE);
		//Creating a toggle group here to so only one radio button can be selected.
		ToggleGroup toggleGroup = new ToggleGroup();
	    aRadio.setToggleGroup(toggleGroup);
	    bRadio.setToggleGroup(toggleGroup);
	    cRadio.setToggleGroup(toggleGroup);
	    dRadio.setToggleGroup(toggleGroup);
		nameTXT.setText(u.get_fullName());
		idTXT.setText(u.getUser_id());
	    //Populating subjectmenu.
	    for (String s : teachingMap.keySet())
		{
	    	MenuItem m = new MenuItem(s);
			m.setOnAction(e -> selectSubject((MenuItem)e.getSource()));
			subjectMenu.getItems().add(m);
		}
	}
	
	/**
	 * Exits from client GUI - disconnects from DB aswell.
	 * @param event
	 */
	@FXML
	public void exit(ActionEvent event)
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
	public void submit(ActionEvent event)
	{
		HashMap<Boolean, String> errorMap = createErrorMap();
		if (errorMap.containsKey(true))
		{
			AlertMessages.makeAlert(errorMap.get(true), "Question Creation");
		    return;
		}
		buildQuestion();
	    ClientUI.chat.accept(newQuestion);
	    ArrayList<String> request = new ArrayList<>();
	    request.add("update question courses");
	    request.add(newQuestion.id);
	    request.addAll(courseListview.getSelectionModel().getSelectedItems());
	    ClientUI.chat.accept(request);
	    goBack(event);
	}
	
	/**
	 * This method builds the question from the information within the controller.
	 */
	public void buildQuestion()
	{
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
		HashMap <Boolean, String> answerMap = createAnswerMap();
		newQuestion.setCorrectAnswer(answerMap.get(true));
	}
	
	/**
	 * Setter.
	 * @param number
	 */
	public void setQuestionNumber(String number)
	{
		number = Integer.toString(Integer.parseInt(number) + 1);
		String newQuestionNum = String.format("%03d", Integer.parseInt(number));
		newQuestion.setQuestionNumber(newQuestionNum);
	}
	
	/**
	 * Handles the logic of when a subject was selected from the menubutton.
	 * @param m
	 */
	public void selectSubject(MenuItem m)
	{
		courseListview.getItems().clear();
		String selected = m.getText();
		subjectMenu.setText(selected);
		ArrayList<String> selectedValues = teachingMap.get(selected);
		courseListview.getItems().addAll(selectedValues);
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
	    errorMap.put(courseListview.getSelectionModel().getSelectedItems().isEmpty(), "Course(s) is required");
	    errorMap.put(subjectMenu.getText().isEmpty(), "Subject is required.");
	    return errorMap;
	}
}
