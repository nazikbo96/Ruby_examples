Feature: New Task Feature

  Scenario: New Task Scenario
    Given I go to Manage Scheduler
    Then I click on Add new task
    Then I fill name field with "My test task" and choose option
    Then I type into description field "Do not delete this task please!"
    Then I type into start time field 2019-12-10 06:12:00.000 and type 5 into interval field
    Then I choose interval type by Minutes
    Then I click save button
