package gui;

import java.net.URL;
import java.util.ArrayList;
import java.util.ResourceBundle;

import client.ClientMessageHandler;
import client.ClientUI;
import control.UserController;
import entities.User;
import javafx.application.Platform;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.text.Text;

/*A GUI for the student main menu.*/
public class StudentScreenController implements Initializable {
	public static User u;
	ArrayList<String> courses = new ArrayList<>();

	@FXML
	private Button exitBtn;

	@FXML
	private Button gradesAndCopiesBtn;

	@FXML
	private Button logoutBtn;

	@FXML
	private Button takeExamBtn;

	@FXML
	private Text welcomeText;
	
	

	/**
	 * Initializes the JavaFX controller during application startup.
	 * 
	 * @param primaryStage The primary stage of the application.
	 * @param user
	 * @throws Exception
	 */
	public void start(User user) throws Exception {
		u = user;
		Platform.runLater(() -> ScreenUtils.createNewStage("/gui/StudentScreen.fxml").show());
	}

	/* Exits the GUI window. */
	/* disconnects from the server and exits from the GUI. */
	@FXML
	void exit(ActionEvent event) {
		UserController.userExit(u);
	}

	/**
     * Logs out from the current user + sets the correct flag in the DB.
     * @param event
     */
	@FXML
	void logout(ActionEvent event) {
		UserController.hide(event);
		ScreenUtils.createNewStage("/gui/LoginScreen.fxml").show();
		UserController.logoutUser(u);
	}
	 /**
     * Starts the exam taking screen.
     * @param event
     */
	  @FXML
	    void takeExamBtn(ActionEvent event) {
		  UserController.hide(event);
	    	try 
	    	{
	    		StudentExamScreenController.start(u, courses);
			} catch (Exception e) {}
	    }
	  
	  /**
	   * Starts the student's grades screen.
	   * @param event
	   */
	  @FXML
	    void gradesAndCopiesBtn(ActionEvent event) {
		  UserController.hide(event);
	    	try 
	    	{
	    		StudentExamGradesController.start(u);
			} catch (Exception e) {}
	    }

	  /**
	   * Initializes the GUI with the given logic.
	   * @param location
	   * @param resources
	   */  
	@Override
	public void initialize(URL location, ResourceBundle resources) {
		ClientMessageHandler.setStudentScreenController(this);
		welcomeText.setText("Welcome back " + u.getFirst_name());
		ArrayList<String> request = new ArrayList<String>();
		request.add("load student courses");
		request.add(u.getUser_id());
		ClientUI.chat.accept(request);
	}
	
	/**
	 * Setter.
	 * @param cArr
	 */
	public void setArr (ArrayList<String> cArr)
	{
		courses = cArr;
	}

}
