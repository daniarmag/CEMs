package entities;

import java.io.Serializable;

@SuppressWarnings("serial")
public class ExamStat  implements Serializable{
	private String exam_id;
	private String date;
	private Integer time;
	private Integer actualTime;
	private Integer totalStudents;
	private Integer studenComplited;
	private Integer studentUncompleted;
	
	



	public ExamStat(String exam_id, String date, int time, int actualTime, int totalStudents, int studenComplited,
			int studentUncompleted) {
		super();
		this.exam_id = exam_id;
		this.date = date;
		this.time = time;
		this.actualTime = actualTime;
		this.totalStudents = totalStudents;
		this.studenComplited = studenComplited;
		this.studentUncompleted = studentUncompleted;
	}


	public String getExam_id() {
		return exam_id;
	}


	public String getDate() {
		return date;
	}



	
	public Integer getTime() {
		return time;
	}


	public Integer getActualTime() {
		return actualTime;
	}


	public Integer getTotalStudents() {
		return totalStudents;
	}


	public Integer getStudenComplited() {
		return studenComplited;
	}


	public Integer getStudentUncompleted() {
		return studentUncompleted;
	}


	@Override
	public String toString() {
		return "ExamStat [exam_id=" + exam_id + ", date=" + date + ", time=" + time + ", actualTime=" + actualTime
				+ ", totalStudents=" + totalStudents + ", studenComplited=" + studenComplited + ", studentUncompleted="
				+ studentUncompleted + "]";
	}
	
	

	
	
	
}
