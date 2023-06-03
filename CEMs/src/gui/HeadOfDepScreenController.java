package gui;

import java.net.URL;
import java.util.ArrayList;
import java.util.ResourceBundle;

import client.ClientMessageHandler;
import control.UserController;
import entities.HeadOfDepartment;
import entities.Student;
import entities.User;
import javafx.application.Platform;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.text.Text;

public class HeadOfDepScreenController
{
	static statisticsChoseScreenController statisticController=new statisticsChoseScreenController();
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

    
    @FXML
    void openStatistics(ActionEvent event) {
    	UserController.hide(event);
    	
    	ClientMessageHandler.openstatisticsScreen(u);
    	
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
	

