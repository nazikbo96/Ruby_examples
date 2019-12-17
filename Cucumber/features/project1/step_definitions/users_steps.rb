Given(/^I search for patient record for ([A-Z]\w+)$/) do |name|
  @find_patient_page = @home_page.find_patient_btn_click
  expect(@find_patient_page).not_to be nil
  @find_patient_page.find_patient_search_field_input(name)
end

When(/^I see ([A-Z]\w+) in search results$/) do |name|
  expect(@find_patient_page.correct_search?(name)).to be true
end

Then(/^I verify table columns are not empty$/) do
  expect(@find_patient_page.correct_table?).to be true
end
#------------------------------------------------------------------------------------
Given(/^I click on register patient button$/) do
  @register_patient_page = @home_page.register_patient_btn_click
end

When(/^I type into given name field ([A-Z]\w+) and into family name ([A-Z]\w+)$/) do |name,f_name|
  @register_patient_page.given_name_field_input(name)
  @register_patient_page.family_name_field_input(f_name)
end

And(/^I click on gender menu tab and choose male$/) do
  @register_patient_page.gender_menu_click
  @register_patient_page.male_choose_click
end

And(/^I go to birthdate menu tab and type into estimated years field ([0-9]+) and into month ([0-9]+)$/) do |years,month|
  @register_patient_page.birthdate_menu_click
  @register_patient_page.estimated_years_field_input(years)
  @register_patient_page.estimated_mounth_field_input(month)
end

And(/^I click on Address menu tab and fill address field with ([A-Z]\w+)$/) do |address|
  @register_patient_page.address_menu_click
  @register_patient_page.address_field_input(address)
end

And(/^I click on Phone number menu tab and type (\+[0-9]+)$/) do |number|
  @register_patient_page.phone_number_menu_click
  @register_patient_page.phone_field_input(number)
end

Then(/^I confirm patient registration$/) do
  @register_patient_page.confirm_menu_click
  @patient_page = @register_patient_page.confirm_btn_click
end

Then(/^I verify warning message on page$/) do
  @register_patient_page.confirm_menu_click
  expect(@register_patient_page.similar_message_onpage?).to be false
end
#------------------------------------------------------------------------------------
When(/^I choose ([A-Z]\w+) patient$/) do |name|
  @patien_page = @find_patient_page.choose_patient(name)
end

And(/^I delete ([A-Z]\w+) patient for the reason ([A-Z]\w+)$/) do |name, reason|
  @patien_page.delete_patient_btn_click
  @patien_page.delete_reason_field_input(reason)
  @find_patient_page = @patien_page.confirm_delete_btn_click
end

Then(/^I verify deleting by searching ([A-Z]\w+) patient$/) do |name|
  @find_patient_page.find_patient_search_field_input(name)
  expect(@find_patient_page.unsuccess_search_message_onpage?).to be false
end
#------------------------------------------------------------------------------------
Given(/^I go to Manage Scheduler$/) do
  @system_administration_page = @home_page.system_administration_btn_click
  expect(@system_administration_page).not_to be nil
  @manage_scheduler_page = @system_administration_page.manage_scheduler_btn_click
  expect(@manage_scheduler_page).not_to be nil
end

When(/^I click on Add new task$/) do
  @new_task_page = @manage_scheduler_page.add_new_task_btn_click
  expect(@new_task_page).not_to be nil
end

And(/^I fill name field with ("(\D+\s)+\D+") and choose option$/) do |name|
  @new_task_page.name_field_input(name)
  @new_task_page.schedulable_class_dropdown_choose('org.openmrs.scheduler.tasks.AutoCloseVisitsTask')
end

And(/^I type into description field ("(\D+\s)+\D+")$/) do |describtion|
  @new_task_page.describtion_field_input(describtion)
end

And(/^I type into start time field (\d+-\d+-\d+\s\d+:\d+:\d+.\d+) and type (\d+) into interval field$/) do |time, interval|
  @new_task_page.start_time_field_input(time)
  @new_task_page.repeat_interval_field_input(interval)
end

And(/^I choose interval type by ([A-Z]\w+)$/) do |type|
  @new_task_page.repeat_interval_type_dropdown_choose(type)
end

Then(/^I click save button and expect task was added$/) do
  @new_task_page.save_btn_click
  expect(@new_task_page.task_was_added?).to be false
end
#------------------------------------------------------------------------------------
Given(/^I go to Merge Patient$/) do
  @data_management_page = @home_page.data_management_btn_click
  @merge_patient_page = @data_management_page.merge_patient_btn_click
end

When(/^I type ([A-Z]\w+) into search field$/) do |name|
  @merge_patient_page.patient_search_field_input(name)
end

And(/^I choose patients by id ([0-9]+[A-Z]+[0-9]*)$/) do |id|
  @merge_patient_page.choose_patient(id)
end

Then(/^I choose first patient records$/) do
  @prefered_record_page = @merge_patient_page.confirm_btn_click
  @prefered_record_page.first_patient_records_choose
  @patient_after_merging_page = @prefered_record_page.confirm_btn_click
end

And(/^I verify correct name ([A-Z]\w+) ([A-Z]\w+) after merging$/) do |first_name, last_name|
  expect(@patient_after_merging_page.correct_merge?(first_name,last_name)).to be true
end

Then(/^I verify confirm button is disabled$/) do
  expect(@merge_patient_page.confirm_btn_available?).to be false
end
