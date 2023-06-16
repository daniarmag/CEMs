package gui;

import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.ResourceBundle;
import java.util.function.Consumer;
import client.ClientMessageHandler;
import client.ClientUI;
import control.AlertMessages;
import control.UserController;
import entities.Course;
import entities.HaveID;
import entities.HeadOfDepartment;
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

public class StatisticsChooseScreenController implements Initializable
{
	private static ReportScreenController reportScreen = new ReportScreenController();

	static HeadOfDepartment user;
	
	private static ActionEvent event;
	
	private static Object itemChosen;

	private static Map<String, ArrayList<String>> requsetMap = new HashMap<>();
	
	private static Map<String, Consumer<String>> functionMap;// map that activate function

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
	private Button courseChoose;

	@FXML
	private Button studentChoose;

	@FXML
	private Button goBackBtn;

	@FXML
	private Button generateReportBtn;
	
	@FXML
	private TextField searchBar;
	
	@FXML
	private Button searchBtn;

	@FXML
	private TableView<?> tableInfo = new TableView<>();
	
	/**
	 * Initializes the JavaFX controller during application startup.
	 * @param user
	 * @throws Exception
	 */
	public void start(User u)
	{
		user = (HeadOfDepartment) u;
		Platform.runLater(() -> ScreenUtils.createNewStage("/gui/StatisticsChoosingScreen.fxml").show());

	}
	
	/**
	 * Initializes the GUI with the given logic.
	 * @param location
	 * @param resources
	 */
	@Override
	public void initialize(URL location, ResourceBundle resources) 
	{
		ClientMessageHandler.setStatisticsChooseScreen(this);
		functionMap = new HashMap<>();
		functionMap.put("student", str -> LoadUserIntable(str));
		functionMap.put("professor", str -> LoadUserIntable(str));
		functionMap.put("course", str -> LoadCourseIntable(str));
		requsetMap.put("professor", new ArrayList<>(Arrays.asList("Get all professors", user.getUser_id())));
		requsetMap.put("student", new ArrayList<>(Arrays.asList("Get all students", user.getUser_id())));
		requsetMap.put("course", new ArrayList<>(Arrays.asList("Get all courses", user.getUser_id())));
	}
	
	/**
	 * Goes back to the selected screen.
	 * @param event
	 */
	@FXML
	void goBack(ActionEvent event)
	{
		UserController.goBack(event, "/gui/HeadOfDepartmentScreen.fxml");
	}

	/**
	 * Exits from client GUI - disconnects from DB aswell.
	 * @param event
	 */
	@FXML
	void exit(ActionEvent event) 
	{
		UserController.userExit(user);
	}

