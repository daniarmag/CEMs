package gui;

import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.ResourceBundle;

import javax.swing.JOptionPane;

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

/*A GUI for the question bank*/
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
    
    /*Updates the DB with the new question info.*/
    @FXML
    void update(ActionEvent event) throws IOException 
    {
        ObservableList<Question> updatedQuestions = FXCollections.observableArrayList(questionTable.getItems());
        qArr.clear();
        qArr.addAll(updatedQuestions);
        //Passing the array-list as an object to the server, which will handle the update.
        ClientUI.chat.accept(qArr);
        JOptionPane.showMessageDialog(null, "Question table updated!", "Update Questions", JOptionPane.INFORMATION_MESSAGE);
    }

    /*Disconnects from the server and closes GUI window.*/
	@FXML
	void exit(ActionEvent event) 
	{
		ClientUI.chat.accept("disconnected");
    	ClientUI.chat.quit();
    	System.exit(0);
	}

	/*Sets the columns of the table to be editable.*/
	private void editableCols() 
	{
		//Set the cell factory for the qnumTable column to use TextFieldTableCell with an IntegerStringConverter.
	    qnumTable.setCellFactory(TextFieldTableCell.forTableColumn(new IntegerStringConverter()));
	    //Set the onEditCommit event for qnumTable column.
	    qnumTable.setOnEditCommit(e -> {
	        Question question = e.getTableView().getItems().get(e.getTablePosition().getRow());
	        //Update the question number with the new value entered in the cell.
	        question.setQuestionNumber(e.getNewValue());
	        });
	    qtextTable.setCellFactory(TextFieldTableCell.forTableColumn());
	    qtextTable.setOnEditCommit(e -> {
	        Question question = e.getTableView().getItems().get(e.getTablePosition().getRow());
	        question.setQuestionText(e.getNewValue());
	    });
	    questionTable.setEditable(true);
	}

	/*Sets the question table with the values that are currently in the qArr.*/
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
	
	/*Initializes the GUI with the questions from the database.*/
	@Override
	public void initialize(URL location, ResourceBundle resources) 
	{
		ChatClient.setQuestionBankController(this);
		editableCols();
		ClientUI.chat.accept("load questions");	
	}

}
