package control;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import entities.Distribution;
import entities.ExamFile;
import entities.HeadOfDepartment;
import entities.Professor;
import entities.User;
import enums.MessageType;
import gui.StatisticsChooseScreenController;

//this class is a test class please don't use it unless it is  for checking 
///##########################////
public class checker
{
	
	
	public static void main(String[] args) {
		User p= new Professor<>(null, null);
		User H = new HeadOfDepartment(null, null, null, null, null, null, null);
		System.out.println(p.getClass()+""+H.getClass());
		Map<Class<?>,String> map=new HashMap<>();
		
		map.put(Professor.class, "try");
		map.put(HeadOfDepartment.class, "try 2");
		System.out.println(map.get(p.getClass()));
		System.out.println(map.get(H.getClass()));
	}
	
	
}
