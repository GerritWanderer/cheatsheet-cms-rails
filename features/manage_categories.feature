Feature: Manage my Categories
  In order to manage all Cheatsheet-Categories in System
  As a user
  I want to be able to CRUD all my Categories

  Scenario: Create Category successfully (Right Columns)
    Given I am an authenticated user
    And I created a Sheet with name "Cheatsheet Sample"
    And I am on the cheatsheets page
    When I follow "Cheatsheet Sample"
    And I follow "Add Category"
    And I fill in "category_name" with "Category Sample"
    And I select "Right" from "category_column"
    And I press "Create Category"
    Then I should see "Category Sample" within "div#columnRight"
    
  Scenario: Create Category successfully (Left Columns)
    Given I am an authenticated user
    And I created a Sheet with name "Cheatsheet Sample"
    And I am on the cheatsheets page
    When I follow "Cheatsheet Sample"
    And I follow "Add Category"
    And I fill in "category_name" with "Category Sample"
    And I select "Left" from "category_column"
    And I press "Create Category"
    Then I should see "Category Sample" within "div#columnLeft"
    
  Scenario: Update Category successfully
    Given I am an authenticated user
    And I created a Sheet with name "Cheatsheet Sample"
    And I created a Category with name "Category Sample" in column "Left"
    And I am on the cheatsheets page
    When I follow "Cheatsheet Sample"
    And I follow "Edit" within "div#columnLeft"
    And I fill in "category_name" with "Category EditSample"
    And I select "Right" from "category_column"
    And I press "Update Category"
    Then I should see "Category EditSample" within "div#columnRight"
    
  Scenario: Destroy Category successfully
    Given I am an authenticated user
    And I created a Sheet with name "Cheatsheet Sample"
    And I created a Category with name "Category Sample" in column "Right"
    When I follow "Destroy" within "div#columnRight" 
    Then I should not see "Category Sample"