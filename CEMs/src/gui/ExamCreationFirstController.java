package gui;

import java.net.URL;
import java.util.ArrayList;
import java.util.Map;
import java.util.ResourceBundle;

import control.UserController;
import entities.User;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.MenuButton;
import javafx.scene.control.MenuItem;

public class ExamCreationFirstController implements Initializable
{
	public static User u;
	
    public static Map<String, ArrayList<String>> teachingMap;
	
    @FXML
    private Button exitBtn;

    @FXML
    private Button goBackBtn;
    
    @FXML
    private MenuButton subjectMenu;
    
    @FXML
    private MenuButton courseMenu;

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
	
	public void selectSubject(MenuItem m)
	{
		courseMenu.getItems().clear();
		String selectedSubject = m.getText();
		subjectMenu.setText(selectedSubject);
		ArrayList<String> selectedValues = teachingMap.get(selectedSubject);
		for (String s : selectedValues)
		{
			MenuItem mi = new MenuItem(s);
			mi.setOnAction(e -> selectCourse((MenuItem)e.getSource()));
			courseMenu.getItems().add(mi);
		}
	}
	
	public void selectCourse(MenuItem m)
	{
		courseMenu.getItems().clear();
		String selectedSubject = m.getText();
		courseMenu.setText(selectedSubject);
		ArrayList<String> request = new ArrayList<String>();
		request.add("load course questions");
		
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
		for (String s : teachingMap.keySet())
		{
			MenuItem m = new MenuItem(s);
			m.setOnAction(e -> selectSubject((MenuItem)e.getSource()));
			subjectMenu.getItems().add(m);
		}
		
		
	}
}
