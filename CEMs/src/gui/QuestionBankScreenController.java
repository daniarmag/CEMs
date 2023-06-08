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
	
	public static boolean isValidRemoval = true;
	
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
    
    /**
	 * Initializes the JavaFX controller during application startup.
	 * @param user
	 * @param map
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public static void start(User user, Map<?, ?> map) throws Exception 
	{
		u = user;
		teachingMap = (Map<String, ArrayList<String>>) map;
		Platform.runLater(()-> ScreenUtils.createNewStage("/gui/QuestionBankScreen.fxml").show());
	}
    
	/**
	 * Initializes the GUI with the given logic.
	 * @param location
	 * @param resources
	 */
	@Override
	public void initialize(URL location, ResourceBundle resources) 
	{
		ClientMessageHandler.setQuestionBankController(this);
		ArrayList<String> request = new ArrayList<String>();
		//A call to load all professor questions.
		request.add("load professor questions");
		request.add(u.getUser_id());
		ClientUI.chat.accept(request);	
	}

	/**
	 * Disconnects from the server and closes GUI window.
	 * @param event
	 */
	@FXML
	void exit(ActionEvent event) 
	{
		UserController.userExit(u);
	}
	
	/**
	 * Goes back to professor main screen.
	 * @param event
	 */
	@FXML
	void goBack(ActionEvent event) 
	{	
		UserController.goBack(event, "/gui/ProfessorScreen.fxml");
	}
	
    /**
     * Updates the DB with the new question info.
     * @param event
     * @throws IOException
     */
    @FXML
    void editQuestion(ActionEvent event) throws IOException 
    {
    	Question selectedQuestion = questionTable.getSelectionModel().getSelectedItem();
        
    	//Condition to make sure that a question to edit was indeed selected.
        if (selectedQuestion != null) 
        {
        	UserController.hide(event);
        	try 
        	{
    			QuestionEditScreenController.start(u, selectedQuestion);
    		} catch (Exception e) {}
        } 
        else 
            JOptionPane.showMessageDialog(null, "Select a question to edit.", "Update Questions", JOptionPane.INFORMATION_MESSAGE);
    }
    
    /**
     * Adds the DB with the new question info.
     * @param event
     * @throws IOException
     */
    @FXML
    void addQuestion(ActionEvent event) throws IOException 
    {
    	UserController.hide(event);
    	try 
    	{
			QuestionCreationScreenController.start(u, teachingMap);
		} catch (Exception e) {}
    }
    
    /**
     * Deletes the question from the DB.
     * @param event
     * @throws IOException
     */
    @FXML
    void deleteQuestion(ActionEvent event) throws IOException 
    {
	Question selectedQuestion = questionTable.getSelectionModel().getSelectedItem();
        
		//Condition to make sure that a question to delete was indeed selected.
        if (selectedQuestion != null) 
        {
        	ArrayList<String> request = new ArrayList<String>();
    		request.add("delete question");
    		request.add(selectedQuestion.getId());
    		ClientUI.chat.accept(request);
    		if(isValidRemoval)
    			questionTable.getItems().remove(selectedQuestion);
        } 
        else 
            JOptionPane.showMessageDialog(null, "Select a question to delete.", "Update Questions", JOptionPane.INFORMATION_MESSAGE);
    }

	/**
	 * Sets the question table with the values that are currently in the qArr. 
	 */
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
	
	/**
     * Setter.
     * @param qArr
     */
    public void setArr (ArrayList<Question> qArr)
    {
    	this.qArr = qArr;
    }
    
    /**
     * Setter.
     * @param flag
     */
    public void setRemovalFlag (boolean removalFlag)
    {
    	isValidRemoval = removalFlag;
    }
}
