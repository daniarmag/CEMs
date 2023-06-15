package entities;

import java.io.Serializable;

@SuppressWarnings("serial")
public class ExamTimeChange implements Serializable
{
	public String exam_id;
	public Integer exam_time_request;
	public String isApproved;
	public String professor_id;
	public String professor_name;
	public String reason;
	public String exam_name;
	/**
	 * @param exam_id
	 * @param exam_time_request
	 * @param isApproved
	 * @param professor_id
	 * @param professor_name
	 * @param reason
	 * @param exam_name
	 */
	public ExamTimeChange(String exam_id, Integer exam_time_request, String isApproved, String professor_id,
			String professor_name, String reason, String exam_name) 
	{
		super();
		this.exam_id = exam_id;
		this.exam_time_request = exam_time_request;
		this.isApproved = isApproved;
		this.professor_id = professor_id;
		this.professor_name = professor_name;
		this.reason = reason;
		this.exam_name = exam_name;
	}
	/**
	 * @return the exam_id
	 */
	public String getExam_id() {
		return exam_id;
	}
	/**
	 * @return the exam_time_request
	 */
	public Integer getExam_time_request() {
		return exam_time_request;
	}
	/**
	 * @return the isApproved
	 */
	public String getIsApproved() {
		return isApproved;
	}
	/**
	 * @return the professor_id
	 */
	public String getProfessor_id() {
		return professor_id;
	}
	/**
	 * @return the professor_name
	 */
	public String getProfessor_name() {
		return professor_name;
	}
	/**
	 * @return the reason
	 */
	public String getReason() {
		return reason;
	}
	/**
	 * @return the exam_name
	 */
	public String getExam_name() {
		return exam_name;
	}
	/**
	 * @param exam_id the exam_id to set
	 */
	public void setExam_id(String exam_id) {
		this.exam_id = exam_id;
	}
	/**
	 * @param exam_time_request the exam_time_request to set
	 */
	public void setExam_time_request(Integer exam_time_request) {
		this.exam_time_request = exam_time_request;
	}
	/**
	 * @param isApproved the isApproved to set
	 */
	public void setIsApproved(String isApproved) {
		this.isApproved = isApproved;
	}
	/**
	 * @param professor_id the professor_id to set
	 */
	public void setProfessor_id(String professor_id) {
		this.professor_id = professor_id;
	}
	/**
	 * @param professor_name the professor_name to set
	 */
	public void setProfessor_name(String professor_name) {
		this.professor_name = professor_name;
	}
	/**
	 * @param reason the reason to set
	 */
	public void setReason(String reason) {
		this.reason = reason;
	}
	/**
	 * @param exam_name the exam_name to set
	 */
	public void setExam_name(String exam_name) {
		this.exam_name = exam_name;
	}
	
	
}
