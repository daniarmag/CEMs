1. Finished exam creation process, for each screen I've added an errorMap which validates the user input. - gotta add a preview option before submitting. 
2. Added javadoc to all the classes that I have created during the prototype phase aswell as everything that I did afterwards.
3. Organized the code in each controller that I've made, splitted into more methods so the code would be more modular. 
4. Related to 1 - added queries to update tables exam and exam_question in the database.

******************************************************************
8.6
Added score counter in exam creation screen
Added more safety checks to this area and made the code more modular in that area.
Fixed issue where abort wouldn't pass through to all the clients

******************************************************************
12.6
Manual + Computerized are now functional 
Professor can preview his exam before submitting them (same GUI like computerized exam but different permissions)
Added exam bank which handles exam activation and deactiovation (which are already fully functional) and request for time extension TBD.
When the professor disables an exam, the exam will be closed in the students prespective.

******************************************************************
13-17.6
Completed many more screen for all kinds of roles
Added the ability to change time for (hof) - this changes time in real time
A pop up message will be received in hof screen if there's a pending time request change
Added javadoc to all parts of code
Fixed GUI stuff - like wrong sizes, added Ids and names for professors and hofs
Changed to password field in login
Added courses names in report table of professor

******************************************************************
18.6
Added refresh button for a few tables (ones that made sense)
Fixed remaining GUI stuff
Seperated the project into 2 (client and server projects)
A lot of bug fixes - seems to run smoothly allround now
