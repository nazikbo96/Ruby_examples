require_relative 'top_part.rb'

class SystemAdministrationPage

  include TopPart

  def initialize(driver)
    @driver = driver
    @manage_scheduler_btn = @driver.find_element(id: 'referenceapplication-manageScheduler-app')
  end
  def manage_scheduler_btn_click
    @manage_scheduler_btn.click
    ManageSchedulerPage.new(@driver)
  end
end

class ManageSchedulerPage

  include TopPart

  def initialize(driver)
    @driver = driver
    @add_new_task_btn = @driver.find_element(xpath: "//a[contains(@href,'#/add')]")
  end

  def add_new_task_btn_click
    @add_new_task_btn.click
    NewTaskPage.new(@driver)
  end

end
