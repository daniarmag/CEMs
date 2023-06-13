package gui;

import java.net.URL;
import java.util.HashMap;
import java.util.ResourceBundle;

import entities.Question;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.RadioButton;
import javafx.scene.control.TextArea;
import javafx.scene.control.ToggleGroup;
import javafx.scene.text.Text;

public class QuestionTemplateController implements Initializable
{

    @FXML
    private RadioButton aRadio;

    @FXML
    private RadioButton bRadio;

    @FXML
    private RadioButton cRadio;

    @FXML
    private RadioButton dRadio;

    @FXML
    private TextArea questionText;

    @FXML
    private Text textFieldA;

    @FXML
    private Text textFieldB;

    @FXML
    private Text textFieldC;

    @FXML
    private Text textFieldD;
    
    @FXML
    private Text questionNumText;
    
    /**
	 * Initializes the GUI with the given logic.
	 * @param location
	 * @param resources
	 */
	@Override
	public void initialize(URL location, ResourceBundle resources)
	{
		ToggleGroup toggleGroup = new ToggleGroup();
	    aRadio.setToggleGroup(toggleGroup);
	    bRadio.setToggleGroup(toggleGroup);
	    cRadio.setToggleGroup(toggleGroup);
	    dRadio.setToggleGroup(toggleGroup);
	}

	/**
	 * Sets text and disables typing.
	 * @param text the questionText to set
	 */
	public void setQuestionText(String text) 
	{
		questionText.setText(text);
		questionText.setEditable(false);
		questionText.setStyle("-fx-opacity: 1; -fx-background-color: white; -fx-text-fill: black;");
	}	
	
	/**
	 * Setting question info.
	 * @param q
	 */
	public void questionHandler(Question q)
	{
		setQuestionText(q.getQuestionText());
		textFieldA.setText(q.getAnswers()[0]);
		textFieldB.setText(q.getAnswers()[1]);
		textFieldC.setText(q.getAnswers()[2]);
		textFieldD.setText(q.getAnswers()[3]);
	}

	/**
	 * @return the question text
	 */
	public String getQuestionText() 
	{
		return questionText.getText();
	}
	
	/**
	 * Setter.
	 * @param text
	 */
	public void setQuestionNumText(String text)
	{
		questionNumText.setText(text);
	}
	
	/**
	 * @return an answer map, where the only true key is the selected radio
	 */
	private HashMap<Boolean, String> createAnswerMap() 
	{
	    HashMap<Boolean, String> answerMap = new HashMap<>();
	    answerMap.put(aRadio.isSelected(), "1");
	    answerMap.put(bRadio.isSelected(), "2");
	    answerMap.put(cRadio.isSelected(), "3");
	    answerMap.put(dRadio.isSelected(), "4");
	    return answerMap;
	}

	/**
	 * @return the selected answer.
	 */
	public String getSelectedAnswer()
	{
		return createAnswerMap().get(true);
	}
	
	/**
	 * @return true/false depending on if an answer was left unanswered
	 */
	public boolean checkIfAnswersEmpty()
	{
		return !aRadio.isSelected() && !bRadio.isSelected() && !cRadio.isSelected() && !dRadio.isSelected();
	}
}
