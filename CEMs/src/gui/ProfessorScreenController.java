package gui;

import java.net.URL;
import java.util.ResourceBundle;
import control.UserController;
import entities.User;
import javafx.application.Platform;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.Node;
import javafx.scene.control.Button;
import javafx.scene.text.Text;
import message.ClientMessageHandler;


public class ProfessorScreenController implements Initializable 
{
	public static User u;
	
	@FXML
    private Button activateExamBtn;

    @FXML
    private Button checkResBtn;

    @FXML
    private Button createExamBtn;

    @FXML
    private Button createQstBtn;

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
		u = user;
		Platform.runLater(()-> ScreenUtils.createNewStage("/gui/ProfessorScreen.fxml").show());
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
//    	((Node) event.getSource()).getScene().getWindow().hide();
    	UserController.Hide(event);
		ScreenUtils.createNewStage("/gui/LoginScreen.fxml").show();
		UserController.logoutUser(u);
    }

    @FXML
    void createQuestion(ActionEvent event)
    {
//    	((Node) event.getSource()).getScene().getWindow().hide();
    	UserController.Hide(event);
    	try {
			CreateQuestionScreenController.start(u);
		} catch (Exception e) {}
    }

	@Override
	public void initialize(URL location, ResourceBundle resources) 
	{
		welcomeText.setText("Welcome back " + u.getFirst_name());
	}
}
