package gui;

import entities.User;
import javafx.application.Platform;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.text.Text;

public class HeadOfDepScreenController {
	static User u;
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

    @FXML
    void exit(ActionEvent event) {

    }

    @FXML
    void logout(ActionEvent event) {

    }

	public void start(User user) {
		u = user;
		Platform.runLater(()-> ScreenUtils.createNewStage("/gui/HeadOfDepartmentScreen.fxml").show());
	}

}

