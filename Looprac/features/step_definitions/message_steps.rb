

Given /^I am logged in as first user$/ do
	@current_user = User.find_by(:username => 'user')
	login_as(@current_user, :scope => :user)
end
When(/^I logout$/) do
  logout
end

When(/^I am logged in as second user$/) do
  @current_user = User.find_by(:username => 'user2')
	login_as(@current_user, :scope => :user)
end

When(/^I send test message$/) do
	steps %{
	When I fill in "recipients" with "user2"
   And  I fill in "message[subject]" with "Test"
   And  I fill in "message[body]" with "Hello"
    And I press "Send"
}
end
When(/^I send test2 message$/) do
  steps %{
  When I fill in "recipients" with "user2"
   And  I fill in "message[subject]" with "Test2"
   And  I fill in "message[body]" with "Hello"
    And I press "Send"
}
end
When /^"([^"]*)" should be selected for "([^"]*)"$/ do |value, field|
  field_labeled(field).element.search(".//option[@selected = 'selected']").inner_html.should =~ /#{value}/
end

Then(/^Number of unread messages of second user should be (\d+)$/) do |arg1|
  User.find_by(:username => 'user2').mailbox.inbox({:read => false}).count.should == arg1.to_i
end

Then(/^Number of unread messages of first user should be (\d+)$/) do |arg1|
 User.find_by(:username => 'user').mailbox.inbox({:read => false}).count.should == arg1.to_i
end