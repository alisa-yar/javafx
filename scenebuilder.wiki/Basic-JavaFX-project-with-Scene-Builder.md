This is a basic project that uses FXML, created with NetBeans (New Project -> JavaFX -> JavaFX FXML Application).

 It contains just three files:

*Main Application class*

```
package org.scenebuilder;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;

public class BasicApplication extends Application {

    @Override
    public void start(Stage stage) throws Exception {
        Parent root = FXMLLoader.load(getClass().getResource("BasicFXML.fxml"));
        Scene scene = new Scene(root);
        stage.setScene(scene);
        stage.show();
    }
    
    public static void main(String[] args) {
        launch(args);
    }
}
```

*FXML file*

```
<?xml version="1.0" encoding="UTF-8"?>

<?import javafx.scene.control.Button?>
<?import javafx.scene.control.Label?>
<?import javafx.scene.layout.AnchorPane?>

<AnchorPane id="AnchorPane" prefHeight="200" prefWidth="320" xmlns:fx="http://javafx.com/fxml/1" xmlns="http://javafx.com/javafx/8" fx:controller="org.scenebuilder.BasicFXMLController">
    <children>
        <Button fx:id="button" layoutX="126.0" layoutY="90" onAction="#handleButtonAction" text="Click Me!" />
        <Label fx:id="label" layoutX="126" layoutY="120" minHeight="16" minWidth="69" />
    </children>
</AnchorPane>
```

*Controller*

```
package org.scenebuilder;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Label;

public class BasicFXMLController {

    @FXML
    private Label label;

    public void initialize() {
        // TODO
    }

    @FXML
    private void handleButtonAction(ActionEvent event) {
        label.setText("Hello World!");
    }
}
```

**Run**

Building and running the project should display a small window with a clickable button:

[![Run the project][1]][1]

**How it works**

Briefly, in the main Application class, the FXMLLoader will load `basicFXML.fxml` from the jar/classpath, as specified by `FXMLLoader.load(getClass().getResource("BasicFXML.fxml"))`. 

When loading `basicFXML.fxml`, the loader will find the name of the controller class, as specified by `fx:controller="org.scenebuilder.BasicFXMLController"` in the FXML. 

Then the loader will create an instance of that class, in which it will try to inject all the objects that have an `fx:id` tag in the FXML and are marked with the `@FXML` annotation in the controller class. 

In this sample, the FXMLLoader will create the label based on `<Label ... fx:id="label"/>`, and it will inject the label instance into the `@FXML private Label label;` field. 

The FXMLLoader also parses all the custom event handlers included, like `"#handleButtonAction"`, and it will look for the matching methods in the controller that register those action handlers. In this case, `@FXML private void handleButtonAction(ActionEvent event)`.

Finally, when the whole FXML has been loaded, the FXMLLoader will call the controller's `initialize` method.

**Editing**

While the FXML file can be edited within the IDE, it is not recommended, as the IDE provides just basic syntax checking and autocompletion, but not visual guidance.

The best approach is opening the FXML file with Scene Builder, where all the changes will be saved to the file.

Scene Builder can be launched to open the file:

[![Scene Builder icon][2]][2]

Or the file can be opened with Scene Builder directly from the IDE:

- From NetBeans, on the project tab, double click on the file or right click and select `Open`. 
- From IntelliJ, on the project tab, right click on the file and select `Open In Scene Builder`.
- From Eclipse, on the project tab, right click on the file and select `Open with Scene Builder`.

[![Edit file with Scene Builder][3]][3]

If Scene Builder is properly installed and its path added to the IDE (see Remarks below), it will open the file:

[[images/sb1.png]]

Changes can be made by dragging new containers or new controls from the left panes, and properties and layout values can be changed on the right panes. 

Note that one of the id tag that allows injecting the FXML into the Java code is `fx:id`. It can be set in the `Code` pane:

[[images/sb2.png]]

After applying changes, save the file (Scene Builder -> File -> Save). If changes are made editing the file from the IDE, when saving the file, those will be updated on Scene Builder.

[1]: http://i.stack.imgur.com/CR4Ow.png
[2]: http://i.stack.imgur.com/Qx2it.png
[3]: http://i.stack.imgur.com/3aZTB.png