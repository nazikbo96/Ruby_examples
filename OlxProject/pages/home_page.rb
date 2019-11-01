require_relative '../tools/all_requires'
require_relative 'top_part'

class HomePage
  include TopPart

  protected def home_search_field
    driver.find_element(id: 'headerSearch')
  end

  protected def home_search_button
    driver.find_element(id: 'submit-searchmain')
  end

  def home_search_field_input(search_item)
    home_search_field.send_keys search_item
  end

  def home_search_button_click
    home_search_button.click
  end

  def make_success_home_search
    home_search_button_click
    SuccessfulSearchPage.new
  end

  def make_unsuccess_home_search
    home_search_button_click
    UnsuccessfulSearchPage.new
  end
end
