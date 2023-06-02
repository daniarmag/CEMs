package gui;

import java.net.URL;
import java.util.ArrayList;
import java.util.Map;
import java.util.ResourceBundle;
import client.ClientUI;
import control.UserController;
import entities.Question;
import entities.User;
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

public class ExamCreationFirstController implements Initializable
{
	public static User u;
	
    public static Map<String, ArrayList<String>> teachingMap;
    
    public static ArrayList<String> questionArr;
	
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
	 * 
	 * @param primaryStage The primary stage of the application.
	 * @param user
     * @param teachingMap2 
	 * @throws Exception
	 */
	public static void start(User user, Map<String, ArrayList<String>> map) throws Exception 
	{
		u = user;
		teachingMap = map;
		ScreenUtils.createNewStage("/gui/ExamCreationFirst.fxml").show();
	}
	
	public void setArr (ArrayList<String> qArr)
	{
		questionArr = qArr;
	}
	 
	public void selectSubject(MenuItem m)
	{
		String selectedSubject = m.getText();
		subjectMenu.setText(selectedSubject);
		ArrayList<String> selectedValues = teachingMap.get(selectedSubject);
		courseMenu.getItems().clear();
		for (String s : selectedValues)
		{
			MenuItem mi = new MenuItem(s);
			mi.setOnAction(e -> selectCourse((MenuItem)e.getSource()));
			courseMenu.getItems().add(mi);
		}
	}
	
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
	
	private void populateQuestionTable()
	{
	    tableViewQusetionId.setCellValueFactory(new PropertyValueFactory<>("id"));
	    tableViewQusetionText.setCellValueFactory(new PropertyValueFactory<>("questionText"));
	    for (String q : questionArr)
	    {
	        String[] splitted = q.split("-");
	        String questionId = splitted[0].trim();
	        String questionText = splitted[1].trim();
	        questionTable.getItems().addAll(new Question(null, questionId, null, questionText, null, null, null, null));
	    }
	}
	
    @FXML
    void exit(ActionEvent event)
    {
    	UserController.userExit(u);
    }

    @FXML
    void goBack(ActionEvent event) 
    {
    	UserController.goBack(event, "/gui/ProfessorScreen.fxml");
    }

	@Override
	public void initialize(URL location, ResourceBundle resources)
	{  
		questionTable.getSelectionModel().setSelectionMode(SelectionMode.MULTIPLE);
		for (String s : teachingMap.keySet())
		{
			MenuItem m = new MenuItem(s);
			m.setOnAction(e -> selectSubject((MenuItem)e.getSource()));
			subjectMenu.getItems().add(m);
		}
	}
}
