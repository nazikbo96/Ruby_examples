require_relative 'top_part.rb'
class PatientPage
  attr_accessor :delete_patient_btn,:delete_reason_field

  include TopPart

  def initialize(browser)
    @driver = browser
    @delete_patient_btn = @driver.find_element(id: 'org.openmrs.module.coreapps.deletePatient')
    @delete_reason_field = @driver.find_element(id: 'delete-reason')
    @confirm_delete_btn = @driver.find_element(xpath: "//div[contains(@id,'delete-patient-creation-dialog')]//button[contains(@class,'confirm right')]")
  end

  def delete_patient_btn_click
    @delete_patient_btn.click
  end

  def delete_reason_field_input(reason)
    @delete_reason_field.send_keys reason
  end

  def confirm_delete_btn_click
    @confirm_delete_btn.click
    FindPatientPage.new(@driver)
  end

end
