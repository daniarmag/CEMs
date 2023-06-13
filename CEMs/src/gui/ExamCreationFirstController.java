package gui;

import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.ResourceBundle;
import client.ClientMessageHandler;
import client.ClientUI;
import control.AlertMessages;
import control.UserController;
import entities.Question;
import entities.User;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.MenuButton;
import javafx.scene.control.MenuItem;
import javafx.scene.control.SelectionMode;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;

/*A GUI for the for the first screen of exam creation.*/
public class ExamCreationFirstController implements Initializable
{
	public static User u;
	
    public static Map<String, ArrayList<String>> teachingMap;
    
    public static ArrayList<Question> questionArr;
	
    @FXML
    private Button exitBtn;

    @FXML
    private Button goBackBtn;
    
    @FXML
    private MenuButton subjectMenu;
    
    @FXML
    private MenuButton courseMenu;

    @FXML
    private TableView<Question> questionTable = new TableView<Question>();
    
    @FXML
    private TableColumn<Question, String> tableViewQusetionId;

    @FXML
    private TableColumn<Question, String> tableViewQusetionText;

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
		ScreenUtils.createNewStage("/gui/ExamCreationFirst.fxml").show();
	}
	
    /**
	 * Initializes the GUI with the given logic.
	 * @param location
	 * @param resources
	 */
	@Override
	public void initialize(URL location, ResourceBundle resources)
	{  
		ClientMessageHandler.setExamCreationFirstController(this);
		questionTable.getSelectionModel().setSelectionMode(SelectionMode.MULTIPLE);
		for (String s : teachingMap.keySet())
		{
			MenuItem m = new MenuItem(s);
			m.setOnAction(e -> selectSubject((MenuItem)e.getSource()));
			subjectMenu.getItems().add(m);
		}
	}
	
	/** 
	 * Exits from client GUI - disconnectes from DB aswell.
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
     * Moves on to next exam creation screen.
     * @param event
     */
    @FXML
    void next(ActionEvent event)
    {
    	HashMap<Boolean, String> errorMap = createErrorMap();
		if (errorMap.containsKey(true))
		{
			AlertMessages.makeAlert(errorMap.get(true), "Exam Creation");
		    return;
		}
    	UserController.hide(event);
    	try 
    	{
    		ArrayList<Question> info = new ArrayList<>();
    		info.addAll(questionTable.getSelectionModel().getSelectedItems());
    		setQuestionsSubject();
			ExamCreationSecondController.start(u, info, event);
		} catch (Exception e) {e.printStackTrace();}
    }
    
    /**
     * Sets subjects for question before passing the arrayList to the next list.
     */
    public void setQuestionsSubject()
    {
    	for (Question q : questionArr) q.setSubject(subjectMenu.getText().split("\\s+")[0]);
    }
    
	/**
	 * Setter.
	 * @param qArr
	 */
	public void setArr (ArrayList<Question> qArr)
	{
		questionArr = qArr;
	}
	 
	/**
	 * Method that handles the logic after a subject was chosen.
	 * @param m
	 */
	public void selectSubject(MenuItem m)
	{
		String selectedSubject = m.getText();
		subjectMenu.setText(selectedSubject);
		courseMenu.setText("");
		questionTable.getItems().clear();
		//Getting the courses of a certain subject.
		ArrayList<String> selectedValues = teachingMap.get(selectedSubject);
		courseMenu.getItems().clear();
		//Populating course menu button.
		for (String s : selectedValues)
		{
			MenuItem mi = new MenuItem(s);
			mi.setOnAction(e -> selectCourse((MenuItem)e.getSource()));
			courseMenu.getItems().add(mi);
		}
	}
	
	/**
	 * Method that handles the logic after a subject AND a course were chosen.
	 * @param m
	 */
	public void selectCourse(MenuItem m)
	{
	    String selectedCourse = m.getText();
	    courseMenu.setText(selectedCourse);
	    ArrayList<String> request = new ArrayList<String>();
	    String[] splitted = selectedCourse.split("\\s+");
	    request.add("load course questions");
	    request.add(splitted[0]);
	    ClientUI.chat.accept(request);
	    questionTable.getItems().clear();
	    populateQuestionTable();
	}
	
	/**
	 * Populates the table with all the question that belong to the exact subject and course.
	 */
	private void populateQuestionTable()
	{
	    tableViewQusetionId.setCellValueFactory(new PropertyValueFactory<>("id"));
	    tableViewQusetionText.setCellValueFactory(new PropertyValueFactory<>("questionText"));
	    ObservableList<Question> questionObservableList = FXCollections.observableArrayList(questionArr);
	    questionTable.setItems(questionObservableList);
	}

	/**
	 * @return a map with all kinds of error messages
	 */
	private HashMap<Boolean, String> createErrorMap() 
	{
	    HashMap<Boolean, String> errorMap = new HashMap<>();
	    
	    errorMap.put(questionTable.getSelectionModel().getSelectedItems().isEmpty(), "Question(s) is required");
	    errorMap.put(courseMenu.getText().isEmpty(), "Course is required");
	    errorMap.put(subjectMenu.getText().isEmpty(), "Subject is required.");
	    return errorMap;
	}
}
