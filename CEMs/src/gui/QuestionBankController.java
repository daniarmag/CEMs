package gui;

import java.net.URL;
import java.util.ResourceBundle;

import client.ClientUI;
import entities.Question;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.TableColumn;

public class QuestionBankController implements Initializable
{

	@FXML
	private Button exitBtn;

	@FXML
	private Button updateBtn;

    @FXML
    private TableColumn<Question, String> authorTable;

    @FXML
    private TableColumn<Question, String> cnameTable;;

    @FXML
    private TableColumn<Question, String> idTable;

    @FXML
    private TableColumn<Question, Integer> qnumTable;

    @FXML
    private TableColumn<Question, String>qtextTable;

    @FXML
    private TableColumn<Question, String> subjectTable;
    
	@FXML
	void update(ActionEvent event)
	{
		
	}

	@FXML
	void exit(ActionEvent event) 
	{
		ClientUI.chat.accept("disconnected");
    	ClientUI.chat.quit();
    	System.exit(0);
	}

	@Override
	public void initialize(URL location, ResourceBundle resources) 
	{
		// TODO Auto-generated method stub
		
	}

}
