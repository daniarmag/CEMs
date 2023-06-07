package gui;

import java.net.URL;
import java.util.ArrayList;
import java.util.ResourceBundle;
import client.ClientMessageHandler;
import client.ClientUI;
import control.UserController;
import entities.Exam;
import entities.Question;
import entities.User;
import javafx.application.Platform;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;

/*A GUI for choosing an exam to take.*/
public class StudentExamScreenController implements Initializable
{
	public ArrayList<Exam> eArr = new ArrayList<>();
	public static ArrayList<String> courseArray= new ArrayList<>();
	public static User u;

	 @FXML
	    private TableColumn<?, ?> activeTable;

	    @FXML
	    private Button addQstnBtn;

	    @FXML
	    private Button exitBtn;

	    @FXML
	    private Button goBackBtn;

	    @FXML
	    private TableColumn<?, ?> idTable;

	    @FXML
	    private TableColumn<?, ?> professorTable;

	    @FXML
	    private TableColumn<?, ?> typeTable;
    
	    @FXML
	    private TableView<Exam> examTable = new TableView<>();

    
    /**
     * Initializes the JavaFX controller during application startup.
     * @param user
     * @param courses
     * @throws Exception
     */
    public static void start(User user, ArrayList<String> courses) throws Exception {
		u = user;
		courseArray = courses;
		Platform.runLater(() -> ScreenUtils.createNewStage("/gui/StudentExamScreen.fxml").show());
	}
    @FXML
    void enterExam(ActionEvent event) {

    }
	/* Exits the GUI window. */
	/* disconnects from the server and exits from the GUI. */
    @FXML
    void exit(ActionEvent event)  {
    	UserController.userExit(u);
    }

    @FXML
    void goBack(ActionEvent event)  {
    	UserController.goBack(event, "/gui/StudentScreen.fxml");
    }

	 /**
	  * Initializes the GUI with the given logic.
	  * @param location
	  * @param resources
	  */  
	@Override
	public void initialize(URL location, ResourceBundle resources) {
		ClientMessageHandler.setStudentExamController(this);
		ArrayList<String> request = new ArrayList<String>();
		request.add("load student exams");
		request.add(u.getUser_id());
		ClientUI.chat.accept(request);	
	}
	
	/**
	 * Sets the exam table with the values that are currently in the eArr,
	 * changes the isActive value to more understandable value.
	 */
	public void updateExamTable() {
		idTable.setCellValueFactory(new PropertyValueFactory<>("exam_id"));
		professorTable.setCellValueFactory(new PropertyValueFactory<>("professor_full_name"));
		typeTable.setCellValueFactory(new PropertyValueFactory<>("type"));
		activeTable.setCellValueFactory(new PropertyValueFactory<>("isActive"));
	    ObservableList<Exam> examObservableList = FXCollections.observableArrayList(eArr);
	    for (Exam e: examObservableList) {
	    	if (e.getIsActive().equals("0")) {
	    		e.setIsActive("No");
	    	}
	    	else
	    		e.setIsActive("Yes");
	    }
	    examTable.setItems(examObservableList);
	}
	
	/**
     * Setter.
     * @param eArr
     */
	 public void setArr (ArrayList<Exam> eArr)
	    {
	    	this.eArr = eArr;
	    }


}
