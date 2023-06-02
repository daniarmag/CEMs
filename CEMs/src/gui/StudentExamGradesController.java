package gui;

import control.UserController;
import entities.User;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;

public class StudentExamGradesController {

	public static User u;

    @FXML
    private Button exitBtn;

    @FXML
    private Button goBackBtn;

    @FXML
    private TableColumn<?, ?> idTable;

    @FXML
    private TableColumn<?, ?> qnumTable;

    @FXML
    private TableColumn<?, ?> qtextTable;

    @FXML
    private TableView<?> questionTable;

    @FXML
    void enterExam(ActionEvent event) {

    }

    @FXML
    void getCopy(ActionEvent event) {

    }

    /* Exits the GUI window. */
	/* disconnects from the server and exits from the GUI. */
	@FXML
	void exit(ActionEvent event) {
		UserController.userExit(u);
	}
	
    @FXML
    void goBack(ActionEvent event) {
		UserController.goBack(event, "/gui/StudentScreen.fxml");
    }
    
    public static void start(User user) throws Exception 
	{
		u = user;
		ScreenUtils.createNewStage("/gui/StudentExamGrades.fxml").show();
	}

}