	/**
	 * @param event Going to server to ask for data from the DB according to the
	 *              button pressed
	 */
	@FXML
	void loadData(ActionEvent event) 
	{

		String buttonPressed = ((Button) event.getSource()).getAccessibleText();
		try {
			ArrayList<String> action = requsetMap.get(buttonPressed);
			ArrayList<?> arr = user.getArray(buttonPressed);
			if (arr == null) {
				ClientUI.chat.accept(action);
			} else
				showData(buttonPressed);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * @param e searching in the table
	 */
	@FXML
	private void searchRow(ActionEvent e) 
	{

		String searchField = searchBar.getText().trim();

		if (tableInfo.getItems().get(0).getClass().equals(User.class)) {
			if (SearchUser(searchField))
				return;
		} else if (SearchCourse(searchField))
			return;

		AlertMessages.makeAlert("No such values", "Serach");
	}
	
	/**
	 * this function can distinguish between the types that been chosen
	 * @param e
	 */
	@FXML
	private void GenerateRepo(ActionEvent e)
	{
		event = e;
		Object item = tableInfo.getSelectionModel().getSelectedItem();
		if (item == null) {
			AlertMessages.makeAlert("You must chose before continue", "Report Allert");
			return;
		}
		itemChosen = item;
		Class<?> chooseClass = item.getClass();
		ArrayList<String> request = new ArrayList<>();
		request.add("for head of department report");
		if (chooseClass.equals(User.class)) {
			request.add(((User) item).getRole());
			request.add(((User) item).getUser_id());
		} else {
			request.add("gap");
			request.add(((Course) item).get_id());
		}
		ClientUI.chat.accept(request);
	}
	
	/**
	 * the function navigate to the proper function to fill the TableView with the
	 * data requested.
	 * @param navigateToFunctoin
	 */
	public void showData(String navigateToFunctoin) 
	{
		try 
		{
			functionMap.get(navigateToFunctoin).accept(navigateToFunctoin);
		} catch (Exception e) {e.printStackTrace();}
	}

	/**
	 * this method will be activate from functionMap loading all the student or the
	 * professors in the tableView
	 * @param str
	 */
	@SuppressWarnings("unchecked")
	public void LoadUserIntable(String str)
	{
		tableInfo.getItems().clear();
		array = (ArrayList<User>) user.getArray(str);
		loadingColumns("Last Name", "user_id", "first_name", "last_name");
		try {
			ObservableList<User> questionObservableList = (ObservableList<User>) FXCollections
					.observableArrayList(array);
			((TableView<User>) tableInfo).setItems(questionObservableList);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * loading all courses to the table
	 * @param str
	 */
	@SuppressWarnings("unchecked")
	private void LoadCourseIntable(String str)
	{
		tableInfo.getItems().clear();
		array = (ArrayList<Course>) user.getArray(str);
		loadingColumns("Subject ID", "_id", "course_name", "course_subject_id");
		try {
			ObservableList<Course> questionObservableList = (ObservableList<Course>) FXCollections
					.observableArrayList(array);
			((TableView<Course>) tableInfo).setItems(questionObservableList);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @param col_3
	 * @param propertyCol1
	 * @param propertyCol2
	 * @param propertyCol3 loading all the column to their appropriate data
	 */
	private void loadingColumns(String col_3, String propertyCol1, String propertyCol2, String propertyCol3) 
	{
		try {
			Platform.runLater(() -> col1.setText("ID"));
			Platform.runLater(() -> col2.setText("Name"));
			Platform.runLater(() -> col3.setText(col_3));
			col1.setCellValueFactory(new PropertyValueFactory<>(propertyCol1));
			col2.setCellValueFactory(new PropertyValueFactory<>(propertyCol2));
			col3.setCellValueFactory(new PropertyValueFactory<>(propertyCol3));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @param searchField
	 * @return true if find and mark and scroll to the searched User ( student or
	 *         professor)
	 */
	@SuppressWarnings("unchecked")
	private boolean SearchUser(String searchField)
	{
		for (User item : ((TableView<User>) tableInfo).getItems()) {
			String name = item.getFirst_name();
			String lastName = item.getLast_name();
			String Id = item.getUser_id();
			if (Id.equals(searchField) || name.equals(searchField) || lastName.equals(searchField)
					|| searchField.equals(name + " " + lastName)) {
				((TableView<User>) tableInfo).getSelectionModel().select(item);
				((TableView<User>) tableInfo).scrollTo(item);
				return true;
			}
		}
		return false;
	}

	/**
	 * @param searchField
	 * @return true if find and mark and scroll to the searched course
	 */
	@SuppressWarnings("unchecked")
	private boolean SearchCourse(String searchField) 
	{
		for (Course item : ((TableView<Course>) tableInfo).getItems()) {
			String Id = item.get_id();
			String name = item.getCourse_name();
			if (searchField.equals(Id) || searchField.equals(name)) {
				((TableView<Course>) tableInfo).getSelectionModel().select(item);
				((TableView<Course>) tableInfo).scrollTo(item);
				return true;
			}
		}
		return false;
	}

	/**
	 * check if the array is empty
	 * @param arr
	 */
	@SuppressWarnings("unchecked")
	public void openRep(Object arr)
	{

		if (((ArrayList<HaveID>) arr).get(0).get_id().equals("empty")) {
			AlertMessages.makeAlert("There is no data for this choice", "Report alert");
			return;
		}

		try {
			UserController.hide(event);
		} catch (Exception e) {
			e.printStackTrace();
		}
		reportScreen.start(event, arr, itemChosen, user);

	}
}
