# Maven  
Apache Maven is a software project management and comprehension tool.  
Based on the concept of a project object model (POM), Maven can manage a project's build, reporting and documentation from a central piece of information.  

Build tool is essential for the process of building. It is needed for the following processes:  
* Generating source code  
* Generating documentation from the source code  
* Compiling of source code  
* Packaging of the complied codes into JAR files  
* Installing the packaged code in local repository, server or central repository  

## Why we use Maven?  
Maven is chiefly used for Java-based projects.  
It helps in downloading dependencies, which refers to the libraries or JAR files  

## The Problems That Maven Solved:
* Getting right JAR files for each project as there may be different versions of separate packages  
* To download dependencies visiting of the official website of different software is not needed. We can just visit "mvnrepositiry.com"  
* Helps to create the right project structure which is essential for execution  
* Building and Deploying the project to make it work  

## What Maven Does?
* It simplifies the process of building the project  
* The task of downloading Jar files and other dependencies does not need to be done manually
* It provides easy access to all the required information  
* Apache Maven helps manage all the processes, such as building, documentation, releasing, and distribution in project management

## pom.xml 
Project Object Model (POM) = an XML file that has all the information regarding project and configuration details.
When we tend to execute a task, Maven searches for the POM in the current directory

Example file that contains information about the project and configuration details used by Maven to build the project.
Includes the goals and plugins used by Maven in a project.
Maven looks for the pom.xml file in the current directory while executing a task or a goal.
It reads the pom.xml -> gets the needed configuration inforamtion -> then runs the goal.
