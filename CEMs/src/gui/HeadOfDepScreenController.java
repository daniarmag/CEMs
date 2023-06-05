package gui;

import java.util.ArrayList;
import control.UserController;
import entities.HeadOfDepartment;
import entities.User;
import javafx.application.Platform;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.text.Text;

public class HeadOfDepScreenController
{
	private static StatisticsChooseScreenController statisticsScreen=new StatisticsChooseScreenController();
	//static examController ex=new examController();
	static HeadOfDepartment u;
    @FXML
    private Text Alert;

    @FXML
    private Button checkResBtn;

    @FXML
    private Button createExamBtn;

    @FXML
    private Button exitBtn;

    @FXML
    private Button logoutBtn;

    @FXML
    private Button manageQstBtn;

    @FXML
    private Text welcomeText;
    
	/*Exits the GUI window.*/
	/*disconnects from the server and exits from the GUI. */
    @FXML
    void exit(ActionEvent event) {
    	UserController.userExit(u);
    }

    @FXML
    void logout(ActionEvent event) {
    	UserController.hide(event);
    	
		ScreenUtils.createNewStage("/gui/LoginScreen.fxml").show();
		//UserController.logoutUser(u,event,path);
		UserController.logoutUser(u);
	}

    
    /** navigate to a screen where the user can chose which statistics he wants
     * @param event
     */
    @FXML
    void openStatistics(ActionEvent event) {
    	UserController.hide(event);
    	statisticsScreen.start(u);
    	
    	
    }
    
    

	public void start(User user) {
		u = (HeadOfDepartment) user;
		Platform.runLater(()-> ScreenUtils.createNewStage("/gui/HeadOfDepartmentScreen.fxml").show());
	}

	public void setStudentArr(ArrayList<?> msg) {
			u.setArrStudent(msg);
			//statisticController.showData(msg);
	}
}
	

