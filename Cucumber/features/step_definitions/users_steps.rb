Given("I launch login page") do
  @login_page = start_test("https://demo.openmrs.org/openmrs/login.htm")
end

And(/^I enter username$/) do
  @login_page.enter_username("admin")
end

And(/^I enter password$/) do
  @login_page.enter_password("Admin123")
end

And(/^I click location$/) do
  @login_page.click_location
end

When(/^I click Login button$/) do
  @login_page.click_login_button
end

Then(/^I see Home page$/) do
  @home_page = @login_page.verify_home_page
  expect(@home_page).not_to be nil
end

Then(/^I click find patient record$/) do
  @find_patient_page = @home_page.find_patient_btn_click
  expect(@find_patient_page).not_to be nil
end

And(/^I fill search field with Mary name$/) do
  @find_patient_page.find_patient_search_field_input('Mary')
end

Then(/^I verify search correct$/) do
  expect(@find_patient_page.correct_search?('Mary')).to be true
end

And(/^I verify table columns$/) do
  #expect(@find_patient_page.correct_table?).to be true
end
#------------------------------------------------------------------------------------
Then(/^I click on register patient button$/) do
  @register_patient_page = @home_page.register_patient_btn_click
end

And(/^I fill given name field$/) do
  @register_patient_page.given_name_field_input('Vova')
end

And(/^I fill family name field$/) do
  @register_patient_page.family_name_field('Superman')
end

Then(/^I click on gender menu tab$/) do
  @register_patient_page.gender_menu_click
end

And(/^I choose male$/) do
  @register_patient_page.male_choose_click
end

Then(/^I click on birthdate menu tab$/) do
  @register_patient_page.birthdate_menu_click
end

And(/^I fill estimated years field$/) do
  @register_patient_page.estimated_years_field_input('34')
end

And(/^I fill estimated month field$/) do
  @register_patient_page.estimated_mounth_field('4')
end

Then(/^I click on Address menu tab$/) do
  @register_patient_page.address_menu_click
end

And(/^I fill address field$/) do
  @register_patient_page.address_field_input('Lviv')
end

Then(/^I click on Phone number menu tab$/) do
  @register_patient_page.phone_number_menu_click
end

And(/^I fill phone field$/) do
  @register_patient_page.phone_field_input('+380777555666')
end

Then(/^I click on confirm menu tab$/) do
  @register_patient_page.confirm_menu_click
end

And(/^I click on confirm button$/) do
  @register_patient_page.confirm_btn_click
end

Then(/^I verify similar message on page$/) do
  expect(@register_patient_page.similar_message_onpage?).to be false
end
#------------------------------------------------------------------------------------
Then(/^I goto home page$/) do
  driver.navigate.to 'https://demo.openmrs.org/openmrs/referenceapplication/home.page'
end

And(/^I fill search field with name which I add$/) do
  @find_patient_page.find_patient_search_field_input('Vova')
end

Then (/^I choose Vova patient$/) do
  @patien_page = @find_patient_page.choose_patient('Vova')
end

Then (/^I click on delete patient$/) do
  @patien_page = @find_patient_page.choose_patient('Vova')
end

And (/^I fill reason field$/) do
  @patien_page.delete_reason_field_input('It was test patient.')
end

And (/^I click on confirm button$/) do
  @find_patient_page = @patien_page.confirm_delete_btn_click
end

Then(/^I fill search field with name Vova to verify deleting patient$/) do
  @find_patient_page.find_patient_search_field_input('Vova')
  expect(@find_patient_page.unsuccess_search_message_onpage?).to be false
end
#------------------------------------------------------------------------------------
Then(/^I go to manage scheduler$/) do
  @manage_scheduler_page = @home_page.goto_manage_scheduler
end

And(/^I click on Add new task$/) do
  @new_task_page = @manage_scheduler_page.add_new_task_btn_click
end
