package control;
import java.util.Timer;
import java.util.TimerTask;
import javafx.scene.control.TextField;

public class TimerController {
	public static Timer timer = new Timer();
	static Integer minutesLeft;
	static boolean oneMinuteFlag = false;
    private static TextField TimerTXT;
    
	public static void startCountdown(Integer minutes, TextField TXT, String type) {
		minutesLeft = minutes;
        TimerTask task = new TimerTask() {
        	
            @Override
            public void run() {
            	minutesLeft--;
            	TXT.setText(minutesLeft.toString());

        		if(type.equals("Manual"))
	                if (minutesLeft == 0 && !oneMinuteFlag) {
	                	oneMinuteFlag = true;
	                	minutesLeft++;
	            		TimerTXT.setText(minutesLeft.toString());
	                	}
	                else if (oneMinuteFlag) {
	                    timer.cancel();
	                }
            }
        };
        // Schedule the task to run every minute
        timer.schedule(task, 0, 500);
		}
}
