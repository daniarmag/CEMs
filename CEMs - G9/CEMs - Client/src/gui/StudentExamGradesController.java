package gui;

import java.net.URL;
import java.util.ArrayList;
import java.util.ResourceBundle;
import client.ClientMessageHandler;
import client.ClientUI;
import control.UserController;
import entities.ExamResults;
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

/**
 * A class that represents statistics about students
 */
public class StudentExamGradesController implements Initializable 
{
	public static User u;
	
	public ArrayList<ExamResults> sExams = new ArrayList<>();

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
	private TableColumn<ExamResults, String> examTable;

	@FXML
	private TableColumn<ExamResults, Integer> gradeTable;

	@FXML
	private TableColumn<ExamResults, String> noteTable;

	@FXML
	private TableView<ExamResults> studentExamTable = new TableView<>();;

	@FXML
	private Text welcomeText;

	/**
     * Initializes the JavaFX controller during application startup.
     * @param user
     * @throws Exception
     */
	public static void start(User user) throws Exception
	{
		u = user;
		ScreenUtils.createNewStage("/gui/StudentExamGrades.fxml").show();
	}

	/**
	 * Initializes the GUI with the given logic.
	 * @param location
	 * @param resources
	 */
	@Override
	public void initialize(URL location, ResourceBundle resources) 
	{
		ClientMessageHandler.setStudentExamGradesController(this);
		welcomeText.setText(u.getFirst_name() + "'s grades");
		nameTXT.setText(u.get_fullName());
		idTXT.setText(u.getUser_id());
		constructRequest();
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
	 * Goes back to student main screen.
	 * @param event
	 */
	@FXML
	void goBack(ActionEvent event) 
	{
		UserController.goBack(event, "/gui/StudentScreen.fxml");
	}
	
	/**
	 * Refreshes the exam table
	 * @param event
	 */
	@FXML
	void refresh(ActionEvent event) 
	{
		constructRequest();
		studentExamTable.refresh();
	}
	
	 /**
     * A request to load requests. Used in initialization and refresh.
     */
    private void constructRequest()
    {
    	ArrayList<String> request = new ArrayList<>();
		request.add("load student grades");
		request.add(u.getUser_id());
		ClientUI.chat.accept(request);
    }

	/**
	 * Sets the exam table with the values that are currently in the sExams,
	 */
	public void updateExamTable() 
	{
		examTable.setCellValueFactory(new PropertyValueFactory<>("exam_name"));
		gradeTable.setCellValueFactory(new PropertyValueFactory<>("grade"));
		noteTable.setCellValueFactory(new PropertyValueFactory<>("comment"));
		ObservableList<ExamResults> studentExamObservableList = FXCollections.observableArrayList(sExams);
		studentExamTable.setItems(studentExamObservableList);
	}

	/**
	 * Setter.
	 * @param sArr
	 */
	public void setArr(ArrayList<ExamResults> sArr) 
	{
		sExams = sArr;
	}
}
