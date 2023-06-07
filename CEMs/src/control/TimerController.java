package control;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;
import java.util.Timer;
import java.util.TimerTask;

public class TimerController {
	private static int SECONDS_IN_MINUTE = 60;

	private String studentID;
	private int duration, minutes, seconds;
	private int remainingSeconds;
	private Timer timer;

	public TimerController(String studentID, int duration) {
		this.studentID = studentID;
		this.remainingSeconds = duration * SECONDS_IN_MINUTE;
	}

	public void startTimer() {
		timer = new Timer();
		TimerTask timerTask = new TimerTask() {
			@Override
			public void run() {
				if (remainingSeconds > 0) {
					minutes = remainingSeconds / SECONDS_IN_MINUTE;
					seconds = remainingSeconds % SECONDS_IN_MINUTE;
					remainingSeconds--;
				} else {
					timer.cancel();
					System.out.printf("[%s] Time's up!%n", studentID);
				}
			}
		};
		timer.scheduleAtFixedRate(timerTask, 0, 1000);
	}

	public int getRemainingTime() {
		if (minutes > 0)
			return minutes;
		else
			return seconds;
	}
}
