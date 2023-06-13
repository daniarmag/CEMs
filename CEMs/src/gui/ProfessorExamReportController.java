package gui;

import java.net.URL;
import java.util.ResourceBundle;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.image.ImageView;
import javafx.scene.text.Text;

public class ProfessorExamReportController implements Initializable{

    @FXML
    private TableColumn<?, ?> examCol;

    @FXML
    private TableColumn<?, ?> examIdCol;

    @FXML
    private TableColumn<?, ?> examNameCol;

    @FXML
    private TableView<?> examTable;

    @FXML
    private ImageView exitBtn;

    @FXML
    private Button goBackBtn;

    @FXML
    private ImageView returnBtn;

    @FXML
    private TextField searchBar;

    @FXML
    private Button viewReport;

    @FXML
    private Text welcomeText;

    
    
    void start() {
    	
    }
    
    @FXML
    void exit(ActionEvent event) {

    }

    @FXML
    void goBack(ActionEvent event) {

    }

	@Override
	public void initialize(URL location, ResourceBundle resources) {
		
	}

}
