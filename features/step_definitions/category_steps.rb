Given /^I created a Category with name "([^"]*)" in column "([^"]*)"$/ do |name, column|
  And %{I follow "Add Category"}
  And %{I fill in "category_name" with "#{name}"}
  And %{I select "#{column}" from "category_column"}
  And %{I press "Create Category"}
end