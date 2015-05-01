# @author: ISpoonJelly

Feature: Reporting a User

Scenario: Reporting a User
	Given I am logged in as first user
	When I am on the second user page
	And I follow "Report User"
	And I am on the report page
	And I fill in "reason" with "Spam"
	Then I am on the second user page