Feature: Find Patient Feature

  Scenario: Search Scenario
    Given I search for patient record for Mary
    When I see Mary in search results
    Then I verify table columns are not empty
