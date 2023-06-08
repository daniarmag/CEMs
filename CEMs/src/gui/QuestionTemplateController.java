package gui;

import entities.Question;
import javafx.fxml.FXML;
import javafx.scene.control.RadioButton;
import javafx.scene.control.TextArea;
import javafx.scene.text.Text;

public class QuestionTemplateController {

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
	 * Sets text and disables typing.
	 * @param text the questionText to set
	 */
	public void setQuestionText(String text) 
	{
		questionText.setText(text);
		questionText.setEditable(false);
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
}
