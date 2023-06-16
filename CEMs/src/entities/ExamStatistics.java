package entities;

import java.io.Serializable;

/**
 * Represents the statistical information of an exam.
 */
@SuppressWarnings("serial")
public class ExamStatistics implements Serializable,HaveID{
	private String exam_id;
	private String exam_name;
	private double average_grade;
	private int max_grade;
	private int min_grade;
	private double fails;

	/**
	 * @param exam_id
	 * @param exam_name
	 * @param average_grade
	 * @param max_grade
	 * @param min_grade
	 * @param fails
	 */
	public ExamStatistics(String exam_id, String exam_name, double average_grade, int max_grade, int min_grade, double fails) 
	{
		this.exam_id = exam_id;
		this.exam_name = exam_name;
		this.average_grade = average_grade;
		this.max_grade = max_grade;
		this.min_grade = min_grade;
		this.fails = fails;
	}

	/**
	 * @return the exam ID
	 */
	@Override
	public String get_id() {
		return exam_id;
	}
	
	/**
	 * @return the exam name
	 */
	public String getExam_name() {
		return exam_name;
	}
	
	/**
	 * @return the average grade for all the student who took this test
	 */
	public double getGrade() {
		return average_grade;
	}
	
	/**
	 * @return the maximum grade
	 */
	public int getMax_grade() {
		return max_grade;
	}
		
	/**
	 * @return the minimum grade
	 */
	public int getMin_grade() {
		return min_grade;
	}
	
	/**
	 * @return the amount of fails
	 */
	public double getFails() {
		return fails;
	}
}
	
	
	
	
