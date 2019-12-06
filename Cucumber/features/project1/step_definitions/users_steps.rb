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

When(/^I fill search field with Mary name$/) do
  @find_patient_page.find_patient_search_field_input('Mary')
end

Then(/^I verify search correct$/) do
  expect(@find_patient_page.correct_search?('Mary')).to be true
end

Then(/^I verify table columns$/) do
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
  @register_patient_page.family_name_field_input('Superman')
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
  @register_patient_page.estimated_mounth_field_input('4')
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
  @patient_page = @register_patient_page.confirm_btn_click
end

Then(/^I verify similar message on page$/) do
  expect(@register_patient_page.similar_message_onpage?).to be false
end
#------------------------------------------------------------------------------------
Then(/^I goto home page$/) do
  @basic_page = BasicPage.new(@home_page.driver)
  @home_page = @basic_page.home_btn_click
end

And(/^I fill search field with name which I add$/) do
  @find_patient_page.find_patient_search_field_input('Vova')
end

Then(/^I choose Vova patient$/) do
  @patien_page = @find_patient_page.choose_patient('Vova')
end

Then(/^I click on delete patient$/) do
  @patien_page.delete_patient_btn_click
end

And(/^I fill reason field$/) do
  @patien_page.delete_reason_field_input('It was test patient.')
end

And(/^I click on confirm delete button$/) do
  @find_patient_page = @patien_page.confirm_delete_btn_click
end

Then(/^I fill search field with name Vova to verify deleting patient$/) do
  @find_patient_page.find_patient_search_field_input('Vova')
  expect(@find_patient_page.unsuccess_search_message_onpage?).to be false
end
#------------------------------------------------------------------------------------
Then(/^I click on System Administration button$/) do
  @system_administration_page = @home_page.system_administration_btn_click
  expect(@system_administration_page).not_to be nil
end

And(/^I click on manage scheduler button$/) do
  @manage_scheduler_page = @system_administration_page.manage_scheduler_btn_click
  expect(@manage_scheduler_page).not_to be nil
end

And(/^I click on Add new task$/) do
  @new_task_page = @manage_scheduler_page.add_new_task_btn_click
  expect(@new_task_page).not_to be nil
end

Then(/^I fill name field$/) do
  @new_task_page.name_field_input('My test task.')
end

Then(/^I choose option from schedulable class dropdown$/) do
  @new_task_page.schedulable_class_dropdown_choose('org.openmrs.scheduler.tasks.AutoCloseVisitsTask')
end

Then(/^I fill describtion field$/) do
  @new_task_page.describtion_field_input("Do not delete this task please!")
end

Then(/^I fill start time field$/) do
  @new_task_page.start_time_field_input('2019-12-10 06:12:00.000')
end

Then(/^I fill interval field$/) do
  @new_task_page.repeat_interval_field_input('5')
end

Then(/^I choose interval type by minutes$/) do
  @new_task_page.repeat_interval_type_dropdown_choose('Minutes')
end

Then(/^I click save button$/) do
  @new_task_page.save_btn_click
  expect(@new_task_page.task_was_added?).to be false
end
#------------------------------------------------------------------------------------
Then(/^I click data management button$/) do
  @data_management_page = @home_page.data_management_btn_click
end

Then(/^I click merge patient button$/) do
  @merge_patient_page = @data_management_page.merge_patient_btn_click
end

And(/^I find patients$/) do
  @merge_patient_page.patient_search_field_input('Mary')
end

And(/^I choose first patients for merging$/) do
  @merge_patient_page.second_patient_click('10081K')
end

And(/^I choose second patients for merging$/) do
  @merge_patient_page.second_patient_click('1001PD')
end

And(/^I Click on confirm button$/) do
  @prefered_record_page = @merge_patient_page.confirm_btn_click
end

Then(/^I choose first patient records$/) do
  @prefered_record_page.first_patient_records_choose
end

And(/^I click confirm button$/) do
  @patient_after_merging_page = @prefered_record_page.confirm_button_click
end

And(/^I verify patients merging$/) do
  expect(@patient_after_merging_page.correct_merge?('Mary','Martin')).to be true
end

Then(/^I verify confirm button is disabled$/) do
  expect(@merge_patient_page.confirm_btn_available?).to be false
end
