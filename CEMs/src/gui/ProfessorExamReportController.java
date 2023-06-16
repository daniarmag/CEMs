package gui;

import java.net.URL;
import java.util.ArrayList;
import java.util.ResourceBundle;
import client.ClientMessageHandler;
import client.ClientUI;
import control.AlertMessages;
import control.UserController;
import entities.ExamTemplate;
import entities.User;
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
import javafx.scene.image.ImageView;
import javafx.scene.input.KeyEvent;
import javafx.scene.text.Text;

/**
 * Class that lets the professor view his exam statistics.
 */
public class ProfessorExamReportController implements Initializable
{
	private static  ReportScreenController reportScreen=new ReportScreenController();
	
    private static User u;
    
    private static ArrayList<?> arr;
    @FXML
    private TableColumn<ExamTemplate, String> examIdCol;

    @FXML
    private TableColumn<ExamTemplate, String> examNameCol;

    @FXML
    private TableColumn<ExamTemplate,String> examCourseCol;
    
    @FXML
    private TableView<ExamTemplate> examTable;

    @FXML
    private Button exitBtn;

    @FXML
    private ImageView exitImage;

    @FXML
    private ImageView faceImage;

    @FXML
    private Button goBackBtn;

    @FXML
    private ImageView labelImage;

    @FXML
    private ImageView returnIm;

    @FXML
    private TextField searchBar;

    @FXML
    private Button viewReport;

    @FXML
    private Text welcomeText;
    
    private Object itemChosen;
    
    private static ActionEvent currentEvent;

    /**
	 * Initializes the JavaFX controller during application startup.
	 * @param user
	 * @throws Exception
	 */
	public static void start(User user) throws Exception 
	{
		u = user;
		ScreenUtils.createNewStage("/gui/ProfessorExamReportScreen.fxml").show();
	}
    
	/**
	 * Initializes the GUI with the given logic.
	 * @param location
	 * @param resources
	 */
	@Override
	public void initialize(URL location, ResourceBundle resources) 
	{
		ClientMessageHandler.setProfessorExamReportController(this);
		ArrayList<String> arr = new ArrayList<>(); 
		String request = "send all exams to professor";
		arr.add(request);
		arr.add(u.getUser_id());
		searchBar.setOnKeyReleased(event -> search(event));
		ClientUI.chat.accept(arr);
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
	 * Generates a report for the chosen exam.
	 * @param event
	 */
	@FXML
	public void GenerateReport(ActionEvent event) 
	{
		currentEvent=event;
		Object item = examTable.getSelectionModel().getSelectedItem();
		if(item == null)
		{
			AlertMessages.makeAlert("You must chose before continue", "Report Allert");
			return;
		}
		itemChosen=item;
		ArrayList<String> request = new ArrayList<>();	
		request.add("generate full exam report");
		request.add(((ExamTemplate)item).get_id());
		ClientUI.chat.accept(request);
	}
    
    /**loading the table with the data of all the exams 
     * @param array
     */
    public void loadTable(ArrayList<ExamTemplate> array) 
    {
    	arr=array;
    	examTable.getItems().clear();
		loadingColumns( "_name","_id", "course_id");
		updateExamTable(array);
	}

    
    /**
	 * Sets the exam table with the values that are currently in the eArr. 
	 * @param arrayList 
	 */
	public void updateExamTable(ArrayList<ExamTemplate> arrayList) 
	{
		try
		{
	    ObservableList<ExamTemplate> examObservableList = FXCollections.observableArrayList(arrayList);
	    examTable.setItems(examObservableList);
		}catch(Exception e) {
			e.printStackTrace();
		}
    }
	
    
    
    
	private void loadingColumns( String examId, String name, String course) 
	{
		try 
		{
			examIdCol.setCellValueFactory(new PropertyValueFactory<>(examId));
			examNameCol.setCellValueFactory(new PropertyValueFactory<>(name));
			examCourseCol.setCellValueFactory(new PropertyValueFactory<>(course));		
		}catch(Exception e) {e.printStackTrace();}
	}
	
	public void openRep(Object obj) 
	{
		try 
		{
			UserController.hide(currentEvent);
		}catch(Exception e) {e.printStackTrace();}
		reportScreen.start(currentEvent,obj,itemChosen,u);
	}
	
	
	/**
	 * This method is called when a key is released and filters the table.
	 * @param event
	 */
	void search(KeyEvent event)
	{
		 String searchText = searchBar.getText().toLowerCase();
		    //Filter the question list based on the search text
		    ArrayList<ExamTemplate> filteredList = new ArrayList<>();
		    for (Object exam : arr)
		        if (((ExamTemplate)exam).getCourse_id().contains(searchText))
		            filteredList.add((ExamTemplate) exam);
		    //Update the question table with the filtered list
		    updateExamTable(filteredList);       
	 }
}
