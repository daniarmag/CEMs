package gui;

import javafx.scene.Node;
import javafx.stage.Stage;
import javafx.stage.StageStyle;

public class WindowUtils 
{

    public static void enableWindowDraggable(Node node, Stage primaryStage)
    {
        final double[] xOffset = new double[1];
        final double[] yOffset = new double[1];

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
