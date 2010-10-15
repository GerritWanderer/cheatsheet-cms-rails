Feature: Manage my Cheatsheets
  In order to manage all Cheatsheets in System
  As a user
  I want to be able to CRUD all my Cheatsheets
  

  Scenario: Create Sheet successfully
    Given I am an authenticated user
    And I am on the home page
    When I follow "Manage Cheatsheets"
    And I follow "New Sheet"
    And I fill in "sheet_name" with "Cheatsheet Sample"
    And I press "Create Sheet"
    Then I am on the cheatsheets page
    And I should see "Cheatsheet Sample"

  Scenario: list all Cheatsheets
    Given I am an authenticated user
    And I created a Sheet with name "Cheatsheet Sample"
    And I created a Sheet with name "Cheatsheet Sample2"
    When I am on the cheatsheets page
    Then I should see "Cheatsheet Sample"
    And I should see "Cheatsheet Sample2"
  
  Scenario: Update Sheet successfully
    Given I am an authenticated user
    And I created a Sheet with name "Cheatsheet Sample"
    And I am on the cheatsheets page
    When I follow "Edit"
    And I fill in "sheet_name" with "Cheatsheet Edit-Sample"
    And I press "Update Sheet"
    Then I should see "Cheatsheet Edit-Sample"
    And I am on the cheatsheets page
  
  Scenario: Destroy Sheet successfully
    Given I am an authenticated user
    And I created a Sheet with name "Cheatsheet Sample"
    And I am on the cheatsheets page
    When I follow "Destroy"
    Then I am on the cheatsheets page
    And I should not see "Cheatsheet Sample"