package gui;

import java.net.URL;
import java.util.ArrayList;
import java.util.ResourceBundle;

import client.ClientMessageHandler;
import client.ClientUI;
import control.UserController;
import entities.Course;
import entities.ExamTemplate;
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
import javafx.scene.image.ImageView;
import javafx.scene.text.Text;

public class ProfessorExamReportController implements Initializable{

    
    private static User user;
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

    public static void start(User u) {
    	try {
    	user=u;
			Platform.runLater(
					() -> ScreenUtils.createNewStage("/gui/ProfessorExamReportScreen.fxml").show());
    	
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    }
    
    public void loadTable(ArrayList<ExamTemplate> array) {
    	arr=array;
    	examTable.getItems().clear();
    	
		loadingColumns( "_name","_id", "course_id");
		try {
		@SuppressWarnings("unchecked")
		ObservableList<ExamTemplate> questionObservableList = 
				(ObservableList<ExamTemplate>) FXCollections.observableArrayList(arr);
		
		((TableView<ExamTemplate>) examTable).setItems(questionObservableList);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	private void loadingColumns( String examId, String name, String course) {
		try {
		examIdCol.setCellValueFactory(new PropertyValueFactory<>(examId));
		examNameCol.setCellValueFactory(new PropertyValueFactory<>(name));
		examCourseCol.setCellValueFactory(new PropertyValueFactory<>(course));		
			}catch(Exception e) {
				e.printStackTrace();
			}
	}
	
	
	
	@FXML
	public void GenerateReport(ActionEvent event) {
		currentEvent=event;
		Object item=examTable.getSelectionModel().getSelectedItem();
		itemChosen=item;
		ArrayList<String> request = new ArrayList<>();	
		request.add("generate full exam report");
		request.add(((ExamTemplate)item).get_id());
		ClientUI.chat.accept(request);
		//System.out.println(request.get(1));
	}
	
	
	
	
	
	
	
	/**
	 * Disconnects from the server and closes GUI window.
	 * @param event
	 */
	@FXML
	void exit(ActionEvent event) 
	{
		UserController.userExit(user);
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
 

	@Override
	public void initialize(URL location, ResourceBundle resources) {
		ClientMessageHandler.setProfessorExamReportController(this);
		ArrayList<String> arr=new ArrayList<>(); 
		String request="send all exams to professor";
		arr.add(request);
		arr.add(user.getUser_id());
		ClientUI.chat.accept(arr);
	}
	
	
	
	
	
}
