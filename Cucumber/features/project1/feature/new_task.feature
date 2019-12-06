Feature: New Task Feature

  Scenario: Sample Scenario
    Given I launch login page
    And I enter username
    And I enter password
    And I click location
    When I click Login button
    Then I see Home page
    Then I go to manage scheduler
    And I click on Add new task
