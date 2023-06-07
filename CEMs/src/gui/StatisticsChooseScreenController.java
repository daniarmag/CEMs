package gui;

import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.ResourceBundle;
import java.util.function.Consumer;

import client.ClientMessageHandler;
import client.ClientUI;
import control.AlertMessages;
import control.UserController;
import control.guiMainController;
import entities.Course;
import entities.HeadOfDepartment;
import entities.Student;
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

public class StatisticsChooseScreenController implements Initializable {

	private static HeadOfDepartment user;
	private static Map<String, String> requsetMap = new HashMap<>();
	@FXML
	private Button courseChoose;
	@FXML
	private TableColumn<?, String> col1;

	private static ArrayList<?> array;
	@FXML
	private TableColumn<?, String> col2;
	@FXML
	private TableColumn<?, ?> col3;

	@FXML
	private Button professorChoose;

	@FXML
	private TextField searchBar;

	@FXML
	private Button searchBtn;
	@FXML
	private Button studentChoose;

	@FXML
	private TableView<?> tableInfo = new TableView<>();
	private static Map<String, Consumer<String>> functionMap;

	/**the function navigate to the proper function to fill the TableView
	 * with the data requested.
	 * @param navigateToFunctoin
	 */
	public void showData(String navigateToFunctoin) {
		try {
			functionMap.get(navigateToFunctoin).accept(navigateToFunctoin);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * this method will be activate from functionMap loading all the student or the
	 * professors in the tableView
	 */
	@SuppressWarnings("unchecked")
	public void LoadUserIntable(String str) {
		tableInfo.getItems().clear();
		array = (ArrayList<User>) user.getArray(str);
		Platform.runLater(() -> col1.setText("ID"));
		Platform.runLater(() -> col2.setText("Name"));
		Platform.runLater(() -> col3.setText("Last Name"));
		col1.setCellValueFactory(new PropertyValueFactory<>("user_id"));
		col2.setCellValueFactory(new PropertyValueFactory<>("first_name"));
		col3.setCellValueFactory(new PropertyValueFactory<>("last_name"));
		try {
		ObservableList<User> questionObservableList = (ObservableList<User>) FXCollections.observableArrayList(array);
		((TableView<User>) tableInfo).setItems(questionObservableList);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	
	@SuppressWarnings("unchecked")
	private void LoadCourseIntable(String str) {
		tableInfo.getItems().clear();
		array = (ArrayList<Course>)user.getArray(str);
		Platform.runLater(() -> col1.setText("ID"));
		Platform.runLater(() -> col2.setText("Name"));
		Platform.runLater(() -> col3.setText("Course ID"));
		col1.setCellValueFactory(new PropertyValueFactory<>("course_id"));
		col2.setCellValueFactory(new PropertyValueFactory<>("course_name"));
		col3.setCellValueFactory(new PropertyValueFactory<>("course_subject_id"));
		try {
		ObservableList<Course> questionObservableList = (ObservableList<Course>) FXCollections.observableArrayList(array);
		((TableView<Course>) tableInfo).setItems(questionObservableList);
		}catch(Exception e) {
			e.printStackTrace();
		}
		}
	
	/**
	 * @param e searching in the table
	 */
	@SuppressWarnings("unchecked")
	@FXML
	private void searchRow(ActionEvent e) {
		
		String searchField = searchBar.getText();
		for (User item : ((TableView<User>) tableInfo).getItems()) {
			if (item.getFirst_name().equals(searchField) || item.getLast_name().equals(searchField)) {
				((TableView<User>) tableInfo).getSelectionModel().select(item);
				((TableView<User>) tableInfo).scrollTo(item);
				return;
			}
		}
		AlertMessages.makeAlert("No such values", "Serach");
	}

	public void start(User u) {
		user = (HeadOfDepartment) u;
		Platform.runLater(() -> ScreenUtils.createNewStage("/gui/StatisticsChoosingScreen.fxml").show());

	}

	@FXML
	void goBack(ActionEvent event) {
		UserController.goBack(event, "/gui/HeadOfDepartmentScreen.fxml");
	}

	/**
	 * @param event Going to server to ask for data from the DB according to the
	 *              button pressed
	 */
	@FXML
	void loadData(ActionEvent event) {
		
		String buttonPressed = ((Button) event.getSource()).getText();
		String action = requsetMap.get(buttonPressed);
		if(user.getArray(action)==null) {
		ClientUI.chat.accept(action);
		}

	}

	/**
	 * initializing functionMap is a map between a string and a function that will
	 * run requestMap will go to the server with the proper query
	 * 
	 * @author czmat
	 */
	@Override
	public void initialize(URL location, ResourceBundle resources) {
		System.out.println(tableInfo.hashCode());
		ClientMessageHandler.setStatisticsChooseScreen(this);
		// guiMainController.setStatisticsChooseScreen(this);
		functionMap = new HashMap<>();
		functionMap.put("student", str -> LoadUserIntable(str));
		functionMap.put("professor", str -> LoadUserIntable(str));
		functionMap.put("course", str -> LoadCourseIntable(str));

		requsetMap.put("Choose professor", "Get all professors");
		requsetMap.put("choose student", "Get all students");
		requsetMap.put("Choose course", "Get all courses");
	}

	
	


}
