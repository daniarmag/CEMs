package gui;


import java.net.URL;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.ResourceBundle;

import control.UserController;
import entities.ProfessorExam;
import entities.StudentExam;
import entities.User;
import javafx.application.Platform;
import javafx.event.ActionEvent;
import javafx.event.Event;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.chart.BarChart;
import javafx.scene.chart.CategoryAxis;
import javafx.scene.chart.NumberAxis;
import javafx.scene.chart.XYChart;
import javafx.scene.control.Button;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.AnchorPane;
import javafx.scene.paint.Color;
import javafx.scene.shape.Rectangle;
import javafx.scene.text.Text;
import javafx.geometry.*;

public class ReportScreenController implements Initializable {


		@FXML
		private Text highestGradeLable;


	    @FXML
	    private Text lowestGradeLabel;
		
    	@FXML
    	private AnchorPane ancorPane;
	
	    @FXML
	    private Text TextOfName;

	    @FXML
	    private Text average;

	    @FXML
	    private BarChart<String,Number> barChart;

	    @FXML
	    private Button exitBtn;

	    @FXML
	    private ImageView faceImage;

	    @FXML
	    private Text highest;

	    @FXML
	    private Text id;

	    @FXML
	    private ImageView locationScreen;

	    @FXML
	    private Text lowest;

	    @FXML
	    private Text median;

	    @FXML 
	    private Button goBackBtn;
	    
	    @FXML
	    private CategoryAxis axisX;

	    @FXML
	    private NumberAxis axisY;
	    
	    @FXML
	    private Text name;
	     
	   // private static ArrayList<StudentExam> array;
	    private static ArrayList<?> array;
	    private static ActionEvent backScreen;
	    
	    private static Object object;
	    
	    @FXML
	    void exit(ActionEvent event) {
	    	User u=StatisticsChooseScreenController.user;
	    	UserController.userExit(u);
	    }

	    @FXML
		void goBack(ActionEvent e) {
			UserController.hide(e);
		    UserController.show(backScreen);
		}
	    
	    
	    
		@SuppressWarnings("unchecked")
		public void start(ActionEvent e, Object arr, Object obj) {
			try {
				Platform.runLater(
						() -> ScreenUtils.createNewStage("/gui/HeadOfDepartmentScreenStudentStat.fxml").show());
				
				array = (ArrayList<?>) arr;
				backScreen = e;
				object = obj;
			} catch (Exception error) {
				error.printStackTrace();
			}

		}

		@SuppressWarnings("unchecked")
		@Override
		public void initialize(URL location, ResourceBundle resources) {
		  
			
			if (object.getClass().equals(User.class))
			{
				
				if(((User)object).getRole().equals("student"))
					InitStudent();
				else
					InitProfessor();
				
			}
		}

		
		
		
		
		
		/**
		 *initialize the chart report for professor 
		 */
		private void InitProfessor() {
			@SuppressWarnings("unchecked")
			ArrayList<ProfessorExam> arr=(ArrayList<ProfessorExam> )array;
			ArrayList<Number> grades =new ArrayList<>();
			
			highestGradeLable.setText("Highest Average: ");
			lowestGradeLabel.setText("Lowest Average: ");
			XYChart.Series<String, Number> series = new XYChart.Series<>();
			series.setName("Exams");
		
			String user_name = ((User) object).get_fullName();
			String user_id = ((User) object).getUser_id();
		
			for (int i = 0; i < arr.size()-1; i++) {
				series.getData().add(new XYChart.Data<>(arr.get(i).getExam_name()+"\nMax grade: "
						+ ""+arr.get(i).getMax_grade()+"\nMin grade: "+arr.get(i).getMin_grade()
						+"\nFailing precentage: "+arr.get(i).getFails()
						, arr.get(i).getAverage_grade()));
					grades.add(arr.get(i).getAverage_grade());
			}
			// Add the series to the chart
			barChart.getData().add(series);
			
			
			for (XYChart.Data<String, Number> data : series.getData()) {
				BarChart.Data<String, Number> bar = (BarChart.Data<String, Number>) data;
				bar.getNode().setStyle("-fx-bar-fill: #787a7c;");
				
			}
			
			
			try {
				Image img=new Image("\\images\\StudentLogo.png");
				Image img2=new Image("\\images\\student statistic.jpeg");
				locationScreen.setImage(img2);
				faceImage.setImage(img);
				}catch(Exception e) {e.printStackTrace();}
//				double ave = calcAverage(arr);
				double med = calMeddian(grades);
				DecimalFormat decimal = new DecimalFormat("#.00");
				average.setText(String.valueOf(arr.get(arr.size()-1).getAverage_grade()));
				median.setText(decimal.format(med));
				highest.setText(String.valueOf(arr.get(arr.size() - 2).getAverage_grade()));
				lowest.setText(String.valueOf(arr.get(0).getAverage_grade()));
				name.setText(user_name);
				id.setText(user_id);
			
				
		
			
			name.setText(user_name);
			id.setText(user_id);

		}
			
			
			
			


	
		
		/**
		 * function to initialize the chart for a student Report
		 */
		private void InitStudent() {
			@SuppressWarnings("unchecked")
			ArrayList<StudentExam> arr=(ArrayList<StudentExam> )array;
			ArrayList<Number> grades=new ArrayList<>();
			
			XYChart.Series<String, Number> series = new XYChart.Series<>();
			series.setName("Exams");
		
			String user_name = ((User) object).get_fullName();
			String user_id = ((User) object).getUser_id();
			
			for (int i = 0; i < arr.size(); i++) {
				series.getData().add(new XYChart.Data<>(arr.get(i).getExam_name(), arr.get(i).getGrade()));
				grades.add(arr.get(i).getGrade());
			}
			// Add the series to the chart
			barChart.getData().add(series);
			
			for (XYChart.Data<String, Number> data : series.getData()) {
				BarChart.Data<String, Number> bar = (BarChart.Data<String, Number>) data;
				bar.getNode().setStyle("-fx-bar-fill: #787a7c;");
			}
			
			
			
			try {
			Image img=new Image("\\images\\StudentLogo.png");
			Image img2=new Image("\\images\\student statistic.jpeg");
			locationScreen.setImage(img2);
			faceImage.setImage(img);
			}catch(Exception e) {e.printStackTrace();}
			double ave = calcAverage(arr);
			double med = calMeddian(grades);
			DecimalFormat decimal = new DecimalFormat("#.00");
			average.setText(decimal.format(ave));
			median.setText(decimal.format(med));
			highest.setText(String.valueOf(arr.get(arr.size() - 1).getGrade()));
			lowest.setText(String.valueOf(arr.get(0).getGrade()));
			name.setText(user_name);
			id.setText(user_id);
			
			
			
		}
		
		
		
		
		
		
		
		
		

		/**
		 * @param array
		 * @return the median of all the grades - they came ordered from the database
		 */
		private double calMeddian(ArrayList<Number> array) {
			System.out.println(array);
			if(array.size()%2==0) { 
				return ((array.get((int)((array.size()/2)-1)).doubleValue() +array.get((int)(array.size()/2)).doubleValue())/2);
				//return (double)((array.get((int)(array.size()/2)).getGrade() + array.get((int)(array.size()/2)+1).getGrade())/2);
			}
			else
				return array.get((int)(array.size()/2)).doubleValue();
			
		}

		private double calcAverage(ArrayList<StudentExam> array) {
			double counter=0;
			for(int i=0;i<array.size();i++)
				counter+=array.get(i).getGrade();
			return (double)counter/array.size();
			
		}

		

	
	
}
