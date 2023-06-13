package entities;

import java.io.Serializable;
import java.sql.Date;
import java.time.LocalDate;

@SuppressWarnings("serial")
public class ExamStatistics implements Serializable,HaveID{
private String exam_id;
private String exam_name;
private double average_grade;
private int max_grade;
private int min_grade;
private double fails;



public ExamStatistics(String exam_id, String exam_name, double average_grade, int max_grade, int min_grade,
		double fails) 
{
	this.exam_id = exam_id;
	this.exam_name = exam_name;
	this.average_grade = average_grade;
	this.max_grade = max_grade;
	this.min_grade = min_grade;
	this.fails = fails;
}



//public String getExam_id() {
//	return exam_id;
//}
@Override
public String get_id() {
	return exam_id;
}


public String getExam_name() {
	return exam_name;
}



/**
 * @return the average grade for all the student who took this test
 */
public double getGrade() {
	return average_grade;
}



public int getMax_grade() {
	return max_grade;
}



public int getMin_grade() {
	return min_grade;
}



public double getFails() {
	return fails;
}




}




