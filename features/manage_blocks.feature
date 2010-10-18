Feature: Manage my Blocks
  In order to manage all Cheatsheet-Blocks in System
  As a user
  I want to be able to CRUD all my Blocks

  Scenario: Create Block successfully (Right Columns)
    Given I am an authenticated user
    And I created a Sheet with name "Cheatsheet Sample"
    And I am on the cheatsheets page
    When I follow "Cheatsheet Sample"
    And I follow "New Block"
    And I fill in "block_name" with "Block Sample"
    And I select "Right" from "block_column"
    And I press "Create Block"
    Then I should see "Block Sample" within "div#columnRight"
    
  Scenario: Create Block successfully (Left Columns)
    Given I am an authenticated user
    And I created a Sheet with name "Cheatsheet Sample"
    And I am on the cheatsheets page
    When I follow "Cheatsheet Sample"
    And I follow "New Block"
    And I fill in "block_name" with "Block Sample"
    And I select "Left" from "block_column"
    And I press "Create Block"
    Then I should see "Block Sample" within "div#columnLeft"
    
  Scenario: Update Block successfully
    Given I am an authenticated user
    And I created a Sheet with name "Cheatsheet Sample"
    And I created a Block with name "Block Sample" in column "Left"
    And I am on the cheatsheets page
    When I follow "Cheatsheet Sample"
    And I follow "Edit" within "div#columnLeft"
    And I fill in "block_name" with "Block EditSample"
    And I select "Right" from "block_column"
    And I press "Update Block"
    Then I should see "Block EditSample" within "div#columnRight"
    
  Scenario: Destroy Sheet successfully
    Given I am an authenticated user
    And I created a Sheet with name "Cheatsheet Sample"
    And I created a Block with name "Block Sample" in column "Right"
    When I follow "Destroy" within "div#columnRight" 
    Then I should not see "Block Sample"