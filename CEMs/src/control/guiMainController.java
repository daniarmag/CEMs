package control;

import gui.statisticsChoseScreenController;

//this class is a test class please don't use it unless it is  for checking 
///##########################////
public class guiMainController {
	
	
	static statisticsChoseScreenController statisticsScreen;
	
	public static void setStatisticsChooseScreen(statisticsChoseScreenController controller)
	{
		statisticsScreen = controller;
	}
	
	
	
	public void statisticScreenData() {
		statisticsScreen.showData("student");
	}
	
	
	
}
