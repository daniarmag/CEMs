package gui;

import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.ResourceBundle;
import javax.swing.JOptionPane;

import client.ClientMessageHandler;
import client.ClientUI;
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

public class ExamCreationSecondController implements Initializable
{
	public static Professor<?, ?> u;
	
	public static ArrayList<Question> questionList = new ArrayList<Question>();
	
	public Exam newExam = new Exam(null, null, null, null, null, null, null, null, null, null, null);

    @FXML
    private Text examAuthorText;

    @FXML
    private TextField minutesTextField;

    @FXML
    private TextField passwordTextField;

    @FXML
    private TextArea profNotesTextArea;

    @FXML
    private TextArea studentNotesTextArea;
    
    @FXML
    private TableView<Question> questionTable;
    
    @FXML
    private TableColumn<Question, String> questionIdCol;

    @FXML
    private TableColumn<Question, String> scoreCol;

    
    /**
	 * Initializes the JavaFX controller during application startup.
	 * @param primaryStage The primary stage of the application.
	 * @param user
     * @param info 
	 * @throws Exception
	 */
	public static void start(User user, ArrayList<Question> info) throws Exception 
	{
		u = (Professor<?, ?>)user;
		questionList = info;
;		Platform.runLater(()-> ScreenUtils.createNewStage("/gui/ExamCreationSecond.fxml").show());
	}
	
	/**
	 * Goes back to professor main screen only if the user pressed yes.
	 * @param event
	 */
	@FXML
	void goBack(ActionEvent event) 
	{
	    int result = JOptionPane.showConfirmDialog(null, "Are you sure that you want to leave?", "Exam Creation", JOptionPane.YES_NO_OPTION, 
	    																										  JOptionPane.QUESTION_MESSAGE);
	    if (result == JOptionPane.YES_OPTION) 
	    {
	        UserController.goBack(event, "/gui/ProfessorScreen.fxml");
	    }
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
			JOptionPane.showMessageDialog(null, errorMap.get(true), "Exam Creation", JOptionPane.INFORMATION_MESSAGE);
		    return;
		}
		buildExamList();
		ArrayList<String> request = new ArrayList<>();
	    request.add("update exam questions");
	    for (Question question : questionTable.getItems()) 
		    request.add(newExam.getExam_id() + " " +  question.getId() + " " + question.getScore());
	    System.out.println(request);
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
	 * Initializes the GUI with the given logic.
	 * @param location
	 * @param resources
	 */
	@Override
	public void initialize(URL location, ResourceBundle resources) 
	{
		ClientMessageHandler.setExamCreationSecondController(this);
		newExam.setProfessor_full_name(u.getFirst_name() + " " + u.getLast_name());
		examAuthorText.setText(newExam.getProfessor_full_name());
		questionIdCol.setCellValueFactory(new PropertyValueFactory<>("id"));
		scoreCol.setCellValueFactory(new PropertyValueFactory<>("score"));
		ObservableList<Question> questionObservableList = FXCollections.observableArrayList(questionList);
		questionTable.setItems(questionObservableList);
		editableCols();
	}	
	
	/**
	 * This method builds the exam from the information within the controller.
	 */
	public void buildExamList()
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
	 * Sets the columns of the table to be editable.
	 */
	private void editableCols() 
	{
		scoreCol.setCellFactory(TextFieldTableCell.forTableColumn());
		scoreCol.setOnEditCommit(e -> 
		{
	        Question question = e.getTableView().getItems().get(e.getTablePosition().getRow());
	        //Update the score value of the Question object
	        question.setScore(e.getNewValue()); 
	    });
	    questionTable.setEditable(true);
	}
	

	/**
	 * @return a map with all kinds of error messages
	 */
	private HashMap<Boolean, String> createErrorMap() 
	{
	    HashMap<Boolean, String> errorMap = new HashMap<>();
	    boolean isScoreEmpty = false;
	    for (Question question : questionTable.getItems()) 
	    {
	        if (question.getScore() == null || question.getScore().isEmpty()) 
	        {
	            isScoreEmpty = true;
	            break;
	        }
	    }
	    errorMap.put(isScoreEmpty, "Score for each question is required.");
	    errorMap.put(profNotesTextArea.getText().isEmpty(), "Professor notes are required");
	    errorMap.put(studentNotesTextArea.getText().isEmpty(), "Student notes are required");
	    errorMap.put(passwordTextField.getText().isEmpty(), "Password is required");
	    errorMap.put(minutesTextField.getText().isEmpty(), "Time is required.");
	    return errorMap;
	}
}
