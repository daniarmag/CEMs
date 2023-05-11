package gui;

import java.net.InetAddress;
import java.net.URL;
import java.net.UnknownHostException;
import java.util.ResourceBundle;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.input.MouseEvent;
import javafx.stage.Stage;
import javafx.stage.StageStyle;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import server.ServerUI;


public class ServerScreenController implements Initializable 
{
	String dbName = "jdbc:mysql://localhost/cems?serverTimezone=IST",
		   port = Integer.toString(ServerUI.DEFAULT_PORT),
		   username, password;
	
	@FXML
	private Button connectBtn;

	@FXML
	private Button disconnectBtn;

	@FXML
	private Button exitBtn;

    @FXML
    private TableView<?> connectedTable;
    
	@FXML
	private TextField textAreaPassword;

	@FXML
	private TextField txtAreaDbName;

	@FXML
	private TextField txtAreaIP;

	@FXML
	private TextField txtAreaPort;

	@FXML
	private TextField txtAreaUsername;

	public void start(Stage primaryStage) throws Exception
	{

		FXMLLoader loader = new FXMLLoader();
		loader.setLocation(getClass().getResource("/gui/ServerScreen.fxml"));
		Parent root = loader.load();
		WindowUtils.enableWindowDraggable(root, primaryStage);
		Scene scene = new Scene(root);
		primaryStage.setTitle("Server");
		primaryStage.setScene(scene);
		primaryStage.show();
	}

	@Override
	public void initialize(URL location, ResourceBundle resources) 
	{
		try 
		{
			txtAreaIP.setText(InetAddress.getLocalHost().getHostAddress());
		}
		catch (UnknownHostException e) {}
		txtAreaDbName.setText(dbName);
		txtAreaPort.setText(port);
		txtAreaUsername.setText("root");
	}
	
	@FXML
	void connect(ActionEvent event) throws Exception
	{
		username = txtAreaUsername.getText().trim();
		password = textAreaPassword.getText().trim();
		ServerUI.runServer(port, username, password);
	}
	
	@FXML
	void disconnect(ActionEvent event) throws Exception
	{
		ServerUI.closeServer();
	}
	
	@FXML
	void exit(ActionEvent event) throws Exception
	{
		disconnect(event);
		System.exit(0);
	}

}