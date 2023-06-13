package gui;

import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;
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
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.control.cell.TextFieldTableCell;
import javafx.util.converter.IntegerStringConverter;

public class ExamResultsScreenController implements Initializable
{
	public static User u;
	
	public ArrayList<ExamResults> arr = new ArrayList<>();

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
		ArrayList<String> request = new ArrayList<>();
		request.add("load pending exams");
		request.add(u.getUser_id());
		ClientUI.chat.accept(request);
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
    
    @FXML
    void submit(ActionEvent event)
    {
    	HashMap<Boolean, String> errorMap = createErrorMap();
		if (errorMap.containsKey(true))
		{
			AlertMessages.makeAlert(errorMap.get(true), "Exam Creation");
		    return;
		}
		ArrayList<ExamResults> tableData = new ArrayList<>(examResultsTable.getItems());
	    ClientUI.chat.accept(tableData);
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
     * Sets the examResultsTable with the values that are currently in the Arr.
     */
    public void updateTables() 
    {
    	examNameCol.setCellValueFactory(new PropertyValueFactory<>("exam_name"));
	    studentIdCol.setCellValueFactory(new PropertyValueFactory<>("student_id"));
	    gradeCol.setCellValueFactory(new PropertyValueFactory<>("grade"));
	    commentsCol.setCellValueFactory(new PropertyValueFactory<>("comment"));
	    ObservableList<ExamResults> examResultsObservableList = FXCollections.observableArrayList(arr);
	    examResultsTable.setItems(examResultsObservableList);
	}
    
    /**
     * Sets the suspectListView with the suspect students..
     */
    public void checkForSuspects() 
    {
        Map<String, List<String>> suspectPairs = new HashMap<>();
        for (ExamResults e : arr) 
        {
            String wrongAnswers = e.getWrong_answers();
            if (wrongAnswers != null && !wrongAnswers.isEmpty()) 
            {
            	//If the key wrong answer is already in the map, join the student to the suspect list in the map
            	if (suspectPairs.containsKey(wrongAnswers)) 
            	    suspectPairs.get(wrongAnswers).add(e.getStudent_id());
            	//Creates new entry in the map in case there's no such wrong-answer-key.
            	else 
            	{
            	    ArrayList<String> list = new ArrayList<>();
            	    list.add(e.getStudent_id());
            	    suspectPairs.put(wrongAnswers, list);
            	}
            }
        }
        for (List<String> suspects : suspectPairs.values()) 
        {
        	//Insures that there are at least two suspects.
            if (suspects.size() > 1)
            {
            	//In case there's more than two suspects, it joins the first two n - 1 with commas to suspectPair.
                String suspectPair = String.join(", ", suspects.subList(0, suspects.size() - 1));
                String additionalSuspect = suspects.get(suspects.size() - 1);
                String suspectEntry = String.format("%s suspect(s) with %s", suspectPair, additionalSuspect);
                suspectListView.getItems().add(suspectEntry);
            }
        }
    }

	/**
     * Setter.
     * @param qArr
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
