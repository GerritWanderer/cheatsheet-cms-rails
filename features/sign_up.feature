Feature: Sign up
  In order to log into the system
  As a user
  I want to register a new account with the system
  
  Scenario: Sign up successfully
    Given I am on the home page
    And I follow "Join us"
    Then I fill in "user_email" with "testing@example.org"
    And I fill in "user_password" with "secretpass"
    And I fill in "user_password_confirmation" with "secretpass"
    And I press "Sign up"
    Then I should see "You have signed up successfully"
    And I am on the home page
  
  Scenario: Sign up unsuccessful
    Given I am on the home page
    And I follow "Join us"
    Then I fill in "user_email" with "notvalid"
    And I fill in "user_password" with "secretpass"
    And I fill in "user_password_confirmation" with "secretpass"
    And I press "Sign up"
    Then I am on the redisplayed new account page