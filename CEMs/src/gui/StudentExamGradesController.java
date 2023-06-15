package gui;

import java.net.URL;
import java.util.ArrayList;
import java.util.ResourceBundle;

import client.ClientMessageHandler;
import client.ClientUI;
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
import javafx.scene.text.Text;

public class StudentExamGradesController implements Initializable {

	public static User u;
	ArrayList<StudentExam> sExams = new ArrayList<>();
	public static ArrayList<String> studentArray= new ArrayList<>();


	   @FXML
	    private TableColumn<?, ?> examTable;

	    @FXML
	    private Button exitBtn;

	    @FXML
	    private TableColumn<?, ?> gradeTable;

	    @FXML
	    private TableColumn<?, ?> noteTable;

	    @FXML
	    private TableView<StudentExam> studentExamTable = new TableView<>();;

	    @FXML
	    private Text welcomeText;

	@Override
	public void initialize(URL location, ResourceBundle resources) {
		ClientMessageHandler.setStudentExamGradesController(this);
		studentArray.add("load student grades");
		studentArray.add(u.getUser_id());
		ClientUI.chat.accept(studentArray);
	}
    @FXML
    void enterExam(ActionEvent event) {

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
    
    public static void start(User user) throws Exception 
	{
		u = user;
		ScreenUtils.createNewStage("/gui/StudentExamGrades.fxml").show();
	}

	/**
	 * Sets the exam table with the values that are currently in the eArr,
	 * changes the isActive and course_id values to more understandable values.
	 */
	public void updateExamTable(ArrayList<StudentExam> arrayList) {
		examTable.setCellValueFactory(new PropertyValueFactory<>("exam_name"));
		gradeTable.setCellValueFactory(new PropertyValueFactory<>("grade"));
		noteTable.setCellValueFactory(new PropertyValueFactory<>("comment"));
	    ObservableList<StudentExam> examObservableList = FXCollections.observableArrayList(sExams);
	    studentExamTable.setItems(examObservableList);
	}
	
	/**
	 * Setter.
	 * @param sArr
	 */
	public void setArr (ArrayList<StudentExam> sArr)
	{
		sExams = sArr;
	}

}
