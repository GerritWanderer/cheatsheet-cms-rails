Feature: Sign in
In order to use the system's functionality
As a user
I want to be able to log into the system

  Scenario: Sign in successfully
    Given I am an authenticated user
    Then I am on the home page
    And I should see "testing@example.com" within "div#colRight"