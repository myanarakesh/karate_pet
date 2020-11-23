
# Karate API Automation Project of Petstore


# Following are the list of endpoints being automated with its respective Method type

~~~~

POST v2/user/createWithArray

GET  v2/user/{username}    
   
PUT v2/user/{username}

GET v2/user/login/

DELETE v2/user/{username}

GET v2/pet/findByStatus

GET v2/store/order/{orderId}

POST v2/pet

POST v2/store/order
~~~~

 # Following is the refence and official document which I took help to build up this project
~~~~
https://github.com/intuit/karate
~~~~

# mechanism to execute the tests  
  ~~~~
  Clone this repo and switch to the main branch. If your using command line prompt then follwoing commands will be useful (Before executing following commands please goto your folder directory)
  * mvn clone https://github.com/myanarakesh/steerleanAssignment.git
  * cd steerleanAssignment
  * mvn checkout main
  * mvn pull
  Above command will help you to downlowd the projet into your local machine. Import this maven project into your IDE and run the follwoing command on root directory
  * `mvn clean install`
  Above command will run all the test cases which configured under TestRunner.java file
  
  To view the reports you can open the cucumber 'overview-features.html' file which will generate under 'target/cucumber-html-reports'

  ~~~~
  
# CI on Github

   ~~~~
   Continue Integration setting is mentioned under #main.yml file. Which has setting to run when code is pushed in main branch
   ~~~~
