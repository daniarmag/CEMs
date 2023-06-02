package client;

import java.util.ArrayList;
import java.util.Map;
import javax.swing.JOptionPane;
import entities.Question;
import entities.User;
import enums.MessageType;
import gui.CreateQuestionScreenController;
import gui.ExamCreationFirstController;
import gui.HeadOfDepScreenController;
import gui.LoginScreenController;
import gui.ProfessorScreenController;
import gui.StudentScreenController;
import gui.QuestionBankScreenController;
import gui.StudentExamScreenController;

public class ClientMessageHandler 
{
	static StudentScreenController studentController;
	static ProfessorScreenController professorController;
	static CreateQuestionScreenController createQuestionScreenController;
	static ExamCreationFirstController examCreationFirstController;
    static QuestionBankScreenController questionBankScreenController;
    static StudentExamScreenController studentExamScreenController;
    static HeadOfDepScreenController headOfScreenController;
	static {
		studentController = new StudentScreenController();
		professorController = new ProfessorScreenController();
		headOfScreenController = new HeadOfDepScreenController();
		examCreationFirstController = new ExamCreationFirstController();
	}
	
	public static void setQuestionBankController(QuestionBankScreenController controller)
	{
		questionBankScreenController = controller;
	}
	
	public static void setCreateQuestionScreenController(CreateQuestionScreenController controller)
	{
		createQuestionScreenController = controller;
	}
	public static void setStudentExamController(StudentExamScreenController controller)
	{
		studentExamScreenController = controller;
	}
	/**
	 * Finds out the type of the message and then initiates the appropriate method.
	 * @param msg
	 */
	@SuppressWarnings({ "unchecked", "incomplete-switch" })
	public static void messageHandler(Object msg) 
	{
		MessageType message = getType(msg);
		if (message == null)
			return;
		switch (message) 
		{
			case STRING:
				stringMessageHandler((String) msg);
				break;
			case QUESTION_ARRAY_LIST:
				questionArrayListMessageHandler((ArrayList<Question>) msg);
				break;
			case STRING_ARRAY_LIST:
				stringArrayListMessageHandler((ArrayList<String>)msg);
			case USER:
				userMessageHandler((User) msg);
				break;
			case MAP:
				mapMessageHandler((Map<String, ArrayList<String>>) msg);
		}
	}

	/**
	 * Determines the type of the client message.
	 * @param msg
	 * @return the message type.
	 */
	public static MessageType getType(Object msg) 
	{
		if (msg instanceof String)
			return MessageType.STRING;
		else if (msg instanceof ArrayList) 
		{
			ArrayList<?> arrayList = (ArrayList<?>) msg;
			if (!arrayList.isEmpty()) 
			{
				Object firstElement = arrayList.get(0);
				if (firstElement instanceof String)
					return MessageType.STRING_ARRAY_LIST;
				else if (firstElement instanceof Question)
					return MessageType.QUESTION_ARRAY_LIST;
			}
		} 
		else if (msg instanceof Map)
			return MessageType.MAP;
		else if (msg instanceof User)
			return MessageType.USER;
		return null;
	}

	/*
	 * Handles client messages of type Strings.
	 * @param message
	 */
	public static void stringMessageHandler(String message) 
	{
		switch (message) 
		{
			case "incorrect login":
				JOptionPane.showMessageDialog(null, "Incorrect username or password.", "Login",JOptionPane.INFORMATION_MESSAGE);
				break;
			case "abort":
				JOptionPane.showMessageDialog(null, "Server disconnected.", "Disconnected",JOptionPane.INFORMATION_MESSAGE);
				System.exit(0);
				break;
			case "already logged":
				JOptionPane.showMessageDialog(null, "User is already logged.", "Login",JOptionPane.INFORMATION_MESSAGE);
				break;
			case "question added":
				JOptionPane.showMessageDialog(null, "Question successfully added.", "Question Creation",JOptionPane.INFORMATION_MESSAGE);
				break;
			case "updated question":
				JOptionPane.showMessageDialog(null, "Question successfully edited.", "Question Creation",JOptionPane.INFORMATION_MESSAGE);
				break;
			case "deleted question":
				JOptionPane.showMessageDialog(null, "Question successfully deleted.", "Question Creation",JOptionPane.INFORMATION_MESSAGE);
				break;
		}
	}
	
	/**
	 * Handles server messages that are an array list with String elements.
	 * @param arrayList
	 * @param client
	 */
	public static void stringArrayListMessageHandler(ArrayList<String> arrayList) 
	{
		String messageType = arrayList.get(0);
		switch (messageType) 
		{	
			case "amount of questions":
				createQuestionScreenController.setQuestionNumber(arrayList.get(1));
				break;
			case "course questions":
				arrayList.remove(0);
				examCreationFirstController.setArr(arrayList);
				break;
		}
	}

	/**
	 * Handles client messages that are an array list with Question elements.
	 * @param arrayList
	 */
	public static void questionArrayListMessageHandler(ArrayList<Question> arrayList) 
	{
		questionBankScreenController.setArr(arrayList);
		questionBankScreenController.updateQuestionTable();
	}

	/**
	 * Handles client messages of type User.
	 * @param user
	 */
	public static void userMessageHandler(User user) 
	{
		try 
		{
			LoginScreenController.hideCurrentScene();
			switch(user.getRole())
			{
			case "professor":
				professorController.start(user);
				break;
			case "student":
				studentController.start(user);
				break;
			case "head":
				headOfScreenController.start(user);			
				break;
			}
				
		} 
		catch (Exception e) {e.printStackTrace();}
	}
	
	public static void mapMessageHandler(Map<String, ArrayList<String>> map)
	{
		professorController.setTeachingMap(map);
	}
}
