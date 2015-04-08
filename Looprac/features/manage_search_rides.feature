Feature: Manage search rides

Scenario: User can search without entering search parameters
Given I am on the welcome page
When I press "Search For Rides"
Then I should be on the rides page
And I should see "Ride from Giza to City Stars"
And I should see "Ride from Giza to Liverpool"
And I should see "Ride from City Stars to Liverpool"


Scenario: User can search for rides from Giza
Given I am on the welcome page
When I fill in "searchStart" with "Giza"
And I press "Search For Rides"
Then I should see "Ride from Giza to City Stars"
And I should see "Ride from Giza to Liverpool"

Scenario: User can search for ride from City Stars to Liverpool
Given I am on the welcome page
When I fill in "searchStart" with "City Stars"
And I fill in "searchEnd" with "Liverpool"
And I press "Search For Rides"
Then I should see "Ride from City Stars to Liverpool"

Scenario: User can search for ride to Liverpool
Given I am on the welcome page
When I fill in "searchEnd" with "Liverpool"
And I press "Search For Rides"
Then I should see "Ride from Giza to Liverpool"
And I should see "Ride from City Stars to Liverpool"