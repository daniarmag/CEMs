package entities;

import java.io.Serializable;

@SuppressWarnings("serial")
public class StudentExam implements Serializable{
	private String exam_id;
	private int grade;
	private String student_id;
	private String exam_name;
	
	
	
	public StudentExam(String exam_id,int grade,String exam_name) {
		this.exam_id=exam_id;
		this.grade=grade;
		this.exam_name=exam_name;
	}



	public String getExam_id() {
		return exam_id;
	}



	public int getGrade() {
		return grade;
	}



	public String getStudent_id() {
		return student_id;
	}
	
	@Override
	public String toString() {
		
		return exam_id + "  " +grade+" " +exam_name ;
		
	}

	public String getExam_name() {
		return exam_name;
	}
	
	
	
	
}
