package gui;

import java.io.IOException;

import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;
import javafx.stage.StageStyle;

/**
 * Utility class for enabling window dragging functionality.
 */
public class WindowUtils 
{
    /**
     * Enables the dragging functionality for a window.
     *
     * @param node         The Node representing the window content.
     * @param primaryStage The primary Stage of the window.
     */
    public static Stage createNewStage(String fxmlFilePath, String cssFilePath, String title) throws IOException 
    {
    	final double[] xOffset = new double[1];
        final double[] yOffset = new double[1];
        Parent root = FXMLLoader.load(WindowUtils.class.getResource(fxmlFilePath));
        Scene scene = new Scene(root);
        if (cssFilePath != null) {
            scene.getStylesheets().add(WindowUtils.class.getResource(cssFilePath).toExternalForm());
        }
        Stage primaryStage = new Stage();
        primaryStage.setScene(scene);
        primaryStage.setTitle(title);
        primaryStage.setResizable(false);
        
        //Removes windows default window buttons.
        primaryStage.initStyle(StageStyle.UNDECORATED);
        
        //Both lambda expressions are to enable dragging mode with undecorated window style.
        scene.setOnMousePressed(event -> {
            xOffset[0] = primaryStage.getX() - event.getScreenX();
            yOffset[0] = primaryStage.getY() - event.getScreenY();
        });

        scene.setOnMouseDragged(event -> {
            primaryStage.setX(event.getScreenX() + xOffset[0]);
            primaryStage.setY(event.getScreenY() + yOffset[0]);
        });
        return primaryStage;
    }
}


