package gui;

import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;
import javax.swing.JOptionPane;
import client.ClientMessageHandler;
import client.ClientUI;
import control.AlertMessages;
import control.UserController;
import entities.ExamResults;
import entities.User;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.ListView;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.control.cell.TextFieldTableCell;
import javafx.scene.input.KeyEvent;
import javafx.scene.text.Text;
import javafx.util.converter.IntegerStringConverter;

/**
 * Class that lets the professor confirm automatically checked exams.
 */
public class ExamResultsScreenController implements Initializable
{
	public static User u;
	
	public ArrayList<ExamResults> arr = new ArrayList<>();
	
    @FXML
    private Text idTXT;

    @FXML
    private Text nameTXT;
	
    @FXML
    private TextField searchBar;

	@FXML
	private ListView<String> suspectListView;
	 
    @FXML
    private TableView<ExamResults> examResultsTable;
    
    @FXML
    private TableColumn<ExamResults, String> commentsCol;

    @FXML
    private TableColumn<ExamResults, String> examNameCol;

    @FXML
    private TableColumn<ExamResults, Integer> gradeCol;

    @FXML
    private TableColumn<ExamResults, String> studentIdCol;
    
    /**
	 * Initializes the JavaFX controller during application startup.
	 * @param user
	 * @throws Exception
	 */
	public static void start(User user) throws Exception 
	{
		u = user;
		ScreenUtils.createNewStage("/gui/ExamResultsScreen.fxml").show();
	}
	
