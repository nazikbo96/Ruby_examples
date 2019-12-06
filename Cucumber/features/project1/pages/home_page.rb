require_relative 'top_part.rb'
class HomePage
  attr_accessor :driver

  include TopPart

  def initialize(driver)
    @driver = driver
    @find_patient_btn = @driver.find_element(id: 'coreapps-activeVisitsHomepageLink-coreapps-activeVisitsHomepageLink-extension')
    @register_patient_btn = @driver.find_element(id: 'referenceapplication-registrationapp-registerPatient-homepageLink-referenceapplication-registrationapp-registerPatient-homepageLink-extension')
    @system_administration_btn = @driver.find_element(id: 'coreapps-systemadministration-homepageLink-coreapps-systemadministration-homepageLink-extension')
    @data_management_btn = @driver.find_element(id: 'coreapps-datamanagement-homepageLink-coreapps-datamanagement-homepageLink-extension')
  end

  def find_patient_btn_click
    @find_patient_btn.click
    FindPatientPage.new(@driver)
  end

  def register_patient_btn_click
    @register_patient_btn.click
    RegisterPatient.new(@driver)
  end

  def system_administration_btn_click
    @system_administration_btn.click
    SystemAdministrationPage.new(@driver)
  end

  def data_management_btn_click
    @data_management_btn.click
    DataManagementPage.new(@driver)
  end

end
