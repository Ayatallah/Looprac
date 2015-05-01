#@author: Zuishek

Feature: Manage request button being disabled after user sends a request


Scenario: When a user sends a request to a specific ride, the button should be changed into Ride Request send and it should be disabled and nothing happens when he clicks it again
Given I am logged in as second user
When I am on the welcome page
And I fill in "searchStart" with "Giza"
And I fill in "searchEnd" with "Liverpool"
And I press "Search For Rides"
And I follow "Send Request"
And I press "Ride Request sent"
Then I should be on the rides page

