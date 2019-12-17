require_relative 'top_part.rb'
class HomePage
  include TopPart

  def find_patient_btn
    driver.find_element(id: 'coreapps-activeVisitsHomepageLink-coreapps-activeVisitsHomepageLink-extension')
  end

  def register_patient_btn
    driver.find_element(id: 'referenceapplication-registrationapp-registerPatient-homepageLink-referenceapplication-registrationapp-registerPatient-homepageLink-extension')
  end

  def system_administration_btn
    driver.find_element(id: 'coreapps-systemadministration-homepageLink-coreapps-systemadministration-homepageLink-extension')
  end

  def data_management_btn
    driver.find_element(id: 'coreapps-datamanagement-homepageLink-coreapps-datamanagement-homepageLink-extension')
  end
  def find_patient_btn_click
    find_patient_btn.click
    FindPatientPage.new
  end

  def register_patient_btn_click
    register_patient_btn.click
    RegisterPatient.new
  end

  def system_administration_btn_click
    system_administration_btn.click
    SystemAdministrationPage.new
  end

  def data_management_btn_click
    data_management_btn.click
    DataManagementPage.new
  end

end
