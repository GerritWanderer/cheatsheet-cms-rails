Given /^I created a Sheet with name "([^"]*)"$/ do |name|
  And %{I go to the the create cheatsheet page}
  And %{I fill in "sheet_name" with "#{name}"}
  And %{I press "Create Sheet"}
end