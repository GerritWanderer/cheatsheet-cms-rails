Given /^I created a Cheat with name "([^"]*)" in block "([^"]*)"$/ do |name, block|
  And %{I follow "New Cheat"}
  And %{I fill in "cheat_name" with "#{name}"}
  And %{I select "#{block}" from "cheat_block_id"}
  And %{I press "Create Cheat"}
end