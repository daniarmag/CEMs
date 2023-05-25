package gui;

import control.UserController;
import entities.User;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.Node;
import javafx.scene.control.Button;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.MenuButton;
import javafx.scene.control.RadioButton;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.scene.text.Text;

public class CreateQuestionScreenController
{
	public static User u;
	
	@FXML
	private TextField aAnswerText;

	@FXML
	private RadioButton aRadio;

	@FXML
	private TextField bAnswerText;

	@FXML
	private RadioButton bRadio;

	@FXML
	private TextField cAnswerText;

	@FXML
	private RadioButton cRadio;

	@FXML
	private ChoiceBox<?> courseChoiceBox;

	@FXML
	private TextField dAnswerText;

	@FXML
	private RadioButton dRadio;

	@FXML
	private Button goBackBtn;

	@FXML
	private Text questionNumberText;

	@FXML
	private TextArea questionTextArea;

	@FXML
	private MenuButton subjectMenu;

	@FXML
	private Button submitBtn;

	@FXML
	void goBack(ActionEvent event) 
	{
		((Node) event.getSource()).getScene().getWindow().hide();
		ScreenUtils.createNewStage("/gui/ProfessorScreen.fxml").show();
	}

	/**
	 * Initializes the JavaFX controller during application startup.
	 * 
	 * @param primaryStage The primary stage of the application.
	 * @param user
	 * @throws Exception
	 */
	public static void start(User user) throws Exception 
	{
		u = user;
		ScreenUtils.createNewStage("/gui/CreateQuestionScreen.fxml").show();
	}
	
	@FXML
	public void exit(ActionEvent event)
	{
		UserController.userExit(u);
	}
}
