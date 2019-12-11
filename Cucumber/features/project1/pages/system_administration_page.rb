require_relative 'top_part.rb'

class SystemAdministrationPage

  include TopPart

  def manage_scheduler_btn
    driver.find_element(id: 'referenceapplication-manageScheduler-app')
  end

  def manage_scheduler_btn_click
    manage_scheduler_btn.click
    ManageSchedulerPage.new
  end

end
