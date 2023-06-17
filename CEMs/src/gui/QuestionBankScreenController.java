package gui;

import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.ResourceBundle;
import client.ClientMessageHandler;
import client.ClientUI;
import control.AlertMessages;
import control.UserController;
import entities.HeadOfDepartment;
import entities.Professor;
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
import javafx.scene.control.TextField;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.input.KeyEvent;
import javafx.scene.text.Text;

/*A GUI for the question bank*/
public class QuestionBankScreenController implements Initializable
{
	public ArrayList<Question> qArr = new ArrayList<>();
	
	public static User u;
	
	public static boolean isValidRemoval = true;
	
	private static Map<Class<?>,String> map;
	
	private static Map<Class<?>,String> path;
	
	static
	{
		map =new HashMap<>();
		path =new HashMap<>();
		map.put(Professor.class,"load professor questions");
		map.put(HeadOfDepartment.class, "load all department questions");
		path.put(HeadOfDepartment.class, "/gui/HeadOfDepartmentScreen.fxml");
		path.put(Professor.class, "/gui/ProfessorScreen.fxml");
	}
	
	@FXML
	private ImageView manageQuestionLabel;
	
    @FXML
    private ImageView faceImage;
	
	@FXML
	private Button exitBtn;

    @FXML
    private Button deleteBtn;

    @FXML
    private Button editBtn;

    @FXML
    private Button addQstnBtn;
	
	@FXML
	private TextField searchBar;

    @FXML
    private Text idTXT;

    @FXML
    private Text nameTXT;
    
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
	public static void start(User user) throws Exception 
	{
		u = user;
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
		request.add(map.get(u.getClass()));
		if(u instanceof HeadOfDepartment)
			initToHead();
		nameTXT.setText(u.get_fullName());
		idTXT.setText(u.getUser_id());
		request.add(u.getUser_id());
		ClientUI.chat.accept(request);
		searchBar.setOnKeyReleased(event -> search(event));
	}

	/**
	 * If the user is an instance of head, different initialization
	 */
	private void initToHead() 
	{
		
		addQstnBtn.setVisible(false);
		deleteBtn.setVisible(false);
		editBtn.setVisible(false);
		faceImage.setImage(new Image("\\images\\manager.png"));
		manageQuestionLabel.setImage(new Image("\\images\\AccessAllQuestionsLabel.png"));
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
		UserController.goBack(event,path.get(u.getClass()));
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
        	 AlertMessages.makeAlert("Select a question to edit.", "Update Questions");
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
			QuestionCreationScreenController.start(u);
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
        	 AlertMessages.makeAlert("Select a question to delete.", "Update Questions");
    }

	/**
	 * Sets the question table with the values that are currently in the qArr. 
	 * @param arrayList 
	 */
	public void updateQuestionTable(ArrayList<Question> arrayList) 
	{
		idTable.setCellValueFactory(new PropertyValueFactory<>("id"));
	    qnumTable.setCellValueFactory(new PropertyValueFactory<>("questionNumber"));
	    qtextTable.setCellValueFactory(new PropertyValueFactory<>("questionText"));
	    authorTable.setCellValueFactory(new PropertyValueFactory<>("author"));
	    subjectTable.setCellValueFactory(new PropertyValueFactory<>("subject"));
	    ObservableList<Question> questionObservableList = FXCollections.observableArrayList(arrayList);
	    questionTable.setItems(questionObservableList);
    }
	
	/**
	 * This method is called when a key is released and filters the table.
	 * @param event
	 */
	void search(KeyEvent event)
	{
		 String searchText = searchBar.getText().toLowerCase();
		    //Filter the question list based on the search text
		    ArrayList<Question> filteredList = new ArrayList<>();
		    for (Question question : qArr)
		        if (question.getSubject().toLowerCase().contains(searchText))
		            filteredList.add(question);
		    //Update the question table with the filtered list
		    updateQuestionTable(filteredList);       
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
