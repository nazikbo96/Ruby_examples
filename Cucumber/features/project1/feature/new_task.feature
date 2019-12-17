Feature: New Task Feature

  Scenario: New Task Scenario
    Given I go to Manage Scheduler
    When I click on Add new task
    And I fill name field with "My test task" and choose option
    And I type into description field "Do not delete this task please!"
    And I type into start time field 2019-12-10 06:12:00.000 and type 5 into interval field
    And I choose interval type by Minutes
    Then I click save button and expect task was added
