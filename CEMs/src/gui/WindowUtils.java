package gui;

import javafx.scene.Node;
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
    public static void enableWindowDraggable(Node node, Stage primaryStage)
    {
        final double[] xOffset = new double[1];
        final double[] yOffset = new double[1];

        //Removes windows default window buttons.
        primaryStage.initStyle(StageStyle.UNDECORATED);
        
        //Both lambda expressions are to enable dragging mode with undecorated window style.
        node.setOnMousePressed(event -> {
            xOffset[0] = primaryStage.getX() - event.getScreenX();
            yOffset[0] = primaryStage.getY() - event.getScreenY();
        });

        node.setOnMouseDragged(event -> {
            primaryStage.setX(event.getScreenX() + xOffset[0]);
            primaryStage.setY(event.getScreenY() + yOffset[0]);
        });
    }
}
