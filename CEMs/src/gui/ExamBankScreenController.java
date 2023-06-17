package gui;

import java.net.URL;
import java.util.ArrayList;
import java.util.ResourceBundle;
import client.ClientMessageHandler;
import client.ClientUI;
import control.AlertMessages;
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
import javafx.scene.text.Text;

/**
 * Class that represents an exam bank and the operations that a professor can do on them.
 */
public class ExamBankScreenController implements Initializable
{
	public ArrayList<Exam> eArr = new ArrayList<>();
	
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
	private Text idTXT;

	@FXML
    private Text nameTXT;
	
    @FXML
    private TextField searchBar;
    
    @FXML
    private TableView<Exam> examTable = new TableView<>();
    
    @FXML
    private TableColumn<Exam, String> examNameCol;
    
    @FXML
    private TableColumn<Exam, String> typeCol;
    
    @FXML
    private TableColumn<Exam, String> activeCol;
    
    /**
   	 * Initializes the JavaFX controller during application startup.
   	 * @param user
   	 * @throws Exception
   	 */
   	public static void start(User user) throws Exception 
   	{
   		u = user;
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
		nameTXT.setText(u.get_fullName());
		idTXT.setText(u.getUser_id());
		ArrayList<String> request = new ArrayList<String>();
		//A call to load all professor questions.
		request.add("load professor exams");
		request.add(u.getUser_id());
		ClientUI.chat.accept(request);
		searchBar.setOnKeyReleased(event -> search(event));
	    for (Exam e : examTable.getItems()) 
	        e.setIsActive(e.getIsActive().equals("0") ? "No" : "Yes");
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
 

    /**
     * Sends a request to HOF to get time extension for the exam.
     * @param event
     */
    @FXML
    void changeTime(ActionEvent event)
    {
    	Exam selectedExam = examTable.getSelectionModel().getSelectedItem();
    	//Condition to make sure that an exam to deactivate was indeed selected.
    	if (selectedExam != null)
    	{
    		if (selectedExam.getIsActive().equals("Yes"))
    		{
    			ArrayList<String> array = new ArrayList<String>();
        		//A call to activate an exam.
        		array.add(selectedExam.getExam_id());
        		array.add(selectedExam.getExam_name());
        		UserController.hide(event);
            	try 
            	{
        			ExamRequestTimeController.start(array, u);
        		} catch (Exception e) {}
    		}
    		else
    			 AlertMessages.makeAlert("Exam must be active to request time change.", "Change Time");
    	}
    	  else 
              AlertMessages.makeAlert("Select an exam for time change.", "Change Time");
    }
    
    
	/**
	 * Activates the exam via handleExamStatus
	 * @param event
	 */
	@FXML
	void activateExam(ActionEvent event) 
	{
	    handleExamStatus(true);
	}

	/**
	 * Deactivates the exam via handleExamStatus
	 * @param event
	 */
	@FXML
	void deactivateExam(ActionEvent event)
	{
	    handleExamStatus(false);
	}

	/**
	 * Depending by button that was clicked, handling the request
	 * to activate or deactivate the exam.
	 * @param activate
	 */
	private void handleExamStatus(boolean activate)
	{
	    Exam selectedExam = examTable.getSelectionModel().getSelectedItem();
	    String action = activate ? "activate" : "deactivate";
	    String actionMessage = activate ? "Activate Exam" : "Deactivate Exam";
	    if (selectedExam != null) 
	    {
	        ArrayList<String> request = new ArrayList<>();
	        request.add(action);
	        request.add(selectedExam.getExam_id());
	        ClientUI.chat.accept(request);
	        selectedExam.setIsActive(activate ? "Yes" : "No");
	        examTable.refresh();
	    } else 
	    	 AlertMessages.makeDecisionAlert("Select an exam to " + action, actionMessage);
	}
    
    
    /**
	 * Sets the exam table with the values that are currently in the eArr. 
	 * @param arrayList 
	 */
	public void updateExamTable(ArrayList<Exam> arrayList) 
	{
		examNameCol.setCellValueFactory(new PropertyValueFactory<>("exam_name"));
	    typeCol.setCellValueFactory(new PropertyValueFactory<>("type"));
	    activeCol.setCellValueFactory(new PropertyValueFactory<>("isActive"));
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
	
	/**
     * Setter.
     * @param eArr
     */
    public void setArr (ArrayList<Exam> eArr)
    {
    	this.eArr = eArr;
    }

}
