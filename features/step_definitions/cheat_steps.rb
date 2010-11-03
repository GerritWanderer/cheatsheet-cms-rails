Given /^I created a Cheat with name "([^"]*)" in Category "([^"]*)"$/ do |name, category|
  And %{I follow "Add Cheat"}
  And %{I fill in "cheat_name" with "#{name}"}
  And %{I select "#{category}" from "cheat_category_id"}
  And %{I press "Create Cheat"}
end