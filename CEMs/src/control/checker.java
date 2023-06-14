package control;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import entities.Distribution;
import entities.ExamFile;
import entities.User;
import enums.MessageType;
import gui.StatisticsChooseScreenController;

//this class is a test class please don't use it unless it is  for checking 
///##########################////
public class checker
{
	
	
	public static void main(String[] args) {
		Map<Class<?>,MessageType> manager=new HashMap<>();
		String a="0-55";
		String b="56-65";
		String c="66-75";
		Distribution[] dArr=new Distribution[6];
		//check(dArr);
		System.out.println(dArr[0]);
		System.out.println(b.compareTo(c));
		ArrayList<User> u=new ArrayList<>();
//		u.add(new User(null, null, null, null, null, null, null));
//		
//		Object ob=manager;
//		manager.put(User.class, MessageType.USER);
//		manager.put(HashMap.class, MessageType.MAP);
//		manager.put(ExamFile.class,MessageType.EXAM_FILE);
//		System.out.println();
//		System.out.println(manager.get(ob.getClass()));
		
	}

	private static void check(Distribution[] dArr) {
		dArr[0]=null;
		
	}
	
	
	
}
