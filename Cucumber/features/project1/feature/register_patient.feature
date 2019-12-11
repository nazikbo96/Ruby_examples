Feature: Register Patient Feature

  Scenario: Register patient Scenario
    Given I click on register patient button
    When I type into given name field Vova and into family name Superman
    And I click on gender menu tab and choose male
    And I go to birthdate menu tab and type into estimated years field 25 and into month 3
    And I click on Address menu tab and fill address field with Lviv
    And I click on Phone number menu tab and type +3801231232
    Then I confirm patient registration

  Scenario: Register same patient Scenario
    Given I click on register patient button
    When I type into given name field Vova and into family name Superman
    And I click on gender menu tab and choose male
    And I go to birthdate menu tab and type into estimated years field 25 and into month 3
    And I click on Address menu tab and fill address field with Lviv
    And I click on Phone number menu tab and type +3801231232
    Then I verify warning message on page

  Scenario: Delete patient Scenario
    Given I search for patient record for Vova
    When I choose Vova patient
    And I delete Vova patient for the reason Test
    Then I verify deleting by searching Vova patient
