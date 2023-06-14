package gui;


import java.net.URL;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.ResourceBundle;

import control.UserController;
import entities.Course;
import entities.ExamStatistics;
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
import javafx.scene.control.Tooltip;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.input.MouseEvent;
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
						() -> ScreenUtils.createNewStage("/gui/ReportScreen.fxml").show());

				array = (ArrayList<?>) arr;
				backScreen = e;
				object = obj;
			} catch (Exception error) {
				error.printStackTrace();
			}

		}

		/**
		 * initialize the BarChart according to the chose from screen before
		 */
		@SuppressWarnings("unchecked")
		@Override
		public void initialize(URL location, ResourceBundle resources) {

			String id;
			String name;
			if (object.getClass().equals(User.class)) {
				name=((User)object).get_fullName();
				id=((User)object).getUser_id();
				
				if (((User) object).getRole().equals("student"))
					InitStudent(commonInit(name,id));
				else
					InitProfessorCourse(commonInit(name,id), "\\images\\ProfessorLogo.png", "\\images\\ProfessorLabel.png");

			} else
			{
				name=((Course)object).getCourse_name();	 
				id=((Course)object).get_id();
				InitProfessorCourse(commonInit(name,id), "\\images\\ReportLogo.png", "\\images\\CourseLabel.png");
			}

		}
		
		/**
		 * common initialize for student and professor report
		 * 
		 * @return
		 */
		private XYChart.Series<String, Number> commonInit( String name_,String id_) {
			XYChart.Series<String, Number> series = new XYChart.Series<>();
			
			name.setText(name_);
			id.setText(id_);
			return series;
		}

		/**
		 * initialize the chart report for professor or for a course
		 */
		private void InitProfessorCourse(XYChart.Series<String, Number> series,String logo,String label) {
			@SuppressWarnings("unchecked")
			ArrayList<ExamStatistics> arr = (ArrayList<ExamStatistics>) array;
			ArrayList<Number> grades = new ArrayList<>();
			double med ;
			String average_s = String.valueOf(arr.get(arr.size() - 1).getGrade());// the last place is the average of
			// all the averages
			String highest_s = String.valueOf(arr.get(arr.size() - 2).getGrade());// this is the highest average because														// the array is sorted
			String lowest_s = String.valueOf(arr.get(0).getGrade());
			
			
			for (int i = 0; i < arr.size() - 1; i++) {
				series.getData().add(new XYChart.Data<>(
						arr.get(i).getExam_name() + "\nMax: " + "" + arr.get(i).getMax_grade() + "\nMin: "
								+ arr.get(i).getMin_grade() + "\nFails: " + arr.get(i).getFails(),
						arr.get(i).getGrade()));
				grades.add(arr.get(i).getGrade());
			}

			// Add the series to the chart
			barChart.getData().add(series);
			drawCol(series);

			med= calMeddian(grades);
			
			initializeFields(logo, label, med, average_s, highest_s,
					lowest_s);

			highestGradeLable.setText("Highest Average: ");
			lowestGradeLabel.setText("Lowest Average: ");

		}


		
		/**
		 * function to initialize the chart for a student Report
		 */
		private void InitStudent(XYChart.Series<String, Number> series) {
			@SuppressWarnings("unchecked")
			ArrayList<StudentExam> arr = (ArrayList<StudentExam>) array;
			ArrayList<Number> grades = new ArrayList<>();
			String average_s = arr.get(arr.size() - 1).get_id();// this is the average from the database
			String highest_s = String.valueOf(arr.get(arr.size() - 2).getGrade());// the array is sorted so this is the
																// highest grade
			String lowest_s = String.valueOf(arr.get(0).getGrade());
			double med;	
			for (int i = 0; i < arr.size() - 1; i++) {
				series.getData().add(new XYChart.Data<>(arr.get(i).getExam_name(), arr.get(i).getGrade()));
				grades.add(arr.get(i).getGrade());

			}

			// Add the series to the chart
			barChart.getData().add(series);

			drawCol(series);
			med = calMeddian(grades);
		
			initializeFields("\\images\\StudentLogo.png", "\\images\\student statistic.jpeg", med, average_s, highest_s,
					lowest_s);

		}
		
		
	
		
		/**
		 * @param series drawing the columns and set on event - the cursor shows the
		 *               data
		 */
		private void drawCol(XYChart.Series<String, Number> series) {

			for (XYChart.Data<String, Number> data : series.getData()) {

				BarChart.Data<String, Number> bar = (BarChart.Data<String, Number>) data;
				bar.getNode().setStyle("-fx-bar-fill: #787a7c;");
				Tooltip tooltip = new Tooltip(data.getYValue().toString());
				Tooltip.install(data.getNode(), tooltip);

				data.getNode().addEventHandler(MouseEvent.MOUSE_MOVED, event -> {
					tooltip.show(data.getNode(), event.getScreenX(), event.getScreenY() + 10);
				});

				data.getNode().addEventHandler(MouseEvent.MOUSE_EXITED, event -> {
					tooltip.hide();
				});
			}
		}

	
		
		
		
		

		/**
		 * common function to initialize the fields of the screen
		 * 
		 * @param image
		 * @param pathImage
		 * @param med
		 * @param average_s
		 * @param highest_s
		 * @param lowest_s
		 */
		private void initializeFields(String image, String pathImage, double med, String average_s, String highest_s,
				String lowest_s) {
			try {

				Image img = new Image(image);
				Image img2 = new Image(pathImage);
				locationScreen.setImage(img2);
				faceImage.setImage(img);
			} catch (Exception e) {
				e.printStackTrace();
			}

			DecimalFormat decimal = new DecimalFormat("#.00");
			median.setText(decimal.format(med));
			average.setText(average_s);
			highest.setText(highest_s);
			lowest.setText(lowest_s);

		}

		
		
		

		/**
		 * the array is sorted so the median does not neet any calculation
		 * 
		 * @param array
		 * @return the median of all the grades - they came ordered from the database
		 */
		private double calMeddian(ArrayList<Number> array) {
			System.out.println(array);
			if (array.size() % 2 == 0) {
				return ((array.get((int) ((array.size() / 2) - 1)).doubleValue()
						+ array.get((int) (array.size() / 2)).doubleValue()) / 2);
			} else
				return array.get((int) (array.size() / 2)).doubleValue();

		}
		
	

		

	
	
}
