require_relative 'top_part.rb'
class NewTaskPage

  include TopPart

  def add_new_task_btn
    driver.find_element(xpath: "//a[contains(@href,'#/add')]")
  end

  def name_field
    driver.find_element(xpath: "//input[contains(@ng-model,'taskName')]")
  end

  def schedulable_class_dropdown
    driver.find_element(xpath: "//select//option[contains(text(),'org')]/..")
  end

  def describtion_field
    driver.find_element(xpath: "//textarea[contains(@ng-model,'description')]")
  end

  def start_time_field
    driver.find_element(xpath: "//input[contains(@ng-model,'startTimeVal')]")
  end

  def repeat_interval_field
    driver.find_element(xpath: "//input[contains(@ng-model,'repeatInterval')]")
  end

  def repeat_interval_type_dropdown
    driver.find_element(xpath: "//select//option[contains(text(),'Minutes')]/..")
  end

  def save_btn
    driver.find_element(xpath: "//button[contains(@ng-click,'saveTaskDefinitions()')]")
  end

  def name_field_input(name)
    name_field.send_keys name
  end

  def schedulable_class_dropdown_choose(schedulable)
    option = Selenium::WebDriver::Support::Select.new(schedulable_class_dropdown)
    option.select_by(:text, schedulable)
  end

  def describtion_field_input(description)
    describtion_field.send_keys description
  end

  def start_time_field_input(time)
    start_time_field.send_keys time
  end

  def repeat_interval_field_input(mins)
    repeat_interval_field.send_keys mins
  end

  def repeat_interval_type_dropdown_choose(type)
    option = Selenium::WebDriver::Support::Select.new(repeat_interval_type_dropdown)
    option.select_by(:text, type)
  end

  def save_btn_click
    save_btn.click
  end

  def get_successfully_saved_message
    driver.find_element(css: '.alert.alert-success.alert-dismissable.ng-scope')
  end

  def task_was_added?
    get_successfully_saved_message.nil?
  end

end
