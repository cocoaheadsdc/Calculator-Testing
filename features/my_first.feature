Feature: 
  As an iOS developer
  I want to have a sample feature file
  So I can see what my next step is in the wonderful world of Frank/Cucumber testing

Scenario: 
    Rotating the simulator for demonstration purposes
Given I launch the app
Given the device is in landscape orientation
Given the device is in portrait orientation
Given the device is in landscape orientation
Given the device is in portrait orientation

Scenario:
	Adding numbers on the calculator
Given I launch the app
When I touch "3"
And I touch "8"
And I touch "+"
And I touch "6"
And I touch "Enter"
Then I should see a result of "44"

Scenario:
	Adding numbers on the calculator
Given I launch the app
When I touch "9"
And I touch "4"
And I touch "+"
And I touch "0"
And I touch "Enter"
Then I should see a result of "94"
