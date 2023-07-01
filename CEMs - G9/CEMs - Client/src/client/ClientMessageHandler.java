package client;

import java.util.ArrayList;
import java.util.Map;
import control.AlertMessages;
import entities.Course;
import entities.Exam;
import entities.ExamFile;
import entities.ExamProfessorReport;
import entities.ExamResults;
import entities.ExamStatistics;
import entities.ExamTemplate;
import entities.ExamTimeChange;
import entities.Question;
import entities.StudentExam;
import entities.User;
import enums.MessageType;
import gui.QuestionCreationScreenController;
import gui.ExamCreationFirstController;
import gui.ExamCreationSecondController;
import gui.ExamRequestTimeController;
import gui.ExamResultsScreenController;
import gui.HeadOfDepartmentScreenController;
import gui.LoginScreenController;
import gui.ManualExamController;
import gui.ExamReportController;
import gui.ProfessorScreenController;
import gui.StudentScreenController;
import gui.TimePendingRequestsController;
import javafx.application.Platform;
import gui.ExamBankScreenController;
import gui.ComputerizedExamController;
import gui.StatisticsChooseScreenController;
import gui.StudentExamGradesController;
import gui.QuestionBankScreenController;
import gui.StudentExamScreenController;

/**
 * A class that handles the messages that clients receive from the server.
 */
public class ClientMessageHandler 
{
	static StudentScreenController studentController;
	static ProfessorScreenController professorController;
	static QuestionCreationScreenController questionCreationScreenController;
	static ExamCreationFirstController examCreationFirstController;
	static ExamCreationSecondController examCreationSecondController;
	static ExamBankScreenController examBankScreenController;
	static ExamRequestTimeController examRequestTimeController;
	static ExamResultsScreenController examResultsScreenController;
    static QuestionBankScreenController questionBankScreenController;
    static StudentScreenController studentScreenController;
    static StudentExamGradesController studentExamGradesController;
    static StudentExamScreenController studentExamScreenController;
    static ManualExamController manualExamController;
    static HeadOfDepartmentScreenController headOfDepartmentScreenController;
    static ComputerizedExamController computerizedExamController;
	static StatisticsChooseScreenController statisticsScreen;
	static ExamReportController professorExamReportController;
	static TimePendingRequestsController timePendingRequestsController;
	static 
	{
		studentController = new StudentScreenController();
		professorController = new ProfessorScreenController();
		headOfDepartmentScreenController = new HeadOfDepartmentScreenController();
	}
	
	/**
	 * @param controller the headOfDepartmentScreenController to set
	 */
	public static void setHeadOfDepScreenController(HeadOfDepartmentScreenController controller) 
	{
		headOfDepartmentScreenController = controller;
	}
	
	/**
	 * @param controller the timePendingRequestsController to set
	 */
	public static void setTimePendingRequestsController(TimePendingRequestsController controller) 
	{
		timePendingRequestsController = controller;
	}
	
	/**
	 * @param controller the examRequestTimeController to set
	 */
	public static void setExamRequestTimeController(ExamRequestTimeController controller) 
	{
		examRequestTimeController = controller;
	}
	
	/**
	 * @param controller the examCreationFirstController to set
	 */
	public static void setExamResultsScreenController(ExamResultsScreenController controller) 
	{
		examResultsScreenController = controller;
	}
	/**
	 * @param controller the examCreationFirstController to set
	 */
	public static void setProfessorExamReportController(ExamReportController controller) 
	{
		professorExamReportController = controller;
	}

	/**
	 * @param controller the examCreationFirstController to set
	 */
	public static void setExamCreationFirstController(ExamCreationFirstController controller) 
	{
		examCreationFirstController = controller;
	}
	
	/**
	 * @param controller the examCreationFirstController to set
	 */
	public static void setExamCreationSecondController(ExamCreationSecondController controller) 
	{
		examCreationSecondController = controller;
	}

	/**
	 * @param controller the professorController to set
	 */
	public static void setProfessorController(ProfessorScreenController controller) 
	{
		professorController = controller;
	}

	/**
	 * @param controller the examBankScreenController to set
	 */
	public static void setExamBankScreenController(ExamBankScreenController controller) 
	{
		examBankScreenController = controller;
	}

	/**
	 * @param controller the statisticsScreen to set
	 */
	public static void setStatisticsChooseScreen(StatisticsChooseScreenController controller)
	{
		statisticsScreen = controller;
	}
	
	/**
	 * @param controller the questionBankScreenController to set
	 */
	public static void setQuestionBankController(QuestionBankScreenController controller)
	{
		questionBankScreenController = controller;
	}
	
	/**
	 * @param controller the questionCreationScreenController to set
	 */
	public static void setCreateQuestionScreenController(QuestionCreationScreenController controller)
	{
		questionCreationScreenController = controller;
	}
	
