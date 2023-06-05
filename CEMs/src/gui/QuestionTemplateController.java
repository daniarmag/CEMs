package gui;

import javafx.fxml.FXML;
import javafx.scene.control.RadioButton;
import javafx.scene.control.TextArea;

public class QuestionTemplateController {

    @FXML
    private RadioButton answer1;

	@FXML
    private RadioButton answer2;

    @FXML
    private RadioButton answer3;

    @FXML
    private RadioButton answer4;

    @FXML
    private TextArea questiontest;
    

    
    
    public boolean getAnswer1() {
		return answer1.isSelected();
	}


	public boolean getAnswer2() {
		return answer2.isSelected();
	}

	

	public boolean getAnswer3() {
		return answer3.isSelected();
	}

	

	public boolean getAnswer4() {
		return answer4.isSelected();
	}

	

	public String getQuestiontest() {
		return questiontest.getText();
	}
	
	public void SetText(String text) {
		questiontest.setText(text);
	}

	
    
    
    
    
    

}
