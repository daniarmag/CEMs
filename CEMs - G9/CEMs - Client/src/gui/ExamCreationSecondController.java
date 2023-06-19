package gui;

import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.ResourceBundle;
import client.ClientMessageHandler;
import client.ClientUI;
import control.AlertMessages;
import control.UserController;
import entities.Exam;
import entities.Professor;
import entities.Question;
import entities.User;
import javafx.application.Platform;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.control.cell.TextFieldTableCell;
import javafx.scene.text.Text;

/**
 * A GUI for the for the first screen of exam creation.
 */
public class ExamCreationSecondController implements Initializable
{
	public static Professor<?, ?> u;
	
	public static ArrayList<Question> questionList = new ArrayList<>();
	
	public static ActionEvent e;
	
	public Exam newExam = new Exam(null, null, null, null, null, null, null, null, null, null, null, null);
	
	public boolean isInvalidScore = false;

    @FXML
    private Text totalScoreText;
    
	@FXML
	private Text idTXT;

	@FXML
    private Text nameTXT;

    @FXML
    private TextField minutesTextField;

    @FXML
    private TextField passwordTextField;

    @FXML
    private TextField examNameTextField;

    @FXML
    private TextArea profNotesTextArea;

    @FXML
    private TextArea studentNotesTextArea;
    
    @FXML
    private TableView<Question> questionTable = new TableView<>();
    
    @FXML
    private TableColumn<Question, String> questionIdCol;

    @FXML
    private TableColumn<Question, String> scoreCol;

    /**
	 * Initializes the JavaFX controller during application startup.
	 * @param user
	 * @param info
	 * @param event
	 * @throws Exception
	 */
	public static void start(User user, ArrayList<Question> info, ActionEvent event) throws Exception 
	{
		u = (Professor<?, ?>)user;
		questionList = info;
		e = event;
		Platform.runLater(()-> ScreenUtils.createNewStage("/gui/ExamCreationSecond.fxml").show());
	}
	
	/**
	 * Initializes the GUI with the given logic.
	 * @param location
	 * @param resources
	 */
	@Override
	public void initialize(URL location, ResourceBundle resources) 
	{
		ClientMessageHandler.setExamCreationSecondController(this);
		newExam.setProfessor_full_name(u.getFirst_name() + " " + u.getLast_name());
		nameTXT.setText(u.get_fullName());
		idTXT.setText(u.getUser_id());
		questionIdCol.setCellValueFactory(new PropertyValueFactory<>("id"));
		scoreCol.setCellValueFactory(new PropertyValueFactory<>("score"));
		ObservableList<Question> questionObservableList = FXCollections.observableArrayList(questionList);
		questionTable.setItems(questionObservableList);
		colHandler();
	}	
	
	/**
	 * Exits from client GUI - disconnects from DB aswell.
	 * @param event
	 */
	@FXML
	void exit(ActionEvent event)
	{
		UserController.userExit(u);
	}
	
	/**
	 * Goes back to professor main screen only if the user pressed yes.
	 * @param event
	 */
	@FXML
	void goBack(ActionEvent event) 
	{
		UserController.close(event);
	    UserController.show(e);
	    resetQuestionScores();
	}
	
	/**
	 * Submits the exam to the DB.
	 * @param event
	 */
	@FXML
	void submit(ActionEvent event)
	{
		HashMap<Boolean, String> errorMap = createErrorMap();
		if (errorMap.containsKey(true))
		{
			AlertMessages.makeAlert(errorMap.get(true), "Exam Creation");
			return;
		}
		buildExam();
		ClientUI.chat.accept(newExam);
		ArrayList<String> request = new ArrayList<>();
	    request.add("update exam questions");
	    for (Question question : questionTable.getItems()) 
		    request.add(newExam.getExam_id() + " " +  question.getId() + " " + question.getScore());
	    ClientUI.chat.accept(request);
	    UserController.goBack(event, "/gui/ProfessorScreen.fxml");
	}
	
	/**
	 * preview for the created exam
	 * @param event
	 */
	@FXML
	void preview(ActionEvent event)
	{
		HashMap<Boolean, String> errorMap = createErrorMap();
		if (errorMap.containsKey(true))
		{
			AlertMessages.makeAlert(errorMap.get(true), "Exam Creation");
			return;
		}
		try 
		{
			buildExam();
			ComputerizedExamController.start(newExam, u);
		} catch (Exception e) {e.printStackTrace();}
	}
	
