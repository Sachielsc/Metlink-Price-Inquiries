Feature: Log in process
  Every user needs to log in

  Scenario: Log in is successful
    Given I navigate to Demo Work Shop homepage
    When I click the login button on the home page
    And I type in "sachielsc@gmail.com" as my Email
    And I type in "scsgdtcy3" as my Password
    And I click the login button on the login page
    Then I should be able to see my email "sachielsc@gmail.com" on the home page