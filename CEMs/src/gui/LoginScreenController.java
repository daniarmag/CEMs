package gui;

import java.io.IOException;

import javax.swing.JOptionPane;

import client.ChatClient;
import client.ClientUI;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;
import javafx.stage.Stage;

public class LoginScreenController 
{

    @FXML
    private Button exitBtn;

    @FXML
    private Button loginBtn;

    @FXML
    private TextField txtLoginPassword;

    @FXML
    private TextField txtLoginUsername;

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

    @FXML
    void exit(ActionEvent event) 
    {
    	ClientUI.chat.accept("disconnected");
    	ClientUI.chat.quit();
    	System.exit(0);
    }

}
