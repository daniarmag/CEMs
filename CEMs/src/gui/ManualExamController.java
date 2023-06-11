package gui;

import java.awt.Desktop;
import java.io.File;
import java.io.FileOutputStream;
import java.net.URL;
import java.util.ArrayList;
import java.util.ResourceBundle;
import java.util.Timer;
import java.util.TimerTask;

import javax.swing.JOptionPane;

import client.ClientMessageHandler;
import client.ClientUI;
import control.UserController;
import entities.Exam;
import entities.ExamFile;
import entities.User;
import javafx.application.Platform;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;
import javafx.scene.text.Text;
import javafx.stage.FileChooser;
import javafx.stage.FileChooser.ExtensionFilter;

public class ManualExamController implements Initializable{
	public static User u;
	public static Exam e;
	public static Timer timer = new Timer();
	static Integer minutesLeft;
	boolean oneMinuteFlag = false;

    @FXML
    private Button DeleteBtn;

    @FXML
    private Button DownloadBtn;

    @FXML
    private TextField FileUploadTXT;

    @FXML
    private Button SubmitBtn;

    @FXML
    private Button UploadBtn;

    @FXML
    private Button exitBtn;

    @FXML
    private Button goBackBtn;

    @FXML
    private Text welcomeText;
    
    @FXML
    private TextField TimerTXT;

    /**
     * Starts the manual exam for the given user and exam.
     *
     * @param user The User object
     * @param exam The Exam object
     * @throws Exception If an error occurs.
     */
    public static void start(User user, Exam exam) throws Exception 
	{
		u = user;
		e = exam;
		minutesLeft = e.getTime();
		Platform.runLater(()-> ScreenUtils.createNewStage("/gui/ManualExam.fxml").show());
	}
    @FXML
    void DeleteBtn(ActionEvent event) {
    	FileUploadTXT.setText("");
    }


    @FXML
    void DownloadBtn(ActionEvent event) {
    	ArrayList<String> request = new ArrayList<String>();
		request.add("load exam file");
		request.add(e.getExam_id());
		ClientUI.chat.accept(request);
        SubmitBtn.setDisable(false);
		startCountdown();
    }


    @FXML
    void SubmitBtn(ActionEvent event) {
    	if (FileUploadTXT.getText().strip().equals(""))
			JOptionPane.showMessageDialog(null, "File not uploaded", "Exam upload", JOptionPane.INFORMATION_MESSAGE);		
    }

    /**
     * Event handler for the UploadBtn button.
     * Opens a file chooser dialog to select a Word file (.docx) and displays the selected file path in a text field.
     *
     * @param event The action event triggered by clicking the UploadBtn button.
     */
    @FXML
    void UploadBtn(ActionEvent event) {
    	FileChooser fc = new FileChooser();
    	fc.getExtensionFilters().add(new ExtensionFilter("Word Files", "*.docx"));
    	File file = fc.showOpenDialog(null);
    	if (file != null)
    		FileUploadTXT.setText("Selected file: " + file.getAbsolutePath());
    }

    /*Disconnects from the server and closes GUI window.*/
   	@FXML
   	void exit(ActionEvent event) 
   	{
   		UserController.userExit(u);
   	}

	@FXML
	void goBack(ActionEvent event) 
	{	
		UserController.goBack(event, "/gui/StudentExamScreen.fxml");
	}
	
	@Override
	public void initialize(URL location, ResourceBundle resources) {
		ClientMessageHandler.setManualExamController(this);
		TimerTXT.setEditable(false);
        SubmitBtn.setDisable(true);
		TimerTXT.setText(minutesLeft.toString());
		
	}

	public void startCountdown() {
		
        TimerTask task = new TimerTask() {
            @Override
            public void run() {
            	minutesLeft--;
        		TimerTXT.setText(minutesLeft.toString());

                if (minutesLeft == 0 && !oneMinuteFlag) {
                	oneMinuteFlag = true;
                	minutesLeft++;
            		TimerTXT.setText(minutesLeft.toString());
                	}
                else if (oneMinuteFlag) {
                    timer.cancel();
                    SubmitBtn.setDisable(true);
                }
            }
        };
        // Schedule the task to run every minute
        timer.schedule(task, 0, 60_000);
		}
//		TimerController timerController = new TimerController(u.getUser_id(), e.time);
//		return timerController.getRemainingTime();
	
	/**
	 * Writes the byte array from the ExamFile object to a file and opens it.
	 *
	 * @param examFile The ExamFile object containing the byte array to be written to the file.
	 */
	public void setExamFile(ExamFile examFile) {
		try {
			ExamFile exFile = examFile;
		    File newFile = new File("C:\\Users\\nicol\\Downloads\\exam"+ exFile.getFileName() + ".docx");
		    // Create an output stream to write the byte array to the file
			FileOutputStream fos = new FileOutputStream(newFile);
			fos.write(exFile.getMybytearray());
			fos.close();
		    // Open the file
		    Desktop desktop = Desktop.getDesktop();
		    desktop.open(newFile);
			} catch (Exception e) {e.printStackTrace();}
	}
	
	/**
	 * Disables the ability to submit the exam
	 */
	public void disableFileUpload()
	{
		UploadBtn.setDisable(true);
		SubmitBtn.setDisable(true);
		FileUploadTXT.setDisable(true);
		timer.cancel();
		TimerTXT.setText("0");
	}
}
