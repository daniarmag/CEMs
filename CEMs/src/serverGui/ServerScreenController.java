package serverGui;

import java.net.InetAddress;
import java.net.URL;
import java.net.UnknownHostException;
import java.util.ResourceBundle;
import javax.swing.JOptionPane;
import entities.Client;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.CheckBox;
import javafx.scene.control.PasswordField;
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
import server.MySQLController;
import server.ServerMessageHandler;
import server.ServerUI;

/*A GUI for server area.*/
public class ServerScreenController implements Initializable 
{
	String dbName = "jdbc:mysql://localhost/cems?serverTimezone=IST",
		   port = Integer.toString(ServerUI.DEFAULT_PORT),
		   username, password;
	public static int clientCnt = 0;
	private static MySQLController sqlController;
	boolean connected = false;
	
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
	private TextField txtAreaDbName;

	@FXML
	private TextField txtAreaIP;

	@FXML
	private TextField txtAreaPort;

	@FXML
	private TextField txtAreaUsername;
	
    @FXML
    private TextField passwordTextField;
	
	@FXML
	private PasswordField passwordField;
	
    @FXML
    private CheckBox togglePassword;

	/**
	 * Initializes the JavaFX controller during application startup.
	 * @param primaryStage The primary stage of the application.
	 * @throws Exception
	 */
	public void start(Stage primaryStage) throws Exception
	{
		ScreenUtils.createNewStage("/serverGui/ServerScreen.fxml").show();
	}

    /**
	 * Initializes the GUI with the given logic.
	 * @param location
	 * @param resources
	 */
	@Override
	public void initialize(URL location, ResourceBundle resources) 
	{
		EchoServer.setServerScreenController(this);
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
	
	/**
	 * Exits from client GUI - disconnectes from DB aswell.
	 * @param event
	 */
	@FXML
	void exit(ActionEvent event) throws Exception
	{
		disconnect(event);
		System.exit(0);
	}
	
	/**
	 * Connects to the server.
	 * @param event
	 */
	@FXML
	void connect(ActionEvent event) 
	{
		connected = true;
		username = txtAreaUsername.getText().trim();
	    password = getPassword();
	    dbName = txtAreaDbName.getText().trim();
	    if (username.isEmpty() || password.isEmpty()|| dbName.isEmpty())
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
	
	/**
	 * Disconnects from the server.
	 * @param event
	 * @throws Exception
	 */
	@FXML
	void disconnect(ActionEvent event) throws Exception
	{
		connectedTable.getItems().clear();
		try 
		{
			ServerUI.getEs().sendToAllClients("abort");
		} catch (Exception e) {}
		ServerMessageHandler.clearServerVars();
		ServerUI.closeServer();
		onCircle.setFill(Color.TRANSPARENT);
		offCircle.setFill(Color.rgb(255, 96, 92));
		connectBtn.setDisable(false);
		disconnectBtn.setDisable(true);
		if(connected)sqlController.logoutAllUsers();
		connected = false;
	}
	
	/**
	 * Method that handles the checkbox of password visibility
	 * @param event
	 */
	@FXML
	void showPass(ActionEvent event)
	{
		boolean isSelected = togglePassword.isSelected();
		if (isSelected) 
		{
			passwordField.setVisible(false);
			passwordTextField.setText(passwordField.getText());
			passwordTextField.setVisible(true);
		} 
		else 
		{
			passwordTextField.setVisible(false);
			passwordField.setText(passwordTextField.getText());
			passwordField.setVisible(true);
		}
	}
	
	/**
	 * @return the updated password from text field or password field.
	 */
	String getPassword()
	{
		return togglePassword.isSelected() ? passwordTextField.getText().trim() : passwordField.getText().trim();
	}
	
	/*
	 * Initializes the table.
	 */
	public void initializeTable() 
	{
		sqlController=MySQLController.getInstance();
		passwordField.setText("123456");
		passwordTextField.setText("123456");
		disconnectBtn.setDisable(true);
		onCircle.setFill(Color.TRANSPARENT);
        ipCol.setCellValueFactory(new PropertyValueFactory<>("ip"));
        hostCol.setCellValueFactory(new PropertyValueFactory<>("host"));
        statusCol.setCellValueFactory(new PropertyValueFactory<>("status"));
        ObservableList<Client> clientObservableList = EchoServer.getClientsInfoList();
        connectedTable.setItems(clientObservableList);
    }
	
	/*
	 * Updates the table with the current list of clients.
	 */
	public void clientConnected()
	{
	    connectedTable.setItems(EchoServer.getClientsInfoList());
		connectedTable.refresh();
	}

}
