package gui;

import java.net.URL;
import java.util.ArrayList;
import java.util.ResourceBundle;
import client.ClientMessageHandler;
import client.ClientUI;
import control.UserController;
import entities.ExamTimeChange;
import entities.User;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;

public class TimePendingRequestsController implements Initializable
{
	public static User u;
	
	public ArrayList<ExamTimeChange> arr = new ArrayList<>();
	
    @FXML
    private TableView<ExamTimeChange> pendingRequestsTable;
    
    @FXML
    private TableColumn<ExamTimeChange, String> examNameCol;

    @FXML
    private TableColumn<ExamTimeChange, String> professorNameCol;

    @FXML
    private TableColumn<ExamTimeChange, String> reasonCol;

    @FXML
    private TableColumn<ExamTimeChange, Integer> timeCol;

    /**
	 * Initializes the JavaFX controller during application startup.
	 * @param user
	 * @throws Exception
	 */
	public static void start(User user) throws Exception 
	{
		u = user;
		ScreenUtils.createNewStage("/gui/TimePendingRequests.fxml").show();
	}
	
	/**
	 * Initializes the GUI with the given logic.
	 * 
	 * @param location
	 * @param resources
	 */
	@Override
	public void initialize(URL location, ResourceBundle resources) 
	{
		ClientMessageHandler.setTimePendingRequestsController(this);
		ArrayList<String> request = new ArrayList<>();
		request.add("load pending requests");
		request.add(u.getUser_id());
		ClientUI.chat.accept(request);
	}
	
	/** 
	 * Exits from client GUI - disconnects from DB aswell.
	 * @param event
	 */
    @FXML
    void exit(ActionEvent event)
    {
    	UserController.userExit(u);
    }

	/**
	 * Goes back to hof main screen.
	 * 
	 * @param event
	 */
	@FXML
	void goBack(ActionEvent event) 
	{
		UserController.goBack(event, "/gui/HeadOfDepartmentScreen.fxml");
	}
	
    @FXML
    void approve(ActionEvent event) 
    {

    }

    @FXML
    void disApprove(ActionEvent event) 
    {

    }
    
    /**
     * Sets the pendingRequestsTable with the values that are currently in the Arr.
     */
    public void updateRequestsTable() 
    {
    	examNameCol.setCellValueFactory(new PropertyValueFactory<>("exam_name"));
	    professorNameCol.setCellValueFactory(new PropertyValueFactory<>("professor_name"));
	    timeCol.setCellValueFactory(new PropertyValueFactory<>("exam_time_request"));
	    reasonCol.setCellValueFactory(new PropertyValueFactory<>("reason"));
	    ObservableList<ExamTimeChange> examResultsObservableList = FXCollections.observableArrayList(arr);
	    pendingRequestsTable.setItems(examResultsObservableList);
	}
    
    /**
     * Setter.
     * @param qArr
     */
    public void setArr (ArrayList<ExamTimeChange> arr)
    {
    	this.arr = arr;
    }
}