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
