package entities;

import java.io.Serializable;

/**
 * Represents the statistical information of an exam.
 */
@SuppressWarnings("serial")
public class ExamStat  implements Serializable{
	private String exam_id;
	private String date;
	private Integer time;
	private Integer actualTime;
	private Integer totalStudents;
	private Integer studenComplited;
	private Integer studentUncompleted;

	/**
	 * @param exam_id
	 * @param date
	 * @param time
	 * @param actualTime
	 * @param totalStudents
	 * @param studenComplited
	 * @param studentUncompleted
	 */
	public ExamStat(String exam_id, String date, int time, int actualTime, int totalStudents, int studenComplited, int studentUncompleted) {
		super();
		this.exam_id = exam_id;
		this.date = date;
		this.time = time;
		this.actualTime = actualTime;
		this.totalStudents = totalStudents;
		this.studenComplited = studenComplited;
		this.studentUncompleted = studentUncompleted;
	}

    /**
     * @return the exam ID
     */
	public String getExam_id() {
		return exam_id;
	}

	/**
	 * @return the date
	 */
	public String getDate() {
		return date;
	}

	/**
	 * @return the time
	 */
	public Integer getTime() {
		return time;
	}

	/**
	 * @return the actual time
	 */
	public Integer getActualTime() {
		return actualTime;
	}

	/**
	 * @return the total students
	 */
	public Integer getTotalStudents() {
		return totalStudents;
	}

	/**
	 * @return the amount of students that completed the exam
	 */
	public Integer getStudenComplited() {
		return studenComplited;
	}

	/**
	 * @return the amount of students that uncompleted the exam
	 */
	public Integer getStudentUncompleted() {
		return studentUncompleted;
	}

	/**
	 * @return a string representation of the object
	 */
	@Override
	public String toString() {
		return "ExamStat [exam_id=" + exam_id + ", date=" + date + ", time=" + time + ", actualTime=" + actualTime
				+ ", totalStudents=" + totalStudents + ", studenComplited=" + studenComplited + ", studentUncompleted="
				+ studentUncompleted + "]";
	}
	
}
