Feature: Manage messages

Scenario: User can view his messages
Given I am logged in as first user
And I am on the welcome page
When I follow "Inbox"
Then I should be on the messages page

Scenario: User can go to send a new message
Given I am logged in as first user
And I am on the messages page
When I follow "New Message"
Then I should be on the new message page

Scenario: When a user sends a message to another user, the second user's number of unread messages are increased
Given I am logged in as first user
And I am on the new message page
When I send test message
And I logout
And I am logged in as second user
Then Number of unread messages of second user should be 1

Scenario: When a user sends a message to another user, it should appear in the inbox of the second user
Given I am logged in as first user
And I am on the new message page
When I send test message
And I logout
And I am logged in as second user
And I follow "Inbox"
Then I should see "Test"

Scenario: Second user can reply to first user's message, first user number of unread messages are increased
Given I am logged in as first user
And I am on the new message page
When I send test message
And I logout
And I am logged in as second user
And I follow "Inbox"
And I follow "Test"
And I fill in "body" with "World"
And I press "Send Message"
And I logout
And I am logged in as first user
Then Number of unread messages of first user should be 1

Scenario: Second user can reply to first user's message, last message which was sent by second user should appear in the inbox
Given I am logged in as first user
And I am on the new message page
When I send test message
And I logout
And I am logged in as second user
And I follow "Inbox"
And I follow "Test"
And I fill in "body" with "World"
And I press "Send Message"
And I logout
And I am logged in as first user
And I follow "Inbox"
Then I should see "World"

Scenario: When a user deletes a message number of unread messages should decrease
Given I am logged in as first user
And I am on the new message page
When I send test message
And I logout
And I am logged in as second user
And I follow "Inbox"
And I follow "Delete"
Then Number of unread messages of second user should be 0

Scenario: When a user opens a message number of unread messages should decrease
Given I am logged in as first user
And I am on the new message page
When I send test message
And I logout
And I am logged in as second user
And I follow "Inbox"
And I follow "Test"
Then Number of unread messages of second user should be 0

Scenario: When a user deletes a message, message doesn't appear in inbox
Given I am logged in as first user
And I am on the new message page
When I send test message
And I logout
And I am logged in as second user
And I follow "Inbox"
And I follow "Delete"
Then I should not see "Test"

Scenario: When a user sends two messages, and you open one of them the number of unread messages should be 1
Given I am logged in as first user
And I am on the new message page
When I send test message
And I am on the new message page
And I send test2 message
And I logout 
And I am logged in as second user
And I follow "Inbox"
And I follow "Test"
Then Number of unread messages of second user should be 1

Scenario: When a user sends a message, the name of the sender should be above the subject in the receiver's inbox
Given I am logged in as first user
And I am on the new message page
When I send test message
And I logout 
And I am logged in as second user
And I follow "Inbox"
Then I should see "use
