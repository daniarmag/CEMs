package control;

import gui.StatisticsChooseScreenController;

//this class is a test class please don't use it unless it is  for checking 
///##########################////
public class guiMainController {
	
	
	static StatisticsChooseScreenController statisticsScreen;
	
	public static void setStatisticsChooseScreen(StatisticsChooseScreenController controller)
	{
		statisticsScreen = controller;
	}
	
	
	
	public void statisticScreenData() {
		statisticsScreen.showData("student");
	}
	
	
	
}
