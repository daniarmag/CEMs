package gui;

import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;
import javax.swing.JOptionPane;
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

public class HostSelectionScreenController implements Initializable 
{

    @FXML
    private Button connectToServerBtn;

    @FXML
    private Button exitBtn;

    @FXML
    private TextField txtServerIP;

    private String getIP() 
    {
  		return txtServerIP.getText();
  	}
  	
    public void start(Stage primaryStage) throws Exception
    {	
    	FXMLLoader loader = new FXMLLoader();
		loader.setLocation(getClass().getResource("/gui/HostSelectionScreen.fxml"));
		Parent root = loader.load();
		WindowUtils.enableWindowDraggable(root, primaryStage);
		Scene scene = new Scene(root);
		primaryStage.setTitle("Server Connection");
		primaryStage.setScene(scene);
		primaryStage.show();	   
	}
    
    @FXML
    void connect(ActionEvent event) throws IOException 
    {
    	FXMLLoader loader = new FXMLLoader();
    	String IP = getIP().trim();
    	if(IP.isEmpty())
    		JOptionPane.showMessageDialog(null, "You must enter server IP!", "Connect to Server", JOptionPane.INFORMATION_MESSAGE);
    	else
    	{	
    		ClientUI.chat.accept(IP);
    		if(!IP.equals("localhost"))
    		{
    			JOptionPane.showMessageDialog(null, "Wrong IP!", "Connect to Server", JOptionPane.INFORMATION_MESSAGE);
    		}
    		else
    		{
    			ClientUI.chat.accept("connected");
    			((Node)event.getSource()).getScene().getWindow().hide();
    			Stage primaryStage = new Stage();
    			loader.setLocation(getClass().getResource("/gui/LoginScreen.fxml"));
    			Parent root = loader.load();
    			WindowUtils.enableWindowDraggable(root, primaryStage);
    			Scene scene = new Scene(root);
    			primaryStage.setTitle("Login");
    			primaryStage.setScene(scene);
    			primaryStage.show();	
    		}
    		
    	}	
    }

    @FXML
    void exit(ActionEvent event) 
    {
    	System.exit(0);	
    }

	@Override
	public void initialize(URL location, ResourceBundle resources) 
	{
		txtServerIP.setText("localhost");
	}
    
  
	

}
