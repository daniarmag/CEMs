package gui;

import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.MenuButton;
import javafx.scene.control.RadioButton;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.scene.image.ImageView;
import javafx.scene.text.Text;

public class CreateQuestionScreenController 
{

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
    private ImageView logoutBtn;

    @FXML
    private Text questionNumberText;

    @FXML
    private TextArea questionTextArea;

    @FXML
    private MenuButton subjectMenu;

    @FXML
    private Button submitBtn;

}
