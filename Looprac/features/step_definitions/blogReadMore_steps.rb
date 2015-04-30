Given /^I am logged in as first user$/ do
   @current_user = User.find_by(:username => 'user')
	login_as(@current_user, :scope => :user)
end

When(/^I logout$/) do
  logout
end

