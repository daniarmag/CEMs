package gui;


import java.net.URL;
import java.util.ArrayList;
import java.util.ResourceBundle;

import client.ClientUI;
import control.UserController;
import entities.User;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.Node;
import javafx.scene.control.Button;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.MenuButton;
import javafx.scene.control.MenuItem;
import javafx.scene.control.RadioButton;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;

public class CreateQuestionScreenController implements Initializable 
{
	public static User u;
	
	public  ArrayList<String> subjectsArr;
	
	@FXML
	private TextField aAnswerText;

	@FXML
	private RadioButton aRadio;

	@FXML
	private TextField bAnswerText;

	@FXML
	private RadioButton bRadio;

	@FXML
	private TextField cAnswerText;

	@FXML
	private RadioButton cRadio;

	@FXML
	private ChoiceBox<?> courseChoiceBox;

	@FXML
	private TextField dAnswerText;

	@FXML
	private RadioButton dRadio;

	@FXML
	private Button goBackBtn;

	@FXML
	private TextArea questionTextArea;

	@FXML
	private  MenuButton subjectMenu;

	@FXML
	private Button submitBtn;

	public  void setSubjects(ArrayList<String> subjects)
	{
		  subjectsArr = subjects;
		
		  MenuButton m = new MenuButton("MenuButton");
		  
	       
	        MenuItem m3 = new MenuItem("menu item 3");
	        m.getItems().add(m3);
	        // add menu items to menu
	      
	        try {
	    		subjectMenu.getItems().add(new MenuItem(subjectsArr.get(0)));
	    		}catch(Exception e) {e.printStackTrace();}     
	        
	        System.out.println("check");
		
	}
	
	@FXML
	void subjectMenuopening() {
//		ArrayList<MenuItem> menu=new ArrayList<>();
//		for(int i=0;i<subjectsArr.size();i++) {
//		MenuItem menuItem1 = new MenuItem("check");
//		subjectMenu.getItems().add(menuItem1);
//		}

		//MenuButton m = new MenuButton("MenuButton");
		 
		
       System.out.println(" check" + subjectMenu.getItems().get(0));
        
		
	}
	@FXML
	void goBack(ActionEvent event) 
	{
		
		((Node) event.getSource()).getScene().getWindow().hide();
		ScreenUtils.createNewStage("/gui/ProfessorScreen.fxml").show();
	}

	/**
	 * Initializes the JavaFX controller during application startup.
	 * 
	 * @param primaryStage The primary stage of the application.
	 * @param user
	 * @throws Exception
	 */
	public static void start(User user) throws Exception 
	{
		u = user;
		ScreenUtils.createNewStage("/gui/CreateQuestionScreen.fxml").show();
	}
	
	@FXML
	public void exit(ActionEvent event)
	{
		UserController.userExit(u);
	}

	@Override
	public void initialize(URL location, ResourceBundle resources) 
	{
		ArrayList<String> request = new ArrayList<String>();
		request.add("find professor subjects");
		request.add(u.getUser_id());
		ClientUI.chat.accept(request);
		
		
	}
}