	/**
	 * Initializes the GUI with the given logic.
	 * 
	 * @param location
	 * @param resources
	 */
	@Override
	public void initialize(URL location, ResourceBundle resources) 
	{
		ClientMessageHandler.setExamResultsScreenController(this);
		nameTXT.setText(u.get_fullName());
		idTXT.setText(u.getUser_id());
		constructRequest();
		searchBar.setOnKeyReleased(event -> search(event));
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
	 * Goes back to professor main screen.
	 * @param event
	 */
    @FXML
    void goBack(ActionEvent event) 
    {
    	UserController.goBack(event, "/gui/ProfessorScreen.fxml");
    }
    
    /**
     * Submits approval to the DB.
     * @param event
     */
    @FXML
    void approve(ActionEvent event)
    {
    	HashMap<Boolean, String> errorMap = createErrorMap();
		if (errorMap.containsKey(true))
		{
			AlertMessages.makeAlert(errorMap.get(true), "Exam Results");
		    return;
		}
		ExamResults selectedExam = examResultsTable.getSelectionModel().getSelectedItem();
		//Condition to make sure that a question to delete was indeed selected.
        if (selectedExam != null) 
        {
        	int res = AlertMessages.makeDecisionAlert("Ready to submit? Make sure you pressed enter to save changes!", "Approve Exam");
        	if (res == JOptionPane.YES_OPTION)
			{
	        	selectedExam.setIsConfirmed("1");
	        	ClientUI.chat.accept(selectedExam);
	        	examResultsTable.getItems().remove(selectedExam);
			}
        }
        else 
       	 AlertMessages.makeAlert("Select an exam to approve.", "Approve Exam");
    }
    
    /**
	 * Refreshes the exam table
	 * @param event
	 */
	@FXML
	void refresh(ActionEvent event) 
	{
		constructRequest();
		examResultsTable.refresh();
		suspectListView.refresh();
	}
	
	/**
     * A request to load requests. Used in initialization and refresh.
     */
    private void constructRequest()
    {
		ArrayList<String> request = new ArrayList<>();
		request.add("load pending exams");
		request.add(u.getUser_id());
		ClientUI.chat.accept(request);
    }
    
    /**
	 * Sets the selected columns of the table to be editable.
	 */
	private void colHandler() 
	{
		//Set the cell factory for the qnumTable column to use TextFieldTableCell with an IntegerStringConverter.
		gradeCol.setCellFactory(TextFieldTableCell.forTableColumn(new IntegerStringConverter() {
		    @Override
		    public Integer fromString(String value) 
		    {
		        try 
		        {
		            return super.fromString(value);
		        }catch (NumberFormatException e) 
		        {
		            AlertMessages.makeAlert("You can only input integers", "Change Grade");
		            return null;
		        }
		    }
		}));
	    //Set the onEditCommit event for qnumTable column.
		gradeCol.setOnEditCommit(e -> {
		ExamResults er = e.getTableView().getItems().get(e.getTablePosition().getRow());
		er.setGrade(e.getNewValue());
		er.setComment("-");
		examResultsTable.refresh();
		});
		commentsCol.setCellFactory(TextFieldTableCell.forTableColumn());
		commentsCol.setOnEditCommit(e -> {
			ExamResults er = e.getTableView().getItems().get(e.getTablePosition().getRow());
	        er.setComment(e.getNewValue());
	    });
	    examResultsTable.setEditable(true);
	}
	
	/**
	 * This method is called when a key is released and filters the table.
	 * @param event
	 */
	void search(KeyEvent event)
	{
		 String searchText = searchBar.getText().toLowerCase();
		    //Filter the question list based on the search text
		    ArrayList<ExamResults> filteredList = new ArrayList<>();
		    for (ExamResults er : arr)
		        if (er.getExam_name().toLowerCase().contains(searchText))
		            filteredList.add(er);
		    //Update the question table with the filtered list
		    updateExamTable(filteredList);       
	 }
	
    /**
     * Sets the examResultsTable with the values that are currently in the Arr.
     */
    public void updateExamTable(ArrayList<ExamResults> arrayList) 
    {
    	examNameCol.setCellValueFactory(new PropertyValueFactory<>("exam_name"));
	    studentIdCol.setCellValueFactory(new PropertyValueFactory<>("student_id"));
	    gradeCol.setCellValueFactory(new PropertyValueFactory<>("grade"));
	    commentsCol.setCellValueFactory(new PropertyValueFactory<>("comment"));
	    ObservableList<ExamResults> examResultsObservableList = FXCollections.observableArrayList(arrayList);
	    examResultsTable.setItems(examResultsObservableList);
	}
    
    /**
     * Sets the suspectListView with the suspect students..
     */
    public void checkForSuspects() 
    {
    	suspectListView.getItems().clear();
    	//<wronganswer, student id list>
        Map<String, List<String>> suspectPairs = new HashMap<>();
        for (ExamResults e : arr) 
        {
        	//Adds exam id to the wrong answers in-case there are exams with the same wrong answers.
            String wrongAnswers = e.getWrong_answers();
            if (wrongAnswers != null && !wrongAnswers.isEmpty()) 
            {
            	wrongAnswers += e.getExam_id();
            	//If the key wrong answer is already in the map, join the student to the suspect list in the map
            	if (suspectPairs.containsKey(wrongAnswers)) 
            	    suspectPairs.get(wrongAnswers).add(e.getStudent_id());
            	//Creates new entry in the map in case there's no such wrong-answer-key.
            	else 
            	{
            	    ArrayList<String> list = new ArrayList<>();
            	    list.add(e.getExam_name());
            	    list.add(e.getStudent_id());
            	    suspectPairs.put(wrongAnswers, list);
            	}
            }
        }
        for (List<String> suspects : suspectPairs.values()) 
        {
        	//Insures that there are at least two suspects (+1 for the exam_name).
            if (suspects.size() > 2)
            {
            	//In case there's more than two suspects, it joins the first two n - 1 with commas to suspectPair.
                String suspectPair = String.join(", ", suspects.subList(1, suspects.size()));
                String suspectEntry = String.format("Students with IDs: %s \nsuspect(s) in exam %s", suspectPair, suspects.get(0));
                suspectListView.getItems().add(suspectEntry);
            }
        }
    }

	/**
     * Setter.
     * @param arr array
     */
    public void setArr (ArrayList<ExamResults> arr)
    {
    	this.arr = arr;
    }
    
	/**
	 * @return a map with all kinds of error messages
	 */
	private HashMap<Boolean, String> createErrorMap() 
	{
		HashMap<Boolean, String> errorMap = new HashMap<>();
	    for (ExamResults e : examResultsTable.getItems()) 
	    {
	        if (e.getGrade() == null) {
	            errorMap.put(true, "Grade for each exam is required.");
	            break;
	        } 
	        if (e.getComment().equals("-")) 
	        {
	            errorMap.put(true, "Comment is required if grade was changed.");
	            break;
	        }
	        if (e.getGrade() < 0 || e.getGrade() > 100) 
	        {
	            errorMap.put(true, "Invalid grade. Grade must be between 0 and 100.");
	            break;
	        }
	    }
	    return errorMap;
	}
}
