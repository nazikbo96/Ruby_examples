require_relative 'top_part.rb'
class DataManagementPage

  include TopPart

  def merge_patient_btn
    driver.find_element(id: 'coreapps-mergePatientsHomepageLink-app')
  end

  def merge_patient_btn_click
    merge_patient_btn.click
    MergePatientsPage.new
  end

end
