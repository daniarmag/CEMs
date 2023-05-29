package gui;

import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.ResourceBundle;
import javax.swing.JOptionPane;
import client.ClientUI;
import control.UserController;
import entities.Question;
import entities.User;
import javafx.application.Platform;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;
import message.ClientMessageHandler;

/*A GUI for the question bank*/
public class QuestionBankScreenController implements Initializable
{
	ArrayList<Question> qArr = new ArrayList<Question>();
	
	public static User u;
	
	@FXML
	private Button exitBtn;

	@FXML
	private Button updateBtn;
	
	@FXML
    private Button addQstnBtn;

    @FXML
    private TableColumn<Question, String> authorTable;

    @FXML
    private TableColumn<Question, String> idTable;

    @FXML
    private TableColumn<Question, String> qnumTable;

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
    
    /**
	 * Initializes the JavaFX controller during application startup.
	 * @param primaryStage The primary stage of the application.
	 * @param user
	 * @throws Exception
	 */
	public static void start(User user) throws Exception 
	{
		u = user;
		Platform.runLater(()-> ScreenUtils.createNewStage("/gui/QuestionBankScreen.fxml").show());
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
    
    /*Adds the DB with the new question info.*/
    @FXML
    void addQuestion(ActionEvent event) throws IOException 
    {
    	UserController.Hide(event);
    	try 
    	{
			CreateQuestionScreenController.start(u);
		} catch (Exception e) {}
    }

    /*Disconnects from the server and closes GUI window.*/
	@FXML
	void exit(ActionEvent event) 
	{
		UserController.userExit(u);
	}

	/*Sets the question table with the values that are currently in the qArr.*/
	public void updateQuestionTable() 
	{
		idTable.setCellValueFactory(new PropertyValueFactory<>("id"));
	    qnumTable.setCellValueFactory(new PropertyValueFactory<>("questionNumber"));
	    qtextTable.setCellValueFactory(new PropertyValueFactory<>("questionText"));
	    authorTable.setCellValueFactory(new PropertyValueFactory<>("author"));
	    subjectTable.setCellValueFactory(new PropertyValueFactory<>("subject"));
	    ObservableList<Question> questionObservableList = FXCollections.observableArrayList(qArr);
	    questionTable.setItems(questionObservableList);
    }
	
	@FXML
	void goBack(ActionEvent event) 
	{
		
		UserController.Hide(event);
		ScreenUtils.createNewStage("/gui/ProfessorScreen.fxml").show();
	}
	
	/*Initializes the GUI with the questions from the database.*/
	@Override
	public void initialize(URL location, ResourceBundle resources) 
	{
		ClientMessageHandler.setQuestionBankController(this);
		ArrayList<String> request = new ArrayList<String>();
		request.add("load professor questions");
		request.add(u.getUser_id());
		ClientUI.chat.accept(request);	
	}

}
