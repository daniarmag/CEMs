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
import javafx.scene.text.Text;

/*A GUI for choosing an exam to take.*/
public class StudentExamScreenController implements Initializable 
{
	public ArrayList<Exam> eArr = new ArrayList<>();
	
	public ArrayList<Question> qArr = new ArrayList<>();
	
	public static ArrayList<String> courseArray = new ArrayList<>();

	public static User u;

	@FXML
    private Text idTXT;

    @FXML
    private Text nameTXT;
    
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
	private TableColumn<?, ?> exNameTable;

	@FXML
	private TableColumn<?, ?> typeTable;

	@FXML
	private TableView<Exam> examTable = new TableView<>();

	/**
	 * Initializes the JavaFX controller during application startup.
	 * 
	 * @param user
	 * @param courses
	 * @throws Exception
	 */
	public static void start(User user, ArrayList<String> courses) throws Exception 
	{
		u = user;
		courseArray = courses;
		Platform.runLater(() -> ScreenUtils.createNewStage("/gui/StudentExamScreen.fxml").show());
	}

	/**
	 * Initializes the GUI with the given logic.
	 * @param location
	 * @param resources
	 */
	@Override
	public void initialize(URL location, ResourceBundle resources) 
	{
		nameTXT.setText(u.get_fullName());
		idTXT.setText(u.getUser_id());
		ClientMessageHandler.setStudentExamController(this);
		ClientUI.chat.accept("load student exams");
	}

	/**
	 * This method enters the student to the exam manual/computerized.
	 * @param event
	 */
	@FXML
	void enterExam(ActionEvent event) 
	{
		HashMap<Boolean, String> errorMap = createErrorMap();
		if (errorMap.containsKey(true))
		{
			AlertMessages.makeAlert(errorMap.get(true), "Exam entry");
			return;
		}
		Exam selectedExam = examTable.getSelectionModel().getSelectedItems().get(0);
		//After a validation of the password, the student enters to the manual exam screen.
		if (selectedExam.getType().equals("Manual")) 
		{
			UserController.hide(event);
			try 
			{
				ManualExamController.start(u, selectedExam);
			} catch (Exception e) {}
		} 
		//After a validation of the password, the student enters to the computerized exam screen.
		else 
		{
			//A request to the server to load all the exam questions.
			ArrayList<String> request = new ArrayList<>();
			request.add("load exam questions");
			request.add(selectedExam.getExam_id());
			ClientUI.chat.accept(request);
			selectedExam.setExamQuestions(qArr);
			try 
			{
				UserController.hide(event);
				ComputerizedExamController.start(selectedExam, u);
			} catch (Exception e) {e.printStackTrace();}
		}
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
		ClientUI.chat.accept("load student exams");
		examTable.refresh();
	}

	/**
	 * Sets the exam table with the values that are currently in the eArr, changes
	 * the isActive to more understandable values.
	 */
	public void updateExamTable() 
	{
		idTable.setCellValueFactory(new PropertyValueFactory<>("exam_id"));
		exNameTable.setCellValueFactory(new PropertyValueFactory<>("exam_name"));
		typeTable.setCellValueFactory(new PropertyValueFactory<>("type"));
		activeTable.setCellValueFactory(new PropertyValueFactory<>("isActive"));
		ObservableList<Exam> examObservableList = FXCollections.observableArrayList(eArr);
		// This condition makes the table more understandable.
		for (Exam e : examObservableList)
		{
			if (e.getIsActive().equals("0"))
				e.setIsActive("No");
			else
				e.setIsActive("Yes");
		}
		examTable.setItems(examObservableList);
	}

	/**
	 * Setter.
	 * @param eArr
	 */
	public void setArr(ArrayList<Exam> eArr)
	{
		this.eArr = eArr;
	}

	/**
	 * @return a map with all kinds of error messages
	 */
	private HashMap<Boolean, String> createErrorMap()
	{
		HashMap<Boolean, String> errorMap = new HashMap<>();
		if (!(examTable.getSelectionModel().getSelectedItems().isEmpty())) 
		{
			errorMap.put(!(passwordTextField.getText().trim().equals(examTable.getSelectionModel().getSelectedItems().get(0).getPassword())),"Password incorrect");
			errorMap.put("No".equals(examTable.getSelectionModel().getSelectedItems().get(0).getIsActive()),"The exam has not activated yet");
		}
		errorMap.put(passwordTextField.getText().isEmpty(), "Password is required");
		errorMap.put(examTable.getSelectionModel().getSelectedItems().isEmpty(), "Choose an exam");
		return errorMap;
	}

	/**
	 * Setter.
	 * @param qArr
	 */
	public void setQArr(ArrayList<Question> qArr)
	{
		this.qArr = qArr;
	}
}
