package message;

import java.util.ArrayList;
import javax.swing.JOptionPane;
import client.ChatClient;
import entities.Question;
import entities.User;
import gui.CreateQuestionScreenController;
import gui.LoginScreenController;
import gui.ProfessorScreenController;


public class ClientMessageHandler 
{
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
			case "professor subjects": 
				arrayList.remove(0);
				CreateQuestionScreenController.setSubjects(arrayList);
		}

	}

	/**
	 * Handles client messages that are an array list with Question elements.
	 * @param arrayList
	 */
	public static void questionArrayListMessageHandler(ArrayList<Question> arrayList) 
	{
		if (ChatClient.questionBankController != null) 
		{
			ChatClient.questionBankController.setArr(arrayList);
			ChatClient.questionBankController.updateQuestionTable();
		}
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
			ProfessorScreenController.start(user);
		} catch (Exception e) {}
	}
}
