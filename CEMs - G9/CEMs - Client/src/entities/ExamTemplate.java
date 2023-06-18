package entities;

import java.io.Serializable;

@SuppressWarnings("serial")
public class ExamTemplate implements Serializable,HaveID{
	private String exam_id;
	private String exam_name;
	private String course_id;
	private String author;
	private String isActive = "0";
	
	/**
	 * @param exam_id
	 * @param exam_name
	 * @param course_id
	 */
	public ExamTemplate(String exam_name, String exam_id, String course_id)
	{
		super();
		this.exam_id = exam_id;
		this.exam_name = exam_name;
		this.course_id = course_id;
	}

	/**
	 * @return exam_id
	 */
	public String get_id() 
	{
		return exam_id;
	}

	/**
	 * @return exam_name
	 */
	public String get_name()
	{
		return exam_name;
	}

	/**
	 * @return course_id
	 */
	public String getCourse_id() 
	{
		return course_id;
	}

	/**
	 * @return the author
	 */
	public String getAuthor() 
	{
		return author;
	}

	/**
	 * @return the isActive
	 */
	public String getIsActive() 
	{
		return isActive;
	}

	
	/**
	 * @param course_id the course_id to set
	 */
	public void setCourse_id(String course_id) 
	{
		this.course_id = course_id;
	}

	/**
	 * @param author the author to set
	 */
	public void setAuthor(String author) 
	{
		this.author = author;
	}

	/**
	 * @param isActive the isActive to set
	 */
	public void setIsActive(String isActive) 
	{
		this.isActive = isActive;
	}

	

}
