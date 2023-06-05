package gui;

import java.net.URL;
import java.util.ArrayList;
import java.util.ResourceBundle;
import client.ClientMessageHandler;
import control.UserController;
import entities.User;
import javafx.application.Platform;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;

public class StudentExamScreenController implements Initializable
{

	public static User u;

    @FXML
    private Button addQstnBtn;

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
    
    public static void start(User user) throws Exception {
		u = user;
		Platform.runLater(() -> ScreenUtils.createNewStage("/gui/StudentExamScreen.fxml").show());
	}
    @FXML
    void enterExam(ActionEvent event) {

    }

    @FXML
    void exit(ActionEvent event)  {
    	UserController.userExit(u);
    }

    @FXML
    void goBack(ActionEvent event)  {
    	UserController.goBack(event, "/gui/StudentScreen.fxml");
    }

	@Override
	public void initialize(URL location, ResourceBundle resources) {
		ClientMessageHandler.setStudentExamController(this);
		ArrayList<String> request = new ArrayList<String>();
		request.add("load student exams");
		request.add(u.getUser_id());
		//ClientUI.chat.accept(request);	
		
	}

}
