package client;

import java.util.ArrayList;
import java.util.Map;
import control.AlertMessages;
import entities.Course;
import entities.Exam;
import entities.Question;
import entities.User;
import enums.MessageType;
import gui.QuestionCreationScreenController;
import gui.ExamCreationFirstController;
import gui.ExamCreationSecondController;
import gui.HeadOfDepScreenController;
import gui.LoginScreenController;
import gui.ProfessorScreenController;
import gui.StudentScreenController;
import gui.ExamController;
import gui.StatisticsChooseScreenController;
import gui.QuestionBankScreenController;
import gui.StudentExamScreenController;

public class ClientMessageHandler 
{
	static StudentScreenController studentController;
	static ProfessorScreenController professorController;
	static QuestionCreationScreenController questionCreationScreenController;
	static ExamCreationFirstController examCreationFirstController;
	static ExamCreationSecondController examCreationSecondController;
    static QuestionBankScreenController questionBankScreenController;
    static StudentScreenController studentScreenController;
    static StudentExamScreenController studentExamScreenController;
    static HeadOfDepScreenController headOfScreenController;
    static ExamController examcontroller;
    static StatisticsChooseScreenController statisticsScreen;
    ///Check check check dont use 
    //static guiMainController guiController;
	static {
		//guiController =new guiMainController();
		studentController = new StudentScreenController();
		headOfScreenController = new HeadOfDepScreenController();
		examcontroller=new ExamController();
		professorController = new ProfessorScreenController();
	}

	/**
	 * @param examCreationFirstController the examCreationFirstController to set
	 */
	public static void setExamCreationFirstController(ExamCreationFirstController controller) 
	{
		examCreationFirstController = controller;
	}
	
	/**
	 * @param examCreationFirstController the examCreationFirstController to set
	 */
	public static void setExamCreationSecondController(ExamCreationSecondController controller) 
	{
		examCreationSecondController = controller;
	}

	/**
	 * @param professorController the professorController to set
	 */
	public static void setProfessorController(ProfessorScreenController controller) 
	{
		professorController = controller;
	}


	public static void setStatisticsChooseScreen(StatisticsChooseScreenController controller)
	{
		statisticsScreen = controller;
	}
	
	public static void setQuestionBankController(QuestionBankScreenController controller)
	{
		questionBankScreenController = controller;
	}
	
	public static void setCreateQuestionScreenController(QuestionCreationScreenController controller)
	{
		questionCreationScreenController = controller;
	}
	public static void setStudentExamController(StudentExamScreenController controller)
	{
		studentExamScreenController = controller;
	}
	
	/**
	 * @param studentScreenController the studentScreenController to set
	 */
	public static void setStudentScreenController(StudentScreenController controller) 
	{
		studentScreenController = controller;
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
				break;
			case USER:
				userMessageHandler((User) msg);
				break;
			case MAP:
				mapMessageHandler((Map<?,?>) msg);
				break;
			case USER_ARRAY_LIST:
				headOfScreenController.setUserArr((ArrayList<User>)msg);
				statisticsScreen.showData(((ArrayList<User>)msg).get(0).getRole());
				//guiController.statisticScreenData();
				break;
			case COURSE_ARRAY_LIST:
				headOfScreenController.setUserArr((ArrayList<?>)msg);
				statisticsScreen.showData("course");
				break;
			case EXAM_ARRAY_LIST:
				examArrayListMessageHandler((ArrayList<Exam>) msg);
				break;
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
				else if (firstElement instanceof User)
					return MessageType.USER_ARRAY_LIST;
				else if (firstElement instanceof Course)
					return MessageType.COURSE_ARRAY_LIST;
				else if (firstElement instanceof Exam)
					return MessageType.EXAM_ARRAY_LIST;
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
				AlertMessages.makeAlert("Incorrect username or password.","Login");
				break;
				
			case "abort":
				AlertMessages.makeAlert("Server disconnected.","Disconnected");
				System.exit(0);
				break;
				
			case "already logged":
				AlertMessages.makeAlert("User is already logged.","Login");
				break;
				
			case "question added":
				AlertMessages.makeAlert("Question successfully added.","Question Creation");
				break;
				
			case "added exam and questions":
				AlertMessages.makeAlert("Exam successfully added.","Exam Creation");
				break;
				
			case "updated question":
				AlertMessages.makeAlert("Question successfully edited.","Question Creation");
				break;
				
			case "deleted question":
				AlertMessages.makeAlert("Question successfully deleted.","Question Creation");
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
				questionCreationScreenController.setQuestionNumber(arrayList.get(1));
				break;
				
			case "amount of exams":
				examCreationSecondController.setExamNumber(arrayList.get(1));
				break;
				
			case "course questions":
				arrayList.remove(0);
				examCreationFirstController.setArr(arrayList);
				break;
				
			case "student courses":
				arrayList.remove(0);
				studentScreenController.setArr(arrayList);
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
	
	public static void examArrayListMessageHandler(ArrayList<Exam> arrayList) 
	{
		studentExamScreenController.setArr(arrayList);
		studentExamScreenController.updateExamTable();
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
				//examcontroller.start();
				break;
			}	
		} 
		catch (Exception e) {e.printStackTrace();}
	}
	
	public static void mapMessageHandler(Map<?, ?> map)
	{
		professorController.setTeachingMap(map);
	}
	
}
