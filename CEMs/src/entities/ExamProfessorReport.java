package entities;

import java.io.Serializable;

/**
 * Represents exam professor report
 */
@SuppressWarnings("serial")
public class ExamProfessorReport extends ExamStatistics implements Serializable
{
	private String course_id;
	
	private Distribution dist;	
	
	private double median;
	
	private ExamStat statistics;
	
	/**
	 * @param exam_id
	 * @param exam_name
	 * @param average_grade
	 * @param max_grade
	 * @param min_grade
	 * @param fails
	 */
	public ExamProfessorReport(String exam_id, String exam_name, double average_grade, int max_grade, int min_grade,
			double fails) {
		super(exam_id, exam_name, average_grade, max_grade, min_grade, fails);
	}
	
	/**
	 * @return the ID of the course
 	 */
	public String getCourseId() {
		return course_id;
	}
	
	/**
	 * @return the statistics
 	 */
	public ExamStat getStat() {
		return statistics;
	}
	
	 /**
	 * @param val the median to set
	 */
	public void setMedian(double val) {
		 median=val;
	 }
	/**
	 * @return the distribution
	 */
	public Distribution getDistribution() {
		return dist;
	}
	
	/**
	 * @return the median
	 */
	public double getMedian() {
		return median;
	}
	
	/**
	 * @param dist the distribution to set
	 */
	public void setDistribution( Distribution dist) {
		this.dist=dist;
	}

	/**
	 * @param stat the statistics to set
	 */
	public void setStat(ExamStat stat) {
		statistics=stat;
	}
}
