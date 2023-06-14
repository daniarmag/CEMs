package entities;

import java.io.Serializable;

@SuppressWarnings("serial")
public class ExamStat  implements Serializable{
	private String exam_id;
	private String date;
	private int time;
	private int actualTime;
	private int totalStudents;
	private int studenComplited;
	private int studentUncompleted;
	
	



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


	public int getTime() {
		return time;
	}


	public int getActualTime() {
		return actualTime;
	}


	public int getTotalStudents() {
		return totalStudents;
	}


	public int getStudenComplited() {
		return studenComplited;
	}


	public int getStudentUncompleted() {
		return studentUncompleted;
	}
	
	@Override
	public String toString() {
		return "ExamStat [exam_id=" + exam_id + ", date=" + date + ", time=" + time + ", actualTime=" + actualTime
				+ ", totalStudents=" + totalStudents + ", studenComplited=" + studenComplited + ", studentUncompleted="
				+ studentUncompleted + "]";
	}
	
	

	
	
	
}
