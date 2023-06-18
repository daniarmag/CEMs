package entities;

import java.io.Serializable;

/**
 * Represents the exam results in the system.
 */
@SuppressWarnings("serial")
public class ExamResults implements Serializable
{
	public String exam_name;
	public String exam_id;
	public String student_id;
	public Integer grade;
	public String comment = "";
	public String isConfirmed = "0";
	public String wrong_answers = "";

	/**
	 * fake object
	 * @param comment
	 */
	public ExamResults(String comment)
	{
		this.comment = comment;
	}
	
	/**
	 * @param exam_id
	 * @param student_id
	 * @param grade
	 * @param exam_name
	 */
	public ExamResults(String exam_name, String exam_id, String student_id, Integer grade) 
	{
		super();
		this.exam_name = exam_name;
		this.exam_id = exam_id;
		this.student_id = student_id;
		this.grade = grade;
	}

	/**
	 * @return the exam_id
	 */
	public String getExam_id() 
	{
		return exam_id;
	}

	/**
	 * @return the student_id
	 */
	public String getStudent_id()
	{
		return student_id;
	}

	/**
	 * @return the grade
	 */
	public Integer getGrade() 
	{
		return grade;
	}

	/**
	 * @return the comment
	 */
	public String getComment()
	{
		return comment;
	}

	/**
	 * @return the isConfirmed
	 */
	public String getIsConfirmed() 
	{
		return isConfirmed;
	}

	/**
	 * @return the exam_name
	 */
	public String getExam_name() 
	{
		return exam_name;
	}
	
	/**
	 * @return the wrong_answers
	 */
	public String getWrong_answers() 
	{
		return wrong_answers;
	}

	/**
	 * @param wrong_answers the wrong_answers to set
	 */
	public void setWrong_answers(String wrong_answers) 
	{
		this.wrong_answers = wrong_answers;
	}
	
	/**
	 * @param exam_id the exam_id to set
	 */
	public void setExam_id(String exam_id) 
	{
		this.exam_id = exam_id;
	}

	/**
	 * @param student_id the student_id to set
	 */
	public void setStudent_id(String student_id)
	{
		this.student_id = student_id;
	}

	/**
	 * @param grade the grade to set
	 */
	public void setGrade(Integer grade) 
	{
		this.grade = grade;
	}

	/**
	 * @param comment the comment to set
	 */
	public void setComment(String comment)
	{
		this.comment = comment;
	}

	/**
	 * @param isConfirmed the isConfirmed to set
	 */
	public void setIsConfirmed(String isConfirmed) 
	{
		this.isConfirmed = isConfirmed;
	}

	/**
	 * @param exam_name the exam_name to set
	 */
	public void setExam_name(String exam_name) 
	{
		this.exam_name = exam_name;
	}
	
	
}
