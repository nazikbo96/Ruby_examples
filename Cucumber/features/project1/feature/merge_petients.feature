Feature: Merge patients
  Scenario: Unsuccess merge
    Then I click data management button
    Then I click merge patient button
    And I find patients
    And I choose first patients for merging
    And I choose first patients for merging
    Then I verify confirm button is disabled
  Scenario: Success merge
    Then I click data management button
    Then I click merge patient button
    And I find patients
    And I choose first patients for merging
    And I choose second patients for merging
    And I Click on confirm button
    Then I choose first patient records
    And I click confirm button
    And I verify patients merging
