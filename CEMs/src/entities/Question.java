package entities;

import java.io.Serializable;

@SuppressWarnings("serial")
public class Question implements Serializable
{
	public String id;
	public String subject;
	public String courseName;
	public String questionText;
	public Integer questionNumber;
	public String authorName;
	public String correctAnswer = "";
	public String[] answers = new String[4];
	
	public Question(String id, String subject, String courseName, String questionText,
			        Integer questionNumber, String authorName) 
	{
		this.id = id;
		this.subject = subject;
		this.courseName = courseName;
		this.questionText = questionText;
		this.questionNumber = questionNumber;
		this.authorName = authorName;
		//this.correctAnswer = correctAnswer;
		//this.answers = answers;
	}
	
	public String getId() 
	{
		return id;
	}

	public String getSubject() 
	{
		return subject;
	}
	
	public String getCourseName() 
	{
		return courseName;
	}

	public String getQuestionText() 
	{
		return questionText;
	}
	
	public Integer getQuestionNumber()
	{
		return questionNumber;
	}

	public String getCorrectAnswer() 
	{
		return correctAnswer;
	}

	public String getAuthorName()
	{
		return authorName;
	}

	public String[] getAnswers()
	{
		return answers;
	}
	
	public void setId(String id) 
	{
		this.id = id;
	}

	public void setSubject(String subject) 
	{
		this.subject = subject;
	}
	
	public void setCourseName(String courseName) 
	{
		this.courseName = courseName;
	}

	public void setQuestionText(String questionText) 
	{
		this.questionText = questionText;
	}
	
	public void setQuestionNumber(Integer questionNumber) 
	{
		this.questionNumber = questionNumber;
	}

	public void setCorrectAnswer(String correctAnswer)
	{
		this.correctAnswer = correctAnswer;
	}

	public void setAuthorName(String authorName) 
	{
		this.authorName = authorName;
	}
	
	public void setAnswers(String[] answers)
	{
		this.answers = answers;
	}

}
