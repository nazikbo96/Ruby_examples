Feature: Find Patient Feature

  Scenario: Sample Scenario
    Given I launch login page
    And I enter username
    And I enter password
    And I click location
    When I click Login button
    Then I see Home page
    Then I click find patient record
    And I fill search field with Mary name
    Then I verify search correct
    And I verify table columns
