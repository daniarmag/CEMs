package gui;

import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.ResourceBundle;

import client.ChatClient;
import client.ClientUI;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;
import javafx.stage.Stage;

/*A GUI for the login screen.*/
public class LoginScreenController implements Initializable 
{
	
	boolean flag = false; 
	
    @FXML
    private Button exitBtn;

    @FXML
    private Button loginBtn;

    @FXML
    private TextField txtLoginPassword;

    @FXML
    private TextField txtLoginUsername;

    /*
    /////USE IN DIFFRERENT SCREEN
    @FXML
    void Login(ActionEvent event) throws IOException 
    {
    	FXMLLoader loader = new FXMLLoader();
    	ClientUI.chat.accept("connected");
    	((Node)event.getSource()).getScene().getWindow().hide();
    	Stage primaryStage = new Stage();
    	loader.setLocation(getClass().getResource("/gui/QuestionBank.fxml"));
    	Parent root = loader.load();
    	WindowUtils.enableWindowDraggable(root, primaryStage);
    	Scene scene = new Scene(root);
    	primaryStage.setTitle("Question Bank");
    	primaryStage.setScene(scene);
    	primaryStage.show();		
    }
    */
    
    /**
     * Logs the user into the system and opens the next screen. 
     * @param event
     * @throws IOException
     */
    @FXML
    void Login(ActionEvent event) throws IOException 
    {
    	FXMLLoader loader = new FXMLLoader();
    	ArrayList<String> info =  new ArrayList<>();
    	info.add(txtLoginUsername.getText().trim());
    	info.add(txtLoginPassword.getText().trim());
    	ClientUI.chat.accept(info);
    	if (flag)
    	{
        	((Node)event.getSource()).getScene().getWindow().hide();
        	Stage primaryStage = new Stage();
        	loader.setLocation(getClass().getResource("/gui/ProfessorScreen.fxml"));
        	Parent root = loader.load();
        	WindowUtils.enableWindowDraggable(root, primaryStage);
        	Scene scene = new Scene(root);
        	primaryStage.setTitle("Login");
        	primaryStage.setScene(scene);
        	primaryStage.show();
    	}
    }

    /*disconnects from the server and exits from the GUI. */
    @FXML
    void exit(ActionEvent event) 
    {
    	ClientUI.chat.accept("disconnected");
    	ClientUI.chat.quit();
    	System.exit(0);
    }

	@Override
	public void initialize(URL location, ResourceBundle resources) 
	{
		ChatClient.setLoginScreenController(this);
	}
	
	public void setFlag(boolean flag)
	{
		this.flag = flag;
	}

}
