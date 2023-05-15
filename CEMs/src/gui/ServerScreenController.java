package gui;

import java.net.InetAddress;
import java.net.URL;
import java.net.UnknownHostException;
import java.util.ResourceBundle;
import javax.swing.JOptionPane;
import entities.Client;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.paint.Color;
import javafx.scene.shape.Circle;
import javafx.stage.Stage;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import server.EchoServer;
import server.ServerUI;

/*A GUI for server area.*/
public class ServerScreenController implements Initializable 
{
	String dbName = "jdbc:mysql://localhost/cems?serverTimezone=IST",
		   port = Integer.toString(ServerUI.DEFAULT_PORT),
		   username, password;
	public static int clientCnt = 0;
	
	@FXML
	private Button connectBtn;

	@FXML
	private Button disconnectBtn;

	@FXML
	private Button exitBtn;
	
    @FXML
    private Circle offCircle;

    @FXML
    private Circle onCircle;

    @FXML
    private TableView<Client> connectedTable  = new TableView<Client>();
    
    @FXML
    private TableColumn<Client, String> hostCol;

    @FXML
    private TableColumn<Client, String> ipCol;

    @FXML
    private TableColumn<Client, String> statusCol;
    
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
		EchoServer.setServerScreenController(this);
		primaryStage.setTitle("Server");
		primaryStage.setScene(scene);
		primaryStage.show();
	}

	/*Initializing the GUI with the table.*/
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
		txtAreaPort.setEditable(false);
		txtAreaUsername.setText("root");
		initializeTable();
	}
	
	/*Connects to the server.*/
	@FXML
	void connect(ActionEvent event) 
	{
		username = txtAreaUsername.getText().trim();
	    password = textAreaPassword.getText().trim();
	    dbName = txtAreaDbName.getText().trim();
	    if (username.isEmpty() || password.isEmpty() || dbName.isEmpty())
	    	JOptionPane.showMessageDialog(null, "You must fill all the fields!", "Server Area", JOptionPane.INFORMATION_MESSAGE);
	    else
	    { 	
		    boolean connectionSuccessful;
			connectionSuccessful = ServerUI.runServer(port, dbName, username, password);
		    if (connectionSuccessful)
		    {
		        offCircle.setFill(Color.TRANSPARENT);
		        onCircle.setFill(Color.rgb(0, 202, 78));
		        connectBtn.setDisable(true);
		        disconnectBtn.setDisable(false);
		    } 
		    else 
		    	JOptionPane.showMessageDialog(null, "Incorrect username or password. Please try again.", "Server Area", JOptionPane.INFORMATION_MESSAGE);
	    }
	}
	
	/*Disconnects from the server.*/
	@FXML
	void disconnect(ActionEvent event) throws Exception
	{
		connectedTable.getItems().clear();
		try 
		{
			ServerUI.getEs().sendToAllClients("Abort");
		} catch (Exception e) {}
		ServerUI.closeServer();
		onCircle.setFill(Color.TRANSPARENT);
		offCircle.setFill(Color.rgb(255, 96, 92));
		connectBtn.setDisable(false);
		disconnectBtn.setDisable(true);
	}
	
	
	/*Exits the GUI window.*/
	@FXML
	void exit(ActionEvent event) throws Exception
	{
		disconnect(event);
		System.exit(0);
	}
	
	/*Initializes the table.*/
	public void initializeTable() 
	{
		disconnectBtn.setDisable(true);
		onCircle.setFill(Color.TRANSPARENT);
        ipCol.setCellValueFactory(new PropertyValueFactory<>("ip"));
        hostCol.setCellValueFactory(new PropertyValueFactory<>("host"));
        statusCol.setCellValueFactory(new PropertyValueFactory<>("status"));
        ObservableList<Client> clientObservableList = EchoServer.getClientsInfoList();
        connectedTable.setItems(clientObservableList);
    }
	
	/*Updates the table with the current list of clients.*/
	public void clientConnected()
	{
	    connectedTable.setItems(EchoServer.getClientsInfoList());
		connectedTable.refresh();
	}

}
