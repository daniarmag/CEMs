package gui;

import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Map;
import java.util.ResourceBundle;
import javax.swing.JOptionPane;

import client.ClientMessageHandler;
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

/*A GUI for the question bank*/
public class QuestionBankScreenController implements Initializable
{
	public ArrayList<Question> qArr = new ArrayList<Question>();
	
	public static Map<String, ArrayList<String>> teachingMap;
	
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
     * @param teachingMap 
	 * @throws Exception
	 */
	public static void start(User user, Map<String, ArrayList<String>> map) throws Exception 
	{
		u = user;
		teachingMap = map;
		Platform.runLater(()-> ScreenUtils.createNewStage("/gui/QuestionBankScreen.fxml").show());
	}
    
    /*Updates the DB with the new question info.*/
    @FXML
    void editQuestion(ActionEvent event) throws IOException 
    {
    	Question selectedQuestion = questionTable.getSelectionModel().getSelectedItem();
        
        if (selectedQuestion != null) 
        {
        	UserController.hide(event);
        	try 
        	{
    			EditQuestionScreenController.start(u, selectedQuestion);
    		} catch (Exception e) {}
        } 
        else 
            JOptionPane.showMessageDialog(null, "Select a question to edit.", "Update Questions", JOptionPane.INFORMATION_MESSAGE);

    }
    
    /*Adds the DB with the new question info.*/
    @FXML
    void addQuestion(ActionEvent event) throws IOException 
    {
    	UserController.hide(event);
    	try 
    	{
			CreateQuestionScreenController.start(u, teachingMap);
		} catch (Exception e) {}
    }
    
    /*Deleted the question from the DB.*/
    @FXML
    void deleteQuestion(ActionEvent event) throws IOException 
    {
	Question selectedQuestion = questionTable.getSelectionModel().getSelectedItem();
        
        if (selectedQuestion != null) 
        {
        	ArrayList<String> request = new ArrayList<String>();
    		request.add("delete question");
    		request.add(selectedQuestion.getId());
    		ClientUI.chat.accept(request);
    		questionTable.getItems().remove(selectedQuestion);
        } 
        else 
            JOptionPane.showMessageDialog(null, "Select a question to delete.", "Update Questions", JOptionPane.INFORMATION_MESSAGE);
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
		UserController.goBack(event, "/gui/ProfessorScreen.fxml");
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
