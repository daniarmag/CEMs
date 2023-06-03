package gui;

import java.net.URL;
import java.util.ArrayList;
import java.util.Map;
import java.util.ResourceBundle;

import client.ClientUI;
import control.UserController;
import entities.Professor;
import entities.User;
import javafx.application.Platform;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.text.Text;

public class ProfessorScreenController implements Initializable 
{
	public static Professor u;
	
	
	@FXML
    private Button activateExamBtn;

    @FXML
    private Button checkResBtn;

    @FXML
    private Button createExamBtn;

    @FXML
    private Button manageQstBtn;

    @FXML
    private Button exitBtn;

    @FXML
    private Button logoutBtn;

    @FXML
    private Button viewReportBtn;

    @FXML
    private Text welcomeText;
	
	
	/**
	 * Initializes the JavaFX controller during application startup.
	 * @param primaryStage The primary stage of the application.
	 * @param user
	 * @throws Exception
	 */
	public void start(User user) throws Exception 
	{
		u = (Professor)user;
		Platform.runLater(()-> ScreenUtils.createNewStage("/gui/ProfessorScreen.fxml").show());
	}
	
	public void setTeachingMap(Map<String, ArrayList<String>> map)
	{
		u.setMap(map);
	}
	
	/*Exits the GUI window.*/
	/*disconnects from the server and exits from the GUI. */
    @FXML
    void exit(ActionEvent event) 
    {
    	UserController.userExit(u);
    }
    
    @FXML
    void logout(ActionEvent event)
    {
    	//needs to be chaned here and for student//- talk to matan
    	UserController.hide(event);
		ScreenUtils.createNewStage("/gui/LoginScreen.fxml").show();
		UserController.logoutUser(u);
    }

    @FXML
    void manageQuestions(ActionEvent event)
    {
    	
    	UserController.hide(event);
    	try 
    	{
			QuestionBankScreenController.start(u, u.getMap());
		} catch (Exception e) {e.printStackTrace();}
    }
    
    @FXML
    void createExam(ActionEvent event)
    {
    	UserController.hide(event);
    	try 
    	{
    		ExamCreationFirstController.start(u, u.getMap());
		} catch (Exception e) {e.printStackTrace();}
    }

	@Override
	public void initialize(URL location, ResourceBundle resources) 
	{
		welcomeText.setText("Welcome back " + u.getFirst_name());
		ArrayList<String> request = new ArrayList<String>();
		request.add("load teaching map");
		request.add(u.getUser_id());
		ClientUI.chat.accept(request);	
	}
}
