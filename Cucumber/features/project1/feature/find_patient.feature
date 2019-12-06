Feature: Find Patient Feature

  Scenario: Sample Scenario
    Then I click find patient record
    When I fill search field with Mary name
    Then I verify search correct
    Then I verify table columns
