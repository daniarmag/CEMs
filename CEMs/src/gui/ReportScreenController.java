package gui;


import java.net.URL;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.ResourceBundle;

import control.UserController;
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
import javafx.scene.paint.Color;
import javafx.scene.shape.Rectangle;
import javafx.scene.text.Text;
import javafx.geometry.*;

public class ReportScreenController implements Initializable {

	
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
	     
	    private static ArrayList<StudentExam> array;

	    private static ActionEvent backScreen;
	    
	    private static Object object;
	    @FXML
	    void exit(ActionEvent event) {
	    	
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
				array = (ArrayList<StudentExam>) arr;
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
				InitStudent();

		}

		
		
		
		private void InitStudent() {
			XYChart.Series<String, Number> series = new XYChart.Series<>();
			series.setName("Exams");
			try {
			
				
				
				
			}catch(Exception e) {e.printStackTrace();}
			String user_name = ((User) object).get_fullName();
			String user_id = ((User) object).getUser_id();
			for (int i = 0; i < array.size(); i++)
				series.getData().add(new XYChart.Data<>(array.get(i).getExam_name(), array.get(i).getGrade()));

			// Add the series to the chart
			barChart.getData().add(series);
			
			for (XYChart.Data<String, Number> data : series.getData()) {
				BarChart.Data<String, Number> bar = (BarChart.Data<String, Number>) data;
				bar.getNode().setStyle("-fx-bar-fill: gray;");
			}
			
			
			 // Get the default legend
//			barChart.setLegendVisible(true);
//
//	        // Apply CSS styling to change the legend item color
//	        String legendItemColorStyle = "-fx-text-fill: green;";
//	        barChart.lookup(".chart-legend-item").setStyle(legendItemColorStyle);
//
//	        // Apply CSS styling to change the legend symbol color
//	        String legendSymbolColorStyle = "-fx-bar-fill: green;";
//	        barChart.lookup(".chart-bar").setStyle(legendSymbolColorStyle);
			
			

//	        // Create a custom legend
//	        Legend legend = new Legend() {
//	            @Override
//	            protected void updateLegendItem(Symbol symbol) {
//	                Rectangle rectangle = new Rectangle(10, 10); // Custom symbol shape
//	                rectangle.setFill(Color.RED); // Set the desired color for the symbol
//	                symbol.setGraphic(rectangle);
//	            }
//	        };

	        // Set the custom legend to the bar chart
	        //barChart.setLegend(legend);

				
			double ave = calcAverage();
			double med = calMeddian();
			DecimalFormat decimal = new DecimalFormat("#.00");
			average.setText(decimal.format(ave));
			median.setText(decimal.format(med));
			highest.setText(String.valueOf(array.get(array.size() - 1).getGrade()));
			lowest.setText(String.valueOf(array.get(0).getGrade()));
			name.setText(user_name);
			id.setText(user_id);
			
			
			
		}
		
		
		
		
		

		private double calMeddian() {
			if(array.size()%2==0) { 
				return (double)((array.get((int)(array.size()/2)).getGrade() + array.get((int)(array.size()/2)+1).getGrade())/2);
			}
			else
				return (double)array.get((int)(array.size()/2)).getGrade();
			
		}

		private double calcAverage() {
			double counter=0;
			for(int i=0;i<array.size();i++)
				counter+=array.get(i).getGrade();
			return counter/array.size();
			
		}

		

	
	
}
