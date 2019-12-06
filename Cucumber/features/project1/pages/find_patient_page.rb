require_relative 'top_part.rb'
class FindPatientPage
  attr_accessor :find_patient_btn,:table_column_content

  include TopPart

  def initialize(browser)
    @driver = browser
    @find_patient_search_field = @driver.find_element(id: 'patient-search')
    @table_column_content = @driver.find_elements(css: "td")
  end

  def find_patient_search_field_input(person)
    @find_patient_search_field.send_keys person
    sleep(3)
  end

  def correct_search?(name)
    @driver.find_elements(xpath: "//td[contains(text(),'#{name}')]").length == (@driver.find_elements(css: 'tr').length - 1)
  end

  def correct_table?
    result = true
    @table_column_content.each { |element| result = false if element.text.nil? }
    result
  end

  def choose_patient(patient)
    @driver.find_element(xpath: "//td[contains(text(),'#{patient}')]").click
  end

  def unsuccess_search_message_onpage?
    @driver.find_element(css: ".dataTables_empty").nil?
  end

end
