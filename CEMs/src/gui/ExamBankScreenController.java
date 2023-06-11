package gui;

import java.net.URL;
import java.util.ArrayList;
import java.util.Map;
import java.util.ResourceBundle;
import client.ClientMessageHandler;
import client.ClientUI;
import control.UserController;
import entities.Exam;
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
import javafx.scene.input.KeyEvent;

public class ExamBankScreenController implements Initializable
{
	public ArrayList<Exam> eArr = new ArrayList<Exam>();
	
	public static Map<String, ArrayList<String>> teachingMap;
	
	public static User u;
	
    @FXML
    private Button activatExamBtn;

    @FXML
    private Button deactivateExamBtn;

    @FXML
    private Button exitBtn;

    @FXML
    private Button extendTimeBtn;

    @FXML
    private Button goBackBtn;

    @FXML
    private TextField searchBar;
    
    @FXML
    private TableView<Exam> examTable;
    
    @FXML
    private TableColumn<Exam, String> examNameCol;
    
    @FXML
    private TableColumn<Exam, String> typeCol;
    
    @FXML
    private TableColumn<Exam, String> activeCol;
    
    /**
   	 * Initializes the JavaFX controller during application startup.
   	 * @param user
   	 * @param map
   	 * @throws Exception
   	 */
   	@SuppressWarnings("unchecked")
   	public static void start(User user, Map<?, ?> map) throws Exception 
   	{
   		u = user;
   		teachingMap = (Map<String, ArrayList<String>>) map;
   		Platform.runLater(()-> ScreenUtils.createNewStage("/gui/ExamBankScreen.fxml").show());
   	}
   	
	/**
	 * Initializes the GUI with the given logic.
	 * @param location
	 * @param resources
	 */
	@Override
	public void initialize(URL location, ResourceBundle resources) 
	{
		ClientMessageHandler.setExamBankScreenController(this);
		ArrayList<String> request = new ArrayList<String>();
		//A call to load all professor questions.
		request.add("load professor exams");
		request.add(u.getUser_id());
		ClientUI.chat.accept(request);
		searchBar.setOnKeyReleased(event -> search(event));
	}

	/**
	 * Disconnects from the server and closes GUI window.
	 * @param event
	 */
	@FXML
	void exit(ActionEvent event) 
	{
		UserController.userExit(u);
	}

	/**
	 * Goes back to professor main screen.
	 * @param event
	 */
	@FXML
	void goBack(ActionEvent event) 
	{	
		UserController.goBack(event, "/gui/ProfessorScreen.fxml");
	}
    
    @FXML
    void extendTime(ActionEvent event)
    {

    }
    
    @FXML
    void activatExam(ActionEvent event)
    {

    }

    @FXML
    void deactivateExam(ActionEvent event) 
    {

    }
    
    /**
	 * Sets the exam table with the values that are currently in the eArr. 
	 * @param arrayList 
	 */
	public void updateExamTable(ArrayList<Exam> arrayList) 
	{
		examNameCol.setCellValueFactory(new PropertyValueFactory<>("id"));
	    typeCol.setCellValueFactory(new PropertyValueFactory<>("questionNumber"));
	    activeCol.setCellValueFactory(new PropertyValueFactory<>("questionText"));
	    ObservableList<Exam> examObservableList = FXCollections.observableArrayList(arrayList);
	    examTable.setItems(examObservableList);
    }
	
	/**
	 * This method is called when a key is released and filters the table.
	 * @param event
	 */
	void search(KeyEvent event)
	{
		 String searchText = searchBar.getText().toLowerCase();
		    //Filter the question list based on the search text
		    ArrayList<Exam> filteredList = new ArrayList<>();
		    for (Exam exam : eArr)
		        if (exam.getExam_name().toLowerCase().contains(searchText))
		            filteredList.add(exam);
		    //Update the question table with the filtered list
		    updateExamTable(filteredList);       
	 }

}
