#@author: Zuishek

Feature: manage notify user when a request is sent to him

Scenario: When a user2 sends a request to user1, user1 should have number of requests which he hasn't replied to incremented and appears in the navbar next to his username
Given I am logged in as second user
When I am on the welcome page
And I fill in "searchStart" with "Giza"
And I fill in "searchEnd" with "Liverpool"
And I press "Search For Rides"
And I follow "Send Request"
And I logout
And I am logged in as first user
And I am on the welcome page
Then Number of requests should be 1
And I should see "1"

Scenario: When user1 replies to the request, number of request which he hasn't replied to should decrement and if there are no more requests to reply to nothing should appear in the navbar next to his username
Given I am logged in as second user
When I am on the welcome page
And I fill in "searchStart" with "Giza"
And I fill in "searchEnd" with "Liverpool"
And I press "Search For Rides"
And I follow "Send Request"
And I logout
And I am logged in as first user
And I am on the requests page
And I follow "Accept"
Then Number of requests should be 0
And I should not see "0"