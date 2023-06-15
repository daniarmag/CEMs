package entities;

import java.io.Serializable;
import java.util.ArrayList;

@SuppressWarnings("serial")
public class ExamProfessorReport extends ExamStatistics implements Serializable{

	
private String course_id;
private Distribution dist;	
private double median;


private ExamStat statistics;

	
	


	
	public ExamProfessorReport(String exam_id, String exam_name, double average_grade, int max_grade, int min_grade,
			double fails) {
		super(exam_id, exam_name, average_grade, max_grade, min_grade, fails);
	}

	public String getCourseId() {
		return course_id;
	}

	public ExamStat getStat() {
		return statistics;
	}
	
	 public void setMedian(double val) {
		 median=val;
	 }
	public Distribution getDistribution() {
		return dist;
	}
	
	public double getMedian() {
		return median;
	}
	
	public void setDistribution( Distribution dist) {
		this.dist=dist;
	}

	public void setStat(ExamStat stat) {
		statistics=stat;
	}

	@Override
	public String toString() {
		return "ExamProfessorReport [course_id=" + course_id + ", dist=" + dist + ", median=" + median + ", statistics="
				+ statistics + ", get_id()=" + get_id() + ", getGrade()=" + getGrade() + ", getMax_grade()="
				+ getMax_grade() + ", getMin_grade()=" + getMin_grade() + ", getFails()=" + getFails() + "]";
	}


	
}
