Given /^I created a Block with name "([^"]*)" in column "([^"]*)"$/ do |name, column|
  And %{I follow "New Block"}
  And %{I fill in "block_name" with "#{name}"}
  And %{I select "#{column}" from "block_column"}
  And %{I press "Create Block"}
end