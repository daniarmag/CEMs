package gui;

import java.net.URL;
import java.util.ArrayList;
import java.util.Map;
import java.util.ResourceBundle;
import client.ClientMessageHandler;
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

/*A GUI for the professor main menu.*/
public class ProfessorScreenController implements Initializable 
{
	
	
	public static Professor<?, ?> u;
	
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
	 * @param user
	 * @throws Exception
	 */
	public void start(User user) throws Exception 
	{
		u = (Professor<?, ?>)user;
		Platform.runLater(()-> ScreenUtils.createNewStage("/gui/ProfessorScreen.fxml").show());
	}
	
    /**
	 * Initializes the GUI with the given logic.
	 * @param location
	 * @param resources
	 */
	@Override
	public void initialize(URL location, ResourceBundle resources) 
	{
		ClientMessageHandler.setProfessorController(this);
		welcomeText.setText("Welcome back " + u.getFirst_name());
		ArrayList<String> request = new ArrayList<String>();
		request.add("load teaching map");
		request.add(u.getUser_id());
		ClientUI.chat.accept(request);	
	}
	
	/*Exits the GUI window.*/
	/*disconnects from the server and exits from the GUI. */
    @FXML
    void exit(ActionEvent event) 
    {
    	UserController.userExit(u);
    }
    
    /**
     * Logs out from the current user + sets the correct flag in the DB.
     * @param event
     */
    @FXML
    void logout(ActionEvent event)
    {
    	//needs to be chaned here and for student//- talk to matan
    	UserController.hide(event);
		ScreenUtils.createNewStage("/gui/LoginScreen.fxml").show();
		UserController.logoutUser(u);
    }
    
    /**
     * Starts the question managing screen.
     * @param event
     */
    @FXML
    void manageQuestions(ActionEvent event)
    {
    	UserController.hide(event);
    	try 
    	{
			QuestionBankScreenController.start(u, u.getMap());
		} catch (Exception e) {e.printStackTrace();}
    }
    
    /**
     * Starts the exam creation screen.
     * @param event
     */
    @FXML
    void createExam(ActionEvent event)
    {
    	UserController.hide(event);
    	try 
    	{
    		ExamCreationFirstController.start(u, u.getMap());
		} catch (Exception e) {e.printStackTrace();}
    }
    
    /**
     * Starts the exam creation screen.
     * @param event
     */
    @FXML
    void manageExams(ActionEvent event)
    {
    	UserController.hide(event);
    	try 
    	{
    		ExamBankScreenController.start(u, u.getMap());
		} catch (Exception e) {e.printStackTrace();}
    }
    
    /**
     * Starts the exam result screen.
     * @param event
     */
    @FXML
    void checkResults(ActionEvent event)
    {
    	UserController.hide(event);
    	try 
    	{
    		ExamResultsScreenController.start(u);
		} catch (Exception e) {e.printStackTrace();}
    }
    
	/**
	 * Setter.
	 * @param map
	 */
	public void setTeachingMap(Map<?,?> map)
	{
		u.setMap(map);
	}
	
	
	
	@FXML
	public void viewReport(ActionEvent event) {
		UserController.hide(event);
		try {
		 ProfessorExamReportController.start(u);	
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	

	
	
}
