Given /^I am not authenticated$/ do
  visit('/account/logout')
end

Given /^I signed up as "([^\"]*)" with password "([^\"]*)"$/ do |email, password|
  @user = User.create!(:email => email,
           :password => password,
           :password_confirmation => password)
end

Given /^I am an authenticated user$/ do
  email = 'testing@example.com'
  password = 'secretpass'

  Given %{I signed up as "#{email}" with password "#{password}"}
  And %{I go to the the home page}
  And %{I fill in "user_email" with "#{email}"}
  And %{I fill in "user_password" with "#{password}"}
  And %{I press "Sign in"}
end