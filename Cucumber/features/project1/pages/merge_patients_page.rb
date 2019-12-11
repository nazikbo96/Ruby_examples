class MergePatientsPage
  include TopPart

  def patient_search_field
    driver.find_element(id: 'patient-search')
  end

  def patient_search_field_input(name)
    patient_search_field.send_keys name
  end

  def get_patient(id)
    driver.find_element(xpath: "//td[contains(text(),'#{id}')]")
  end

  def choose_patient(id)
    get_patient(id).click
  end


  def confirm_button
    driver.find_element(css: '.confirm')
  end

  def confirm_btn_click
    sleep(2)
    confirm_button.click
    PreferedRecordPage.new
  end

  def confirm_btn_available?
    driver.find_element(css: '.confirm.disabled').nil?
  end

end
