package entities;

public class Question 
{
	public String id;
	public String subject;
	public String questionText;
	public String correctAnswer;
	public String authorName;
	public String[] answers;
	
	public Question(String id, String subject, String questionText, String[] answers, String correctAnswer, String authorName) 
	{
		this.id = id;
		this.subject = subject;
		this.questionText = questionText;
		this.answers = answers;
		this.correctAnswer = correctAnswer;
		this.authorName = authorName;
	}
	
	public String getId() 
	{
		return id;
	}

	public String getSubject() 
	{
		return subject;
	}

	public String getQuestionText() 
	{
		return questionText;
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

	public void setQuestionText(String questionText) 
	{
		this.questionText = questionText;
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
