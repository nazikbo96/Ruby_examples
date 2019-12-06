require_relative 'top_part.rb'
class HomePage
  attr_accessor :find_patient_btn,:register_patient_btn

  include TopPart

  def initialize(driver)
    @driver = driver
    @find_patient_btn = @driver.find_element(id: 'coreapps-activeVisitsHomepageLink-coreapps-activeVisitsHomepageLink-extension')
    @register_patient_btn = @driver.find_element(id: 'referenceapplication-registrationapp-registerPatient-homepageLink-referenceapplication-registrationapp-registerPatient-homepageLink-extension')
    @system_administration_btn = @driver.find_element(id: 'coreapps-systemadministration-homepageLink-coreapps-systemadministration-homepageLink-extension')
    @manage_scheduler_btn = @driver.find_element(id: 'referenceapplication-manageScheduler-app')
  end

  def find_patient_btn_click
    @find_patient_btn.click
    FindPatientPage.new(@driver)
  end

  def register_patient_btn_click
    @register_patient_btn.click
    RegisterPatient.new(@driver)
  end

  def goto_manage_scheduler
    @system_administration_btn.click
    @manage_scheduler_btn.click
    ManageSchedulerPage.new(@driver)
  end

end
