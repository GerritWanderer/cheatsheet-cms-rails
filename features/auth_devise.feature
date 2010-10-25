Feature: Use devise functionality
  In order to use the devise auth. functionality
  As a guest
  I want to use all devise functionality for sign_in and sign_up
  
  Scenario: Sign up successfully
    Given I am on the home page
    And I follow "Join us"
    When I fill in "user_email" with "admin@wildner-designer.de"
    And I fill in "user_password" with "secretpass"
    And I fill in "user_password_confirmation" with "secretpass"
    And I press "Sign up"
    Then I should see "You have signed up successfully"
    And I am on the home page

  Scenario: Confirm successfully
    Given I am on the home page
    And I follow "Join us"
    When I fill in "user_email" with "admin@wildner-designer.de"
    And I fill in "user_password" with "secretpass"
    And I fill in "user_password_confirmation" with "secretpass"
    And I press "Sign up"
    And I should receive an email
    When I open the email
    Then I should see "Welcome admin@wildner-designer.de!" in the email body
    When they click the first link in the email
    Then I should see "Your account was successfully confirmed"
    And I should see "admin@wildner-designer.de" within "div#colRight"
  
  Scenario: Sign up unsuccessful
    Given I am on the home page
    And I follow "Join us"
    Then I fill in "user_email" with "notvalid"
    And I fill in "user_password" with "secretpass"
    And I fill in "user_password_confirmation" with "secretpass"
    And I press "Sign up"
    Then I am on the redisplayed new account page
    
  Scenario: Sign in successfully
    Given I am an authenticated user
    And I go to the logout page
    When I fill in "user_email" with "admin@wildner-designer.de"
    And I fill in "user_password" with "secretpass"
    And I press "Sign in"
    Then I should see "admin@wildner-designer.de" within "div#colRight"