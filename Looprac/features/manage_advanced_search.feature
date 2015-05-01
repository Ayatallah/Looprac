Feature: Managing Advanced Search

Scenario: When a user is on the new search page and he selects the from to be Giza and the To to be Liverpool, and he selects AC and Music, the ride from Giza to Liverpool should appear.
Given I am on the new search page
When I fill in "ac" with "true"
And I fill in "music" with "true"
And I press "submit"
Then I am on the show search page
And I should see "An available ride is from Giza to Liverpool"
