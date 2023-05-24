package client;

import ocsf.client.*;
import common.ChatIF;
import entities.Question;
import entities.User;
import gui.HostSelectionScreenController;
import gui.LoginScreenController;
import gui.ProfessorScreenController;
import gui.QuestionBankController;

import java.io.*;
import java.util.ArrayList;

import javax.swing.JOptionPane;

public class ChatClient extends AbstractClient
{
	
	// Instance variables **********************************************

	/**
	 * The interface type variable. It allows the implementation of the display
	 * method in the client.
	 */
	ChatIF clientUI;
	final public static int DEFAULT_PORT = 5555;
	public static boolean awaitResponse = false;
	public static QuestionBankController questionBankController;
	public static HostSelectionScreenController hostSelectionScreenController;
	public static LoginScreenController loginScreenController;
	
	 public static QuestionBankController getQuestionBankController() 
	 {
		 return questionBankController;
	 }
	 
	 public static void setLoginScreenController(LoginScreenController controller)
	 {
		 loginScreenController = controller;
	 }
	 
	 public static void setQuestionBankController(QuestionBankController controller)
	 {
		 questionBankController = controller;
	 }
	 
	 public static void setHostSelectionScreenController(HostSelectionScreenController controller)
	 {
		 hostSelectionScreenController = controller;
	 }

	// Constructors ****************************************************

	/**
	 * Constructs an instance of the chat client.
	 *
	 * @param host     The server to connect to.
	 * @param port     The port number to connect on.
	 * @param clientUI The interface type variable.
	 */

	public ChatClient(String host, int port, ChatIF clientUI) throws IOException
	{
		super(host, port); // Call the superclass constructor
		this.clientUI = clientUI;	
	}

	// Instance methods ************************************************

	/**
	 * This method handles all data that comes in from the server.
	 *
	 * @param msg The message from the server.
	 */
	public void handleMessageFromServer(Object msg) 
	{
		System.out.println("--> handleMessageFromServer");
		awaitResponse = false;
		System.out.println(msg.toString());
		//Load the question from the database
		if (msg instanceof ArrayList)
		{
			ArrayList<Question> arr = (ArrayList<Question>) msg;
            if (questionBankController != null) 
            {
                questionBankController.setArr(arr);
                questionBankController.updateQuestionTable();
            }
		}
		else if (msg.toString().equals("Incorrect login"))
		{
			JOptionPane.showMessageDialog(null, "Incorrect useranme or password.", "Login", JOptionPane.INFORMATION_MESSAGE);
		}
		else if (msg instanceof User)
		{
			try {
				LoginScreenController.hideCurrentScene();
				ProfessorScreenController.start();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		//Disconnect all clients when the server is disconnected.
		else if (msg.toString().equals("Abort"))
		{
			JOptionPane.showMessageDialog(null, "Server disconnected.", "Disconnected", JOptionPane.INFORMATION_MESSAGE);
			System.exit(0);
		}
			
	}

	/**
	 * This method handles all data coming from the UI
	 *
	 * @param message The message from the UI.
	 */

	public void handleMessageFromClientUI(Object msg) 
	{
		try 
		{
			openConnection();// in order to send more than one message
			awaitResponse = true;
			sendToServer(msg);
			// wait for response
			while (awaitResponse)
			{
				try 
				{
					Thread.sleep(100);
				} 
				catch (InterruptedException e) 
				{
					e.printStackTrace();
				}
			}
		} 
		catch (IOException e) 
		{
			e.printStackTrace();
			clientUI.display("Could not send message to server: Terminating client." + e);
			quit();
		}
	}

	/**
	 * This method terminates the client.
	 */
	public void quit() 
	{
		try 
		{
			closeConnection();
		} 
		catch (IOException e){}
	}
	
}

