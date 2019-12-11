require_relative 'top_part.rb'

class ManageSchedulerPage

  include TopPart

  def add_new_task_btn
    driver.find_element(xpath: "//a[contains(@href,'#/add')]")
  end

  def add_new_task_btn_click
    add_new_task_btn.click
    NewTaskPage.new
  end

end
