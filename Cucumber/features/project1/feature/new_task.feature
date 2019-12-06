Feature: New Task Feature

  Scenario: Sample Scenario
    Then I click on System Administration button
    And I click on manage scheduler button
    Then I click on Add new task
    Then I fill name field
    Then I choose option from schedulable class dropdown
    Then I fill describtion field
    Then I fill start time field
    Then I fill interval field
    Then I choose interval type by minutes
    Then I click save button
