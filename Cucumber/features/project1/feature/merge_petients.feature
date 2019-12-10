Feature: Merge patients Feature

  Scenario: Unsuccess merge Scenario
    Given I go to Merge Patient
    And I type Steven into search field
    And I choose patients by id 1006JJ
    And I choose patients by id 1006JJ
    Then I verify confirm button is disabled

  Scenario: Success merge Scenario
    Given I go to Merge Patient
    And I type Steven into search field
    And I choose patients by id 1006JJ
    And I choose patients by id 1002A6
    Then I choose first patient records
    And I verify correct name Steven Young after merging
