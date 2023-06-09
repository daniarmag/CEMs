package server;

import java.io.IOException;
import java.util.ArrayList;

import entities.Exam;
import entities.Question;
import entities.User;
import enums.MessageType;
import ocsf.server.ConnectionToClient;

public class ServerMessageHandler 
{
	static private MySQLController sqlController=MySQLController.getInstance(); 
	
	
	/**
	 * Finds out the type of the message and then initiates the appropriate method.
	 * @param msg
	 * @param client
	 */
	@SuppressWarnings({ "unchecked", "incomplete-switch" })
	public static void messageHandler(Object msg, ConnectionToClient client)
	{
		MessageType message = getType(msg);
		if (message == null)
			return;
		switch (message) 
		{
			case STRING:
				stringMessageHandler((String) msg, client);
				break;
			case STRING_ARRAY_LIST:
				stringArrayListMessageHandler((ArrayList<String>) msg, client);
				break;
			case QUESTION:
				questionMessageHandler((Question)msg, client);
				break;
			case EXAM:
				examMessageHandler((Exam)msg, client);
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
		if (msg instanceof Question)
			return MessageType.QUESTION;
		if (msg instanceof Exam)
			return MessageType.EXAM;
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
		return null;
	}

	/**
	 * Handles client messages of type Strings.
	 * @param message
	 * @param client
	 */
	public static void stringMessageHandler(String message, ConnectionToClient client) 
	{
		try 
		{
			switch (message) 
			{
				case "connected":
					EchoServer.updateclientsInfoList(client, "Connected");
					EchoServer.serverScreenController.clientConnected();
					client.sendToClient("Connected");
					break;
					
				case "disconnected":
					EchoServer.updateclientsInfoList(client, "Disconnected");
					client.sendToClient("Disonnected");
					break;
					
				case "get amount of questions":
					client.sendToClient(sqlController.getAmountOfQuestions());
					break;
					
				case "get amount of exams":
					client.sendToClient(sqlController.getAmountOfExams());
					break;
					
				case "Get all students":			
					client.sendToClient(sqlController.getAllStudents_Proffesors("student"));
					break;
					
				case "Get all professors":			
					client.sendToClient(sqlController.getAllStudents_Proffesors("professor"));
					break;
				case "Get all courses":			
					client.sendToClient(sqlController.getAllCourses());
					break;
			}
			
		} catch (IOException e) {}
	}

	/**
	 * Handles client messages that are an array list with String elements.
	 * @param arrayList
	 * @param client
	 */
	public static void stringArrayListMessageHandler(ArrayList<String> arrayList, ConnectionToClient client) 
	{
		String messageType = arrayList.get(0);
		try 
		{
			switch (messageType) 
			{
				case "login": 				
					User user = sqlController.verifyLogin(arrayList);
					if (user == null) 
						client.sendToClient("incorrect login");
				    else if (user.getUser_id().equals("logged"))
						client.sendToClient("already logged");
				    else
				    	client.sendToClient(user);
					break;
					
				case "logout":
					sqlController.logout(arrayList.get(1));
					client.sendToClient("logged out");
					break;
					
				case "load professor questions":
					client.sendToClient(sqlController.loadProfessorQuestions(arrayList.get(1)));
					break;
				
				case "update question courses":
					arrayList.remove(0);
					sqlController.addQuestionCourses(arrayList);
					client.sendToClient("updated question courses");
					break;
				
				case "update exam questions":
					arrayList.remove(0);
					sqlController.addExamQuestions(arrayList);
					client.sendToClient("added exam and questions");
					break;
				
				case "update question":
					arrayList.remove(0);
					sqlController.editQuestionInDb(arrayList);
					client.sendToClient("updated question");
					break;
					
				case "delete question":
					if(sqlController.deleteQuestionFromDb(arrayList.get(1)))
					{
						client.sendToClient("deleted question");
					}
					else
					{
						client.sendToClient("question in use");
					}
					break;
					
				case "load teaching map":
					client.sendToClient(sqlController.getProfessorSubjectsAndCourses(arrayList.get(1)));
					break;
				
				case "load course questions":
					client.sendToClient(sqlController.loadCourseQuestions(arrayList.get(1)));
					break;
					
				case "load student exams":
					client.sendToClient(sqlController.loadStudentExams(arrayList.get(1)));
					break;
					
				case "load student courses":
					client.sendToClient(sqlController.getStudentCourses(arrayList.get(1)));
					break;
				
				case "load exam file":
					sqlController.openExamFile(arrayList.get(1));
					client.sendToClient("file was loaded");
					break;
					
				case "for head of department report":
						if(arrayList.get(1).equals("student"))
							client.sendToClient(sqlController.getAllStudentExams(arrayList));
					
					break;
					
			}
		} catch (IOException e) {}
	}
	
	/**
	 * Handles client messages of type Question.
	 * @param question
	 * @param client 
	 */
	public static void questionMessageHandler(Question question, ConnectionToClient client) 
	{
		try 
		{
			sqlController.addQuestionToDB(question);
			client.sendToClient("question added");
		} catch (IOException e) {}
	}
	
	/**
	 * Handles messages of type Exam.
	 * @param exam
	 * @param client
	 */
	private static void examMessageHandler(Exam exam, ConnectionToClient client) 
	{
		try 
		{
			sqlController.addExamToDB(exam);
			client.sendToClient("exam added");
		} catch (IOException e) {}
	}
}
