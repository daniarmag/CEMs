package entities;

import java.io.Serializable;

@SuppressWarnings("serial")
public class ExamTemplate implements Serializable,HaveID{
	private String exam_id;
	private String exam_name;
	private String course_id;
	
	
	
	public ExamTemplate(String exam_name,String exam_id,String course_id) {
		this.exam_name=exam_name;
		this.exam_id=exam_id;
		this.course_id=course_id;
	}

	public String get_id() {
		return exam_id;
	}

	public String get_name() {
		return exam_name;
	}

	public String getCourse_id() {
		return course_id;
	}
	
	
	
}
