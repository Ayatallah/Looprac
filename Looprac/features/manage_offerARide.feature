# @author: ISpoonJelly

Feature: When I am offering a Ride, I should be able to enter all the options

Scenario: When I try to offer a ride, I fill in all the options
	Given I am logged in as first user
	When I am on the offer ride page
	And I fill in "source_id" with "1"
	And I fill in "destination_id" with "2"
	And I fill in "datetime" with "2015-05-23 14:00:00"
	And I fill in "ac" with "true"
	And I fill in "music" with "true"
	And I fill in "smoking" with "true"
	And I fill in "food" with "true"
	And I fill in "pets" with "true"
	And I fill in "seatNum" with "4"
	And I fill in "description" with "HI"
	Then I should be on the offer ride page