require_relative 'top_part.rb'
class HomePage
  attr_accessor :add_new_task_btn

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
