package gui;

import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.ResourceBundle;

import client.ChatClient;
import client.ClientUI;
import entities.Question;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.control.cell.TextFieldTableCell;
import javafx.util.converter.IntegerStringConverter;

public class QuestionBankController implements Initializable
{
	ArrayList<Question> qArr = new ArrayList<Question>();
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
    private TableColumn<Question, String> qtextTable;

    @FXML
    private TableColumn<Question, String> subjectTable;
    
    @FXML
    private TableView<Question> questionTable = new TableView<Question>();
    
    public void setArr (ArrayList<Question> qArr)
    {
    	this.qArr = qArr;
    }
    
    @FXML
    void update(ActionEvent event) throws IOException 
    {
        ObservableList<Question> updatedQuestions = FXCollections.observableArrayList(questionTable.getItems());
        qArr.clear();
        qArr.addAll(updatedQuestions);
        ClientUI.chat.accept(qArr);
    }


	@FXML
	void exit(ActionEvent event) 
	{
		ClientUI.chat.accept("disconnected");
    	ClientUI.chat.quit();
    	System.exit(0);
	}

	private void editableCols() 
	{
	    qnumTable.setCellFactory(TextFieldTableCell.forTableColumn(new IntegerStringConverter()));
	    qnumTable.setOnEditCommit(e -> {
	        Question question = e.getTableView().getItems().get(e.getTablePosition().getRow());
	        question.setQuestionNumber(e.getNewValue());
	        });
	    qtextTable.setCellFactory(TextFieldTableCell.forTableColumn());
	    qtextTable.setOnEditCommit(e -> {
	        Question question = e.getTableView().getItems().get(e.getTablePosition().getRow());
	        question.setQuestionText(e.getNewValue());
	    });
	    questionTable.setEditable(true);
	}



	
	public void updateQuestionTable() 
	{
        idTable.setCellValueFactory(new PropertyValueFactory<>("id"));
        qnumTable.setCellValueFactory(new PropertyValueFactory<>("questionNumber"));
        qtextTable.setCellValueFactory(new PropertyValueFactory<>("questionText"));
        authorTable.setCellValueFactory(new PropertyValueFactory<>("authorName"));
        cnameTable.setCellValueFactory(new PropertyValueFactory<>("courseName"));
        subjectTable.setCellValueFactory(new PropertyValueFactory<>("subject"));
        ObservableList<Question> questionObservableList = FXCollections.observableArrayList(qArr);
        questionTable.setItems(questionObservableList);
    }
	
	@Override
	public void initialize(URL location, ResourceBundle resources) 
	{
		ChatClient.setQuestionBankController(this);
		editableCols();
		ClientUI.chat.accept("Load questions");
		
	}

}
