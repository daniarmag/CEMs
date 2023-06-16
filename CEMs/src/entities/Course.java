package entities;

import java.io.Serializable;

/**
 * Represents the courses in the system.
 */@SuppressWarnings("serial")
public class Course implements Serializable{
	private String course_id;
	private String course_name;
	private String course_subject_id;
	
	/**
	 * @param course_id
	 * @param course_name
	 * @param course_subject_id
	 */
	public Course(String course_id,String course_name,String course_subject_id ) {
		this.course_id=course_id;
		this.course_name=course_name;
		this.course_subject_id=course_subject_id;
	}
	
	/**
	 * @return the ID of the course
 	 */
	public String get_id() {
		return course_id;
	}

	/**
	 * @return the name of the course
	 */
	public String getCourse_name() {
		return course_name;
	}


	/**
	 * @return the subject ID of the course
	 */
	public String getCourse_subject_id() {
		return course_subject_id;
	}
	
	
	
	
	
	
	
}
