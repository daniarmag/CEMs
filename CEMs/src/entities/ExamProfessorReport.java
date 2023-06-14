package entities;

import java.util.ArrayList;

@SuppressWarnings("serial")
public class ExamProfessorReport extends ExamStatistics {
private String course_id;
private ArrayList<Distribution> rangeArr;	

	///distribution
	///all info from exam stat
	///all info currenlty in 
	
	


	
	public ExamProfessorReport(String exam_id, String exam_name, double average_grade, int max_grade, int min_grade,
			double fails) {
		super(exam_id, exam_name, average_grade, max_grade, min_grade, fails);
	}

	public String getCourseId() {
		return course_id;
	}


	
	
	public ArrayList<Distribution> getDistribution() {
		return rangeArr;
	}
	
	public void setDistribution( ArrayList<Distribution> array) {
		rangeArr=array;
	}



	
}
