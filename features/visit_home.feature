Feature: access welcome message at home page
  In order to see the welcome message
  As a guest
  I want to see the welcome message
  
  Scenario: open home page as a guest
    Given I am on the home page
    Then I should see "Hello World" within "div#colLeft"