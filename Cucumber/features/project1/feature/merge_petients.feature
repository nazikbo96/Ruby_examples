Feature: Merge patients Feature

  Scenario: Unsuccess merge Scenario
    Given I go to Merge Patient
    When I type Steven into search field
    And I choose patients by id 100GWK
    And I choose patients by id 100GWK
    Then I verify confirm button is disabled

  Scenario: Success merge Scenario
    Given I go to Merge Patient
    When I type Steven into search field
    And I choose patients by id 100GWK
    And I choose patients by id 1000KN
    Then I choose first patient records
    And I verify correct name Steven Evans after merging
