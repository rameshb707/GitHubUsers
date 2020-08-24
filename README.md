# GitHub Users App for iOS
===================
This document currently covers all the information of the design Pattern, pagination, favourites, error handling, code coverage and end to end UIAutomationTest

Prerequisite
-------------

> - [Xcode 11.5]
> - Swift 5.0 
>- Targent from iOS 11


Project Structure
-------------
> - The project is build by using MVVM Design Pattern.

HTTP Error Handling 
-------------
Handled client error, parsing error and network reachablility in standard manner

Code Coverage using XCUnitTest
-------------

Achieved 97% of the ViewModal, Network Manager, View contoller etc.. as shown in the screenhsot in the project repo

End to End flow Automation using XCUITest
-------------
Achieved UITest for end to end flow is Automated

Functionality
-------------

1) Loading the list in the table view with smooth scrolling 
2) Gracefully Handled HTTP response in HTTPValidation file
3) Pagination based on user interaction with very interactive way and loading 20 items per page
    NOTE: On loading new page the same results are occuring every page
4) Favorite and Unfavorite functinality restricted to device (Saving in userdefault to show)
5) Handled network activity and error scenario in a standard way
6) No Memory leaks used Instruments to check the allocation and memory leaks as attached in the project
7) Project is interactive and responsive available in both iPhone and iPad.
8) Regular git commits with valid commit message
9) Each and every propert and function is documented in Apple standard manner
10) Zero warnings
11) Zero crashes

Time Taken
-------------

- Took Around 12 hours to complete the task 
- Every 3 hours I made a commit 

 Functinolity Not covered
-------------

- Dynamic type font for the app
 ​
<img width="496" alt="Screenshot 2020-08-23 at 9 03 30 PM" src="https://user-images.githubusercontent.com/7485633/90993256-592f6480-e5de-11ea-8dc1-8716aa1cc40c.png">
<img width="496" alt="Screenshot 2020-08-23 at 9 03 42 PM" src="https://user-images.githubusercontent.com/7485633/90993262-5fbddc00-e5de-11ea-9d6f-809d7b5b69fa.png">
<img width="675" alt="Screenshot 2020-08-24 at 7 32 56 AM" src="https://user-images.githubusercontent.com/7485633/90993285-76643300-e5de-11ea-9ea4-05b753b17afa.png">
<img width="675" alt="Screenshot 2020-08-24 at 7 32 53 AM" src="https://user-images.githubusercontent.com/7485633/90993292-7d8b4100-e5de-11ea-8640-d91d2f347da7.png">
<img width="1396" alt="Screenshot 2020-08-24 at 6 59 57 AM" src="https://user-images.githubusercontent.com/7485633/90993304-8bd95d00-e5de-11ea-8e4b-dd263cc34bd9.png">
<img width="675" alt="Screenshot 2020-08-24 at 7 53 22 AM" src="https://user-images.githubusercontent.com/7485633/90993413-f8ecf280-e5de-11ea-8c52-6333dfd4654c.png">
