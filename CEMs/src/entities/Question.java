package entities;

import java.io.Serializable;

/**
 * Represents the questions in the system.
 *
 */
@SuppressWarnings("serial")
public class Question implements Serializable
{
	public String course = "";
	public String id;
	public String subject;
	public String questionText;
	public Integer questionNumber;
	public String author;
	public String professorId;
	public String correctAnswer;
	public String[] answers;
	
	public Question(Integer questionNumber, String id, String subject, String questionText, 
				    String author, String professorId,
				    String correctAnswer, String[] answers)
	{
		super();
		this.id = id;
		this.subject = subject;
		this.questionText = questionText;
		this.questionNumber = questionNumber;
		this.author = author;
		this.professorId = professorId;
		this.correctAnswer = correctAnswer;
		this.answers = answers;
	}
	
	/**
     * @return The ID of the question.
     */
	public String getId() 
	{
		return id;
	}
	 /**
     * @return The subject of the question.
     */
	public String getSubject() 
	{
		return subject;
	}
	/**
     * @return The name of the course.
     */
	public String getCourseName() 
	{
		return course;
	}

	/**
	 * @return The text of the question.

	 */
	public String getQuestionText() 
	{
		return questionText;
	}
	/**
	 * @return The number of the question.

	 */
	public Integer getQuestionNumber()
	{
		return questionNumber;
	}
	/**
	 * @return The correct answer.
	 */
	public String getCorrectAnswer() 
	{
		return correctAnswer;
	}
	/**
	 * @return The name of the author.
	 */
	public String getAuthor()
	{
		return author;
	}

	/**
	 * @return The answers.
	 */
	public String[] getAnswers()
	{
		return answers;
	}
	
	/**
	 * @return professor id.
	 */
	public String getProfessorId()
	{
		return professorId;
	}
	
    /**
     * @return question course.
     */
    public String getCourse() 
    {
        return course;
    }

	/**
	 * @param professorId
	 */
	public void setProfessorId(String professorId) 
	{
		this.professorId = professorId;
	}
	
	/**
     * Sets the ID of the question.
     *
     * @param id The ID of the question.
     */
	public void setId(String id) 
	{
		this.id = id;
	}
	/**
     * Sets the subject of the question.
     *
     * @param subject The subject of the question.
     */
	public void setSubject(String subject) 
	{
		this.subject = subject;
	}
	
	/**
     * Sets the name of the course.
     *
     * @param courseName The name of the course.
     */
	public void setCourse(String course) 
	{
		this.course = course;
	}

	/**
     * @param questionText
     */
	public void setQuestionText(String questionText) 
	{
		this.questionText = questionText;
	}
	
	/**
	 * @param questionNumber
	 */
	public void setQuestionNumber(Integer questionNumber) 
	{
		this.questionNumber = questionNumber;
	}

	/**
	 * @param correctAnswer
	 */
	public void setCorrectAnswer(String correctAnswer)
	{
		this.correctAnswer = correctAnswer;
	}

	/**
	 * @param authorName
	 */
	public void setAuthor(String author) 
	{
		this.author = author;
	}
	
	/**
	 * @param answers
	 */
	public void setAnswers(String[] answers)
	{
		this.answers = answers;
	}
}
