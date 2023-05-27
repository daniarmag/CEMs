package entities;

import java.io.Serializable;
import java.util.Arrays;

/**
 * Represents the questions in the system.
 *
 */
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
	
	 /**
     * Constructor for creating a Question object.
     *
     * @param id             The ID of the question.
     * @param subject        The subject of the question.
     * @param courseName     The name of the course.
     * @param questionText   The text of the question.
     * @param questionNumber The number of the question.
     * @param authorName     The name of the author.
     */
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
		return courseName;
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
	public String getAuthorName()
	{
		return authorName;
	}
	/**
	 * @return The answers.
	 */
	public String[] getAnswers()
	{
		return answers;
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
	public void setCourseName(String courseName) 
	{
		this.courseName = courseName;
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
	public void setAuthorName(String authorName) 
	{
		this.authorName = authorName;
	}
	
	/**
	 * @param answers
	 */
	public void setAnswers(String[] answers)
	{
		this.answers = answers;
	}
	
	@Override
	public String toString() {
		return "Question [id=" + id + ", subject=" + subject + ", questionText=" + questionText + ", questionNumber="
				+ questionNumber + ", authorName=" + authorName + ", correctAnswer=" + correctAnswer + ", answers="
				+ Arrays.toString(answers) + "]";
	}
}