	/**
	 * This method builds the exam from the information within the controller.
	 */
	public void buildExam()
	{	
		ClientUI.chat.accept("get amount of exams");
		newExam.setSubject_id(questionList.get(0).getSubject());
		newExam.setCourse_id(questionList.get(0).getCourse());
		newExam.setExam_id(newExam.getSubject_id() + newExam.getCourse_id() + newExam.getExam_number());
		newExam.setNum_questions(questionTable.getItems().size());
		newExam.setTime(Integer.parseInt(minutesTextField.getText()));
		newExam.setExaminees_notes(studentNotesTextArea.getText());
		newExam.setProfessor_notes(profNotesTextArea.getText());
		newExam.setProfessor_id(u.getUser_id());
		newExam.setPassword(passwordTextField.getText());
		newExam.setExam_name(examNameTextField.getText());
		newExam.setExamQuestions(questionList);
	}
	
	/**
	 * Finds out how many exams there to get the correct exam number.
	 * @param number
	 */
	public void setExamNumber(String number)
	{
		number = Integer.toString(Integer.parseInt(number) + 1);
		//adds the 0 before the integer as long as num is < 10.
		String newExamNum = String.format("%02d", Integer.parseInt(number));
		newExam.setExam_number(newExamNum);
	}
	
	/**
	 * Resets the questionList when going back to the previous page.
	 */
	public void resetQuestionScores() 
	{
	    for (Question q : questionList) q.setScore(null);
	}
	
	/**
	 * Sets the columns of the table to be editable.
	 */
	private void colHandler() 
	{
		scoreCol.setCellFactory(TextFieldTableCell.forTableColumn());
		scoreCol.setOnEditCommit(e -> 
		{
	        Question question = e.getTableView().getItems().get(e.getTablePosition().getRow());
	        //Update the score value of the Question object
	        question.setScore(e.getNewValue()); 
	        //Update score counter
	        updateTotalScore();
	    });
	    questionTable.setEditable(true);
	}
	
	/**
	 * Updates the total score and keeps track of the validity of the score input.
	 */
	private void updateTotalScore() 
	{
	    int totalScore = 0;
	    isInvalidScore = false;
	    for (Question question : questionTable.getItems()) 
	    {
	    	try 
	    	{
	    		String scoreValue = question.getScore();
		        if (scoreValue != null && !scoreValue.isEmpty())
		        {
		            int score = Integer.parseInt(scoreValue);
		            totalScore += score;
		        }
		        if (totalScore > 100) 
		        	isInvalidScore = true;
	    	}
	        catch(NumberFormatException e)
	    	{
	        	isInvalidScore = true;
	    	}
	    }
	    totalScoreText.setText(Integer.toString(totalScore));
	}

	/**
	 * @return a map with all kinds of error messages
	 */
	private HashMap<Boolean, String> createErrorMap() 
	{
	    HashMap<Boolean, String> errorMap = new HashMap<>();
	    boolean isScoreEmpty = false;
	    boolean isWrongTime = false;
	    for (Question question : questionTable.getItems())
	    {
	        if (question.getScore() == null || question.getScore().isEmpty()) 
	        {
	            isScoreEmpty = true;
	            break;
	        } 
	    }
	    try 
	    {
	    	Integer.parseInt(minutesTextField.getText());
	    	if (Integer.parseInt(minutesTextField.getText()) < 1) isWrongTime = true;
		} catch (NumberFormatException e) {isWrongTime = true;}
	    errorMap.put(Integer.parseInt(totalScoreText.getText()) != 100, "Total score must be 100.");
	    errorMap.put(isInvalidScore, "Invalid score value. Scores must be integers between 0 and 100.");
	    errorMap.put(isScoreEmpty, "Score for each question is required.");
	    errorMap.put(passwordTextField.getText().isEmpty(), "Password is required");
	    errorMap.put(passwordTextField.getText().trim().length() != 4, "Password must be 4 digits long.");
	    errorMap.put(isWrongTime, "Time must be a positive integer.");
	    errorMap.put(minutesTextField.getText().isEmpty(), "Time is required.");
	    errorMap.put(examNameTextField.getText().isEmpty(), "Exam name is required.");
	    return errorMap;
	}
}
