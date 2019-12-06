Feature: Register Patient Feature

  Scenario: Sample Scenario
    Given I launch login page
    And I enter username
    And I enter password
    And I click location
    When I click Login button
    Then I see Home page
    Then I click on register patient button
    And I fill given name field
    And I fill family name field
    Then I click on gender menu tab
    And I choose male
    Then I click on birthdate menu tab
    And I fill estimated years field
    And I fill estimated month field
    Then I click on Address menu tab
    And I fill address field
    Then I click on Phone number menu tab
    And I fill phone field
    Then I click on confirm menu tab
    And I click on confirm button
    Then I goto home page
    Then I see Home page
    Then I click on register patient button
    And I fill given name field
    And I fill family name field
    Then I click on gender menu tab
    And I choose male
    Then I click on birthdate menu tab
    And I fill estimated years field
    And I fill estimated month field
    Then I click on Address menu tab
    And I fill address field
    Then I click on Phone number menu tab
    And I fill phone field
    Then I click on confirm menu tab
    Then I verify similar message on page
    Then I goto home page
    Then I click find patient record
    And I fill search field with name which I add
    Then I choose Vova patient
    Then I click on delete patient
    And I fill reason field
    And I click on confirm button
    Then I fill search field with name Vova to verify deleting patient
