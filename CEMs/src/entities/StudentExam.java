package entities;

import java.io.Serializable;

@SuppressWarnings("serial")
public class StudentExam implements Serializable,HaveID{
	private String exam_id;
	private int grade;
	private String student_id;
	private String exam_name;
	private String comment;
	
	/**
	 * @param exam_id
	 * @param grade
	 * @param exam_name
	 */
	public StudentExam(String exam_id, int grade,String exam_name) {
		this.exam_id=exam_id;
		this.grade=grade;
		this.exam_name=exam_name;
	}
	/**
	 * @param exam_id
	 * @param exam_name
	 * @param grade
	 * @param comment
	 */
	public StudentExam(String exam_id, String exam_name, int grade, String comment) {
		this.exam_name=exam_name;
		this.grade=grade;
		this.comment=comment;
		
	}

	/**
	 * @return the exam ID
	 */
	@Override
	public String get_id() {
		return exam_id;
	}

	/**
	 * @return the exam grade
	 */
	public int getGrade() {
		return grade;
	}

	/**
	 * @return the student ID
	 */
	public String getStudent_id() {
		return student_id;
	}
	
	/**
	 * @return a string representation of the object
	 */
	@Override
	public String toString() {
		
		return exam_id + "  " +grade+" " +exam_name ;
		
	}

	/**
	 * @return the exam name
	 */
	public String getExam_name() {
		return exam_name;
	}
	
	/**
	 * @return the comment
	 */
	public String getComment() {
		return comment;
	}
}
