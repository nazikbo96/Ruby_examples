
class DataManagementPage

  include TopPart

  def initialize(driver)
    @driver = driver
    @merge_patient_btn = @driver.find_element(id: 'coreapps-mergePatientsHomepageLink-app')
  end

  def merge_patient_btn_click
    @merge_patient_btn.click
    MergePatientsPage.new(@driver)
  end

end

class PreferedRecordPage
  include TopPart

  def initialize(driver)
    @driver = driver
    @first_patient = @driver.find_element(id: 'first-patient')
  end

  def first_patient_records_choose
    @first_patient.click
  end

  def confirm_button
    @driver.find_element(id: 'confirm-button')
  end

  def confirm_button_click
    sleep(2)
    confirm_button.click
    PatientAfterMergingPage.new(@driver)
  end

end

class PatientAfterMergingPage
  include TopPart

  def initialize(driver)
    @driver = driver
    @given_name = @driver.find_element(css: '.PersonName-givenName')
    @family_name = @driver.find_element(css: '.PersonName-familyName')
  end

  def correct_merge?(name, last_name)
    @given_name.text == name && @family_name.text == last_name
  end

end

class MergePatientsPage
  include TopPart

  def initialize(driver)
    @driver = driver
    @patient_search_field = @driver.find_element(id: 'patient-search')
  end

  def patient_search_field_input(name)
    @patient_search_field.send_keys name
  end

  def get_first_patient(id)
    @driver.find_element(xpath: "//td[contains(text(),'#{id}')]")
  end

  def get_second_patient(id)
    @driver.find_element(xpath: "//td[contains(text(),'#{id}')]")
  end

  def first_patient_click(id)
    get_second_patient(id).click
  end

  def second_patient_click(id)
    get_second_patient(id).click
  end

  def confirm_button
    @driver.find_element(css: '.confirm')
  end

  def confirm_btn_click
    sleep(2)
    confirm_button.click
    PreferedRecordPage.new(@driver)
  end

  def confirm_btn_available?
    @driver.find_element(css: '.confirm.disabled').nil?
  end

end