	/** 
	 * @param controller the studentExamScreenController to set
	 */
	public static void setStudentExamController(StudentExamScreenController controller)
	{
		studentExamScreenController = controller;
	}
	
	/**
	 * @param controller the studentScreenController to set
	 */
	public static void setStudentScreenController(StudentScreenController controller) 
	{
		studentScreenController = controller;
	}
	
	/**
	 * @param controller the studentExamGradesController to set
	 */
	public static void setStudentExamGradesController(StudentExamGradesController controller)
	{
		studentExamGradesController = controller;
	}
	
	/**
	 * @param controller the manualExamController to set
	 */
	public static void setManualExamController(ManualExamController controller) 
	{
		manualExamController = controller;
	}
	
	/**
	 * @param controller the computerizedExamController to set
	 */
	public static void setExamController(ComputerizedExamController controller) 
	{
			computerizedExamController = controller;
	}
		
	/**
	 * Finds out the type of the message and then initiates the appropriate method.
	 * @param msg
	 */
	@SuppressWarnings({ "unchecked", "incomplete-switch" })
	public static void messageHandler(Object msg) 
	{
		MessageType message = getType (msg);
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
				headOfDepartmentScreenController.setUserArr((ArrayList<?>)msg);
				statisticsScreen.showData(((ArrayList<User>)msg).get(0).getRole());
				break;
				
			case COURSE_ARRAY_LIST:
				headOfDepartmentScreenController.setUserArr((ArrayList<?>)msg);
				statisticsScreen.showData("course");
				break;
				
			case EXAM_ARRAY_LIST:
				examArrayListMessageHandler((ArrayList<Exam>) msg);
				break;
				
			case EXAM_STUDENT_ARRAY_LIST:
				statisticsScreen.openRep(msg);
				break;
				
			case EXAMS_STATISTICS:
				statisticsScreen.openRep(msg);
				break;
				
			case EXAM_FILE:
				examFileMessageHandler((ExamFile) msg);
				break;
			
			case EXAM_RESULTS_ARRAY_LIST:
				examResultsArrayListMessageHandler((ArrayList<ExamResults>)msg);
				break;
				
			case EXAM_TEMPLATE:
				professorExamReportController.loadTable((ArrayList<ExamTemplate>)msg);
				break;
				
			case EXAM_PROFESSOR_REPORT:
				professorExamReportController.openRep(msg);
				break;
			
			case EXAM_TIME_CHANGE_ARRAY_LIST:
				examTimeChangeArrayListHandler((ArrayList<ExamTimeChange>)msg);
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
				else if (firstElement instanceof StudentExam)
					return MessageType.EXAM_STUDENT_ARRAY_LIST;
				else if (firstElement instanceof ExamResults)
					return MessageType.EXAM_RESULTS_ARRAY_LIST;
				else if (firstElement instanceof ExamStatistics)
					return MessageType.EXAMS_STATISTICS;
				else if (firstElement instanceof ExamTemplate)
					return MessageType.EXAM_TEMPLATE;
				else if (firstElement instanceof ExamTimeChange)
					return MessageType.EXAM_TIME_CHANGE_ARRAY_LIST;
			}
		} 
		else if (msg instanceof Map)
			return MessageType.MAP;
		else if (msg instanceof User)
			return MessageType.USER;
		else if (msg instanceof ExamFile)
			return MessageType.EXAM_FILE;
		else if (msg instanceof ExamProfessorReport)
			return MessageType.EXAM_PROFESSOR_REPORT;
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
				
				Platform.runLater(() -> 
				{
					AlertMessages.makeAlertNoPlatform("Server disconnected.","Disconnected");
					System.exit(0);
				});
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
			
			case "question in use":
				questionBankScreenController.setRemovalFlag(false);
				AlertMessages.makeAlert("Cannot delete - question is already in use.","Question Creation");
				break;
			
			case "selected exam is now active":
				AlertMessages.makeAlert("Exam activated.", "Activate Exam");
				break;
				
			case "selected exam is now inactive":
				AlertMessages.makeAlert("Exam deactivated.", "Dectivate Exam");
				break;
				
			case "exam submitted":
				AlertMessages.makeAlert("Exam submitted, good luck!", "Submit Exam");
				break;
			
			case "request sent":
				AlertMessages.makeAlert("Request Sent.", "Extend Time");
				break;
			
			case "You have pending time change requests":
				AlertMessages.makeAlert("You have pending time change approvals", "Alert");
				break;
				
			case "exam uploaded":
				break;
		}
	}
	
	/**
	 * Handles server messages that are an array list with String elements.
	 * @param arrayList
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
				
			case "student courses":
				arrayList.remove(0);
				studentScreenController.setArr(arrayList);
				break;
			
			case "selected exam is now inactive":
				try 
				{
					if (manualExamController != null) 
					{
						if (arrayList.get(1).equals(manualExamController.getOnGoingExam().getExam_id()))
						{
							manualExamController.disableFileUpload();
							AlertMessages.makeAlertNoPlatform("Exam has been terminated.", "Exam");
						}
					}
					if (computerizedExamController != null) 
					{
						if (arrayList.get(1).equals(computerizedExamController.getOnGoingExam().getExam_id()))
						{
							computerizedExamController.closeWindow();
							AlertMessages.makeAlertNoPlatform("Exam has been terminated.", "Exam");
						}
					}
				} catch (NullPointerException e) {e.printStackTrace();}
				break;
			
			case "send email to user":
				AlertMessages.makeAlert(arrayList.get(2) + arrayList.get(1), "Simulation");
				break;
			
			case "exam time is now changed":
				try 
				{
					if (manualExamController != null) 
					{
						if (arrayList.get(1).equals(manualExamController.getOnGoingExam().getExam_id())) 
						{
							manualExamController.setTime(Integer.parseInt(arrayList.get(2)));
							AlertMessages.makeAlertNoPlatform("Exam has new time.", "Exam");
						}
							
					}
					if (computerizedExamController != null) 
					{
						if (arrayList.get(1).equals(computerizedExamController.getOnGoingExam().getExam_id())) 
						{
							computerizedExamController.setTime(Integer.parseInt(arrayList.get(2)));
							AlertMessages.makeAlertNoPlatform("Exam has new time.", "Exam");
						}
					}
				
				} catch (NullPointerException e) {e.printStackTrace();}
				break;
			
			case "head of dep id to set":
				examRequestTimeController.setHeadofDepId(arrayList.get(1));
				break;
				
			case "send immediate approval to head of department":
				if (headOfDepartmentScreenController != null)
				{
					if(headOfDepartmentScreenController.getId().equals(arrayList.get(1)))
						AlertMessages.makeAlert("You have a new request pending.", "Alert");
				}
				break;
		}
	}

	/**
	 * Handles client messages that are an array list with Question elements.
	 * @param arrayList
	 */
	public static void questionArrayListMessageHandler(ArrayList<Question> arrayList) 
	{
		String messageType = arrayList.remove(0).getQuestionText();
		switch (messageType) 
		{
			case "professor questions":
				questionBankScreenController.setArr(arrayList);
				questionBankScreenController.updateQuestionTable(arrayList);
				break;
			
			case "course questions":
				examCreationFirstController.setArr(arrayList);
				break;
				
			case "exam questions":
				studentExamScreenController.setQArr(arrayList);
				break;
		}
		
	}
	
	/**
	 * Handles client messages that are an array list with Exam elements.
	 * @param arrayList
	 */
	public static void examArrayListMessageHandler(ArrayList<Exam> arrayList) 
	{
		String messageType = arrayList.remove(0).getExam_name();
		switch (messageType) 
		{
			case "student exams":
				studentExamScreenController.setArr(arrayList);
				studentExamScreenController.updateExamTable();
				break;
			
			case "professor exams":
				examBankScreenController.setArr(arrayList);
				examBankScreenController.updateExamTable(arrayList);
				break;
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
			switch(user.getRole())
			{
			case "professor":
				professorController.start(user);
				break;
			case "student":
				studentController.start(user);
				break;
			case "head":
				headOfDepartmentScreenController.start(user);			
				break;
			}	
		} 
		catch (Exception e) {e.printStackTrace();}
	}
	
	/**
	 * Handles client messages of type Map.
	 * @param map
	 */
	public static void mapMessageHandler(Map<?, ?> map)
	{
		professorController.setTeachingMap(map);
	}
	
	/**
	 * Handles client messages of type ExamFile
	 * @param examFile
	 */
	public static void examFileMessageHandler(ExamFile examFile) 
	{
		manualExamController.setExamFile(examFile);
	}
	
	/**
	 * Handles client messages of type ExamResults
	 * @param arrayList
	 */
	private static void examResultsArrayListMessageHandler(ArrayList<ExamResults> arrayList) 
	{
		String messageType = arrayList.remove(0).getComment();
		switch (messageType) 
		{
			case "student grades":
				studentExamGradesController.setArr(arrayList);
				studentExamGradesController.updateExamTable();
				break;
			
			case "pending exams":
				examResultsScreenController.setArr(arrayList);
				examResultsScreenController.updateExamTable(arrayList);
				Platform.runLater(() -> examResultsScreenController.checkForSuspects());
				break;
		}
	}
	
	/**
	 * Handles client messages of type ExamTimeChange
	 * @param arrayList
	 */
	private static void examTimeChangeArrayListHandler(ArrayList<ExamTimeChange> arrayList) 
	{
		timePendingRequestsController.setArr(arrayList);
		timePendingRequestsController.updateRequestsTable();
	}
	
}
