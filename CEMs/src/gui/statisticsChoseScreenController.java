package gui;




import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;

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


	@FXML
	private Button studentChoose;

	@FXML
	private TableView<Student> tableInfo=new TableView<Student>();

	@FXML
	public void showData(ArrayList<Student> arr) {
		array=arr;
		System.out.println(tableInfo.hashCode());
		System.out.println("check 2" + array.get(0));
		
	try {
		
		col1.setCellValueFactory(new PropertyValueFactory<>("user_id"));
		col2.setCellValueFactory(new PropertyValueFactory<>("first_name"));
	}catch(Exception e) {e.printStackTrace();}
		System.out.println("\n\n"+array.get(0).getFirst_name()+"check of name ");
		
	    for ( Student q : array)
	    {
	    	System.out.println(q.getFirst_name() + "in loop check");
	        //String questionId = splitted[0].trim();
	        //String questionText = splitted[1].trim();
	    	//System.out.println("\n\n"+splitted+"check");
	    	Student s=new Student(q.getUser_id(),q.getFirst_name(),null,null,null,null,null);
	        tableInfo.getItems().addAll(s);
	      
	    }
//	    try {
//	    
//        // Create columns
//        TableColumn<Student, String> firstNameColumn = new TableColumn<>("ID");
//        firstNameColumn.setCellValueFactory(new PropertyValueFactory<>("user_id"));
//
//        TableColumn<Student, String> lastNameColumn = new TableColumn<>("First name");
//        lastNameColumn.setCellValueFactory(new PropertyValueFactory<>("first_name"));
//
//        // Add columns to the TableView
//        tableInfo.getColumns().addAll(firstNameColumn, lastNameColumn);
//        tableInfo.refresh();
//	    }catch(Exception e) {e.printStackTrace();}
//       

        // Set the items in the TableView
       // tableView.setItems(FXCollections.observableArrayList(array));
	    
	    
		//System.out.println(arr.get(0));
	    
	   
//	    for (String q : questionArr)
//	    {
//	        String[] splitted = q.split("-");
//	        String questionId = splitted[0].trim();
//	        String questionText = splitted[1].trim();
//	        Question ques=new Question(null, questionId, null, questionText, null, null, null, null);
//	        questionTable.getItems().addAll(ques);
//	      
//	    }
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
	
	}
	





	
	
	
	
	
}


