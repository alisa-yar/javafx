Scene Builder is a visual layout tool that lets users quickly design JavaFX application user interfaces, without coding. 

Users can drag and drop UI components to a work area, modify their properties, apply style sheets, and the FXML code for the layout that they are creating is automatically generated in the background. 

The result is an FXML file that can then be combined with a Java project by binding the UI to the application's logic.

From a Model View Controller (MVC) perspective:

- The FXML file, containing the description of the user interface, is the view. 
- The controller is a Java class, optionally implementing the Initializable class, which is declared as the controller for the FXML file. 
- The model consists of domain objects, defined on the Java side, that can be connected to the view through the controller.

<h2>Scene Builder Installation</h2>

1. Download Scene Builder most recent version from Gluon's [website][1], selecting the installer for your platform or the executable jar.

2. With the installer downloaded, double click to install Scene Builder on your system. An updated JRE is included.

3. Double click on the Scene Builder icon to run it as standalone application.

4. IDE Integration

While Scene Builder is a standalone application, it produces FXML files that are integrated with a Java SE project. When creating this project on an IDE, it is convenient to include a link to the Scene Builder path, so FXML files can be edited.

 - NetBeans: On Windows go to NetBeans->Tools->Options->Java->JavaFX. On Mac OS X go to NetBeans->Preferences->Java->JavaFX. Provide the path for the Scene Builder Home.

[![Scene Builder Path - NetBeans][2]][2]

- IntelliJ: On Windows go to IntelliJ->Settings->Languages & Frameworks->JavaFX. On Mac OS X go to IntelliJ->Preferences->Languages & Frameworks->JavaFX. Provide the path for the Scene Builder Home.

[![Scene Builder Path - IntelliJ][3]][3]

- Eclipse: On Windows go to Eclipse->Window->Preferences->JavaFX. On Mac OS X go to Eclipse->Preferences->JavaFX. Provide the path for the Scene Builder Home.

[![Scene Builder Path - Eclipse][4]][4]

<h3>A little bit of history</h3>

The Scene Builder project was created using JavaFX by Oracle and it is open source within the OpenJFX project.

Oracle [provided][5] binaries, up until Scene Builder v 2.0, including only JavaFX features before the release of Java SE 8u40, so new features like the `Spinner` controls are not included.

[Gluon][6] took over the binary releases distribution, and an up-to-date Scene Builder 8+ can be downloaded for every platform from [here][7].

It includes the latest changes in JavaFX, and also recent improvements and bug fixes.

This is the official repository of the Scene Builder open source project, where issues and feature requests can be created [here][8] and pull requests [here][9].

<h3>Tutorials</h3>

Scene Builder old tutorials can be found here:

- Oracle Scene Builder 2.0 [tutorial][10]. 

FXML tutorials can be found here:
 
- Oracle FXML [tutorial][11]

<h3>Custom controls</h3>

Gluon has fully [documented][12] the new feature that allows importing third party jars with custom controls, using the Library Manager (available since Scene Builder 8.2.0).

[![Library Manager][14]][14]

<h3>StackOverflow Questions</h3>

Tag related: [SceneBuilder][13] 


[1]: http://gluonhq.com/labs/scene-builder/#download
[2]: http://i.stack.imgur.com/MhPCf.png
[3]: http://i.stack.imgur.com/OLcmv.png
[4]: http://i.stack.imgur.com/5QgCj.png
[5]: http://www.oracle.com/technetwork/java/javase/downloads/sb2download-2177776.html
[6]: http://gluonhq.com
[7]: http://gluonhq.com/labs/scene-builder
[8]: https://github.com/gluonhq/scenebuilder/issues
[9]: https://github.com/gluonhq/scenebuilder/pulls
[10]: https://docs.oracle.com/javase/8/scene-builder-2/get-started-tutorial/jfxsb-get_started.htm
[11]: https://docs.oracle.com/javase/8/javafx/fxml-tutorial/
[12]: http://docs.gluonhq.com/scenebuilder/
[13]: http://stackoverflow.com/questions/tagged/scenebuilder
[14]: http://i.stack.imgur.com/YHDkP.png