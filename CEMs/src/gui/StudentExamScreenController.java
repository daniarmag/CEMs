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
import javafx.scene.control.TextField;
import javafx.scene.control.cell.PropertyValueFactory;

/*A GUI for choosing an exam to take.*/
public class StudentExamScreenController implements Initializable
{
	public ArrayList<Exam> eArr = new ArrayList<>();
	public ArrayList<Question> qArr= new ArrayList<>();
	public static ArrayList<String> courseArray= new ArrayList<>();
	

	public static User u;

	 @FXML
	    private TableColumn<?, ?> activeTable;

	    @FXML
	    private Button exitBtn;
	    
	    @FXML
	    private Button enterBtn;

	    @FXML
	    private Button goBackBtn;
	    
	    @FXML
	    private TextField passwordTextField;

	    @FXML
	    private TableColumn<?, ?> idTable;

	    @FXML
	    private TableColumn<?, ?> courseTable;

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
		HashMap<Boolean, String> errorMap = createErrorMap();
		if (errorMap.containsKey(true)) {
			JOptionPane.showMessageDialog(null, errorMap.get(true), "Exam entry", JOptionPane.INFORMATION_MESSAGE);
			return;
		}
		Exam selectedExam = examTable.getSelectionModel().getSelectedItems().get(0);
		if (selectedExam.getType().equals("Manual")) {
			UserController.hide(event);
			try {
				ManualExamController.start(u, selectedExam);
			} catch (Exception e) {
			}
		} else {
			ArrayList<String> request = new ArrayList<>();
			request.add("load exam questions");
			request.add(selectedExam.getExam_id());
			ClientUI.chat.accept(request);
			selectedExam.setExamQuestions(qArr);
			try {
				ExamController.start(selectedExam, u);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
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
    
    @FXML
    void refresh(ActionEvent event)
    {
    	ClientUI.chat.accept("load student exams");	
    	examTable.refresh();
    }

	 /**
	  * Initializes the GUI with the given logic.
	  * @param location
	  * @param resources
	  */  
	@Override
	public void initialize(URL location, ResourceBundle resources) {
		ClientMessageHandler.setStudentExamController(this);
		ClientUI.chat.accept("load student exams");	
	}
	
	/**
	 * Sets the exam table with the values that are currently in the eArr,
	 * changes the isActive and course_id values to more understandable values.
	 */
	public void updateExamTable() {
		idTable.setCellValueFactory(new PropertyValueFactory<>("exam_id"));
		courseTable.setCellValueFactory(new PropertyValueFactory<>("course_id"));
		typeTable.setCellValueFactory(new PropertyValueFactory<>("type"));
		activeTable.setCellValueFactory(new PropertyValueFactory<>("isActive"));
	    ObservableList<Exam> examObservableList = FXCollections.observableArrayList(eArr);
	    //These conditions make the table more understandable.
	    for (Exam e: examObservableList) {
	    	if (e.getIsActive().equals("0"))
	    		e.setIsActive("No");
	    	else
	    		e.setIsActive("Yes");
	    	for (String cName: courseArray)
	    		if(cName.startsWith(e.getCourse_id())) {
	    			e.setCourse_id(cName);
	    		}
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

	 /**
	  * @return a map with all kinds of error messages
	  */
	 private HashMap<Boolean, String> createErrorMap() 
		{
		    HashMap<Boolean, String> errorMap = new HashMap<>();
		    if(!(examTable.getSelectionModel().getSelectedItems().isEmpty())) {
		    	errorMap.put(!(passwordTextField.getText().trim().equals(examTable.getSelectionModel().getSelectedItems().get(0).getPassword())),
		    				"Password incorrect");
		    	errorMap.put("No".equals(examTable.getSelectionModel().getSelectedItems().get(0).getIsActive()),
	    				"The exam has not activated yet");
		    }
		    errorMap.put(passwordTextField.getText().isEmpty(), "Password is required");
		    errorMap.put(examTable.getSelectionModel().getSelectedItems().isEmpty(), "Choose an exam");
		    return errorMap;
		}
	 
		/**
	     * Setter.
	     * @param qArr
	     */
	    public void setQArr (ArrayList<Question> qArr)
	    {
	    	this.qArr = qArr;
	    }
	    
}
