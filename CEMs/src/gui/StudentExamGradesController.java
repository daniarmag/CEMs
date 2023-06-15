package gui;

import java.net.URL;
import java.util.ArrayList;
import java.util.ResourceBundle;

import client.ClientMessageHandler;
import client.ClientUI;
import control.AlertMessages;
import control.UserController;
import entities.Exam;
import entities.StudentExam;
import entities.User;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.control.cell.TextFieldTableCell;
import javafx.scene.text.Text;
import javafx.util.converter.IntegerStringConverter;

public class StudentExamGradesController implements Initializable {

	public static User u;
	ArrayList<StudentExam> sExams = new ArrayList<>();
	public static ArrayList<String> studentArray= new ArrayList<>();

	   @FXML
	    private Text avgTXT;

	    @FXML
	    private Text idTXT;

	    @FXML
	    private Text nameTXT;
    	
	    @FXML
    	private Button exitBtn;
	    
	    @FXML
	    private Button goBackBtn;
	    
	   @FXML
	    private TableColumn<StudentExam, String> examTable;

	    @FXML
	    private TableColumn<StudentExam, Integer> gradeTable;

	    @FXML
	    private TableColumn<StudentExam, String> noteTable;

	    @FXML
	    private TableView<StudentExam> studentExamTable = new TableView<>();;

	    @FXML
	    private Text welcomeText;
	
    public static void start(User user) throws Exception 
	{
		u = user;
		ScreenUtils.createNewStage("/gui/StudentExamGrades.fxml").show();
	}
	    
	@Override
	public void initialize(URL location, ResourceBundle resources) {
		ClientMessageHandler.setStudentExamGradesController(this);
		welcomeText.setText(u.getFirst_name()+"'s grades");
		nameTXT.setText(u.get_fullName());
		idTXT.setText(u.getUser_id());
		studentArray.add("load student grades");
		studentArray.add(u.getUser_id());
		ClientUI.chat.accept(studentArray);
		colHandler();
	}

    @FXML
    void getCopy(ActionEvent event) {

    }

    /* Exits the GUI window. */
	/* disconnects from the server and exits from the GUI. */
	@FXML
	void exit(ActionEvent event) {
		UserController.userExit(u);
	}
	
    @FXML
    void goBack(ActionEvent event) {
		UserController.goBack(event, "/gui/StudentScreen.fxml");
    }

	/**
	 * Sets the exam table with the values that are currently in the sExams,
	 */
	public void updateExamTable() {
		examTable.setCellValueFactory(new PropertyValueFactory<>("exam_name"));
		gradeTable.setCellValueFactory(new PropertyValueFactory<>("grade"));
		noteTable.setCellValueFactory(new PropertyValueFactory<>("comment"));
	    ObservableList<StudentExam> studentExamObservableList = FXCollections.observableArrayList(sExams);
	    studentExamTable.setItems(studentExamObservableList);
	}
	
	/**
	 * Setter.
	 * @param sArr
	 */
	public void setArr (ArrayList<StudentExam> sArr)
	{
		sExams = sArr;
	}
	
	private void colHandler() 
	{
		//Set the cell factory for the qnumTable column to use TextFieldTableCell with an IntegerStringConverter.
		gradeTable.setCellFactory(TextFieldTableCell.forTableColumn(new IntegerStringConverter() {
		    @Override
		    public Integer fromString(String value) 
		    {
		        try 
		        {
		            return super.fromString(value);
		        }catch (NumberFormatException e) 
		        {
		            return null;
		        }
		    }
		}));
	}
}
