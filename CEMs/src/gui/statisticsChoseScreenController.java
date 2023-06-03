package gui;




import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;
import java.util.function.Consumer;
import java.util.function.Function;

import client.ClientMessageHandler;
import client.ClientUI;
import control.UserController;
import entities.HeadOfDepartment;
import entities.Question;
import entities.Student;
import entities.User;
import javafx.application.Platform;
import javafx.collections.FXCollections;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.SelectionMode;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.control.cell.PropertyValueFactory;


public class statisticsChoseScreenController implements Initializable{

	private static HeadOfDepartment user;
	private static Map<String,String> requsetMap=new HashMap<>();;
	@FXML
	private Button courseChoose;
	@FXML
	private TableColumn<Student, String> col1;

	private static ArrayList<Student> array;
	@FXML
	private TableColumn<Student, String> col2;

	@FXML
	private Button professorChoose;

	@FXML
	private TextField searchBar;

	@FXML
	private Button searchBtn;
	private ClientMessageHandler handler;

	@FXML
	private Button studentChoose;

	@FXML
	private TableView<Student> tableInfo;
	private static Map<String,Consumer> functionMap;
	@SuppressWarnings("unchecked")
	
	public void showData(String navigateToFunctoin) {
		
		functionMap.get(navigateToFunctoin).accept(null);;
	      

	}

	public void LoadStudentIntable() {
		array=(ArrayList<Student>) user.getAllStudent();
		col1.setCellValueFactory(new PropertyValueFactory<>("user_id"));
		col2.setCellValueFactory(new PropertyValueFactory<>("first_name"));
	    for ( Student q : array)
	    {
	        tableInfo.getItems().addAll(q);
	    }
	}
	
	public void start(User u) {
		user=(HeadOfDepartment)u;
		Platform.runLater(() -> ScreenUtils.createNewStage("/gui/headStatisticsChoose.fxml").show());
		requsetMap.put("Choose professor", "Get all professors");
		requsetMap.put("choose student", "Get all students");
		requsetMap.put("Choose course","Get all courses");
	}	

	@FXML
	void goBack(ActionEvent event) 
	{
		UserController.goBack(event, "/gui/HeadOfDepartmentScreen.fxml");
	}
	
	
	@FXML
	void loadData(ActionEvent event) {
		
		String action=((Button)event.getSource()).getText();
		ClientUI.chat.accept(requsetMap.get(action));
		
	}

	@Override
	public void initialize(URL location, ResourceBundle resources) {
	System.out.println(tableInfo.hashCode());
	ClientMessageHandler.setStatisticsChooseScreen(this);
	functionMap =new HashMap<>();
	functionMap.put("student",(e)->LoadStudentIntable());
	
	}
	






	
	
	
	
	
}


