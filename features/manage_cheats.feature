Feature: Manage my Cheats
  In order to manage all Cheatsheet-Cheats in System
  As a user
  I want to be able to CRUD all my Cheats

  Scenario: Create Cheat successfully Left
    Given I am an authenticated user
    And I created a Sheet with name "Cheatsheet Sample"
    And I created a Category with name "Category Sample Left" in column "Left"
    And I created a Category with name "Category Sample Right" in column "Right"
    And I am on the cheatsheets page
    When I follow "Cheatsheet Sample"
    And I follow "Add Cheat"
    And I fill in "cheat_name" with "Cheat Sample"
    And I select "Category Sample Right" from "cheat_category_id"
    And I press "Create Cheat"
    Then I should see "Cheat Sample" within "div#columnRight"
    
  Scenario: Create Cheat successfully Right
    Given I am an authenticated user
    And I created a Sheet with name "Cheatsheet Sample"
    And I created a Category with name "Category Sample Left" in column "Left"
    And I created a Category with name "Category Sample Right" in column "Right"
    And I am on the cheatsheets page
    When I follow "Cheatsheet Sample"
    And I follow "Add Cheat"
    And I fill in "cheat_name" with "Cheat Sample"
    And I select "Category Sample Left" from "cheat_category_id"
    And I press "Create Cheat"
    Then I should see "Cheat Sample" within "div#columnLeft"

  Scenario: Show Cheat-Detail
    Given I am an authenticated user
    And I created a Sheet with name "Cheatsheet Sample"
    And I created a Category with name "Category Sample Left" in column "Left"
    And I created a Cheat with name "Cheat Sample" in Category "Category Sample Left"
    And I am on the cheatsheets page
    When I follow "Cheatsheet Sample"
    And I follow "Cheat Sample" within "dd"
    Then I should see "Cheat Sample" within "div#content"

  Scenario: Update Cheat successfully
    Given I am an authenticated user
    And I created a Sheet with name "Cheatsheet Sample"
    And I created a Category with name "Category Sample Left" in column "Left"
    And I created a Category with name "Category Sample Right" in column "Right"
    And I created a Cheat with name "Cheat Sample" in Category "Category Sample Left"
    And I am on the cheatsheets page
    When I follow "Cheatsheet Sample"
    And I follow "Edit" within "dd"
    And I fill in "cheat_name" with "Cheat EditSample"
    And I select "Category Sample Right" from "cheat_category_id"
    And I press "Update Cheat"
    Then I should see "Cheat EditSample" within "dd"
    
  Scenario: Destroy Sheet successfully
    Given I am an authenticated user
    And I created a Sheet with name "Cheatsheet Sample"
    And I created a Category with name "Category Sample Left" in column "Left"
    And I created a Cheat with name "Cheat Sample" in Category "Category Sample Left"
    When I should see "Cheat Sample" within "div#columnLeft"
    And I follow "Destroy" within "dd" 
    Then I should not see "Cheat Sample" within "div#columnLeft"