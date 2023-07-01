package serverGui;

import java.io.IOException;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;
import javafx.stage.StageStyle;

/**
 * Utility class for enabling window dragging functionality.
 */
public class ScreenUtils 
{
    /**
     * Enables the dragging functionality for a window.
     * @param fxmlFilePath
     */
    public static Stage createNewStage(String fxmlFilePath) 
    {
    	final double[] xOffset = new double[1];
        final double[] yOffset = new double[1];
        Stage primaryStage = new Stage();
        try
        {
	        Parent root = FXMLLoader.load(ScreenUtils.class.getResource(fxmlFilePath));
	        Scene scene = new Scene(root);
	        primaryStage.setScene(scene);
	        primaryStage.setResizable(false);
	        
	        //Removes windows default window buttons.
	        primaryStage.initStyle(StageStyle.UNDECORATED);
	        
	        primaryStage.setTitle("Server Application");
	        
	        //Both lambda expressions are to enable dragging mode with undecorated window style.
	        scene.setOnMousePressed(event -> {
	            xOffset[0] = primaryStage.getX() - event.getScreenX();
	            yOffset[0] = primaryStage.getY() - event.getScreenY();
	        });
	
	        scene.setOnMouseDragged(event -> {
	            primaryStage.setX(event.getScreenX() + xOffset[0]);
	            primaryStage.setY(event.getScreenY() + yOffset[0]);
	        });
        }
        catch(IOException e) {e.printStackTrace();}
        return primaryStage;
    }

}


