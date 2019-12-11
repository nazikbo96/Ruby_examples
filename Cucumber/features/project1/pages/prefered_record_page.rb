require_relative 'top_part.rb'
class PreferedRecordPage

  include TopPart

  def first_patient
    driver.find_element(id: 'first-patient')
  end

  def first_patient_records_choose
    first_patient.click
  end

  def confirm_button
    driver.find_element(id: 'confirm-button')
  end

  def confirm_btn_click
    sleep(2)
    confirm_button.click
    PatientAfterMergingPage.new
  end

end
