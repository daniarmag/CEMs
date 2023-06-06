package entities;

import java.io.Serializable;

@SuppressWarnings("serial")
public class Course implements Serializable{
	private String course_id;
	private String course_name;
	private String course_subject_id;
	
	
	public Course(String course_id,String course_name,String course_subject_id ) {
		this.course_id=course_id;
		this.course_name=course_name;
		this.course_subject_id=course_subject_id;
	}


	public String getCourse_id() {
		return course_id;
	}


	public String getCourse_name() {
		return course_name;
	}


	public String getCourse_subject_id() {
		return course_subject_id;
	}
	
	
	
	
	
	
	
}
