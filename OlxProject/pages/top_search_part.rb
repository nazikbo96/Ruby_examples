require_relative '../tools/all_requires'

module TopSearchPart

  protected

  def top_search_field
    driver.find_element(id: 'search-text')
  end

  def top_search_button
    driver.find_element(id: 'search-submit')
  end

  def city_field
    driver.find_element(id: 'cityField')
  end

  def category_choose_label
    driver.find_element(id: 'main-category-choose-label')
  end

  def save_search_top_button
    driver.find_element(id: 'saveSearchCriteriaTop')
  end

  def delivery_cheack_box
    driver.find_element(xpath: "//i[contains(@data-icon, 'olx-delivery')]")
  end

  def geo_suggestions_close
    driver.find_element(id: 'geo-suggestions-close')
  end

  public

  def top_search_field_input(top_search_item)
    top_search_field.clear
    top_search_field.send_keys top_search_item
  end

  def city_field_input(search_city_item)
    city_field.send_keys search_city_item
  end

  def delivery_cheack_box_click
    delivery_cheack_box.click
    until is_correct_items_with_delivery
      sleep(0.5)
    end
  end

  def geo_suggestions_close_click
    geo_suggestions_close.click
  end

  def save_search_top_button_click
    save_search_top_button.click
    sleep(3) # Fail without this line
    SuccessfulSearchPage.new
  end

  def top_search_button_click
    top_search_button.click
  end

  def make_top_search(search_item)
    top_search_field_input(search_item.searchItem)
    city_field_input(search_item.city)
    top_search_button_click
    sleep(5) # Fail without this line
    SuccessfulSearchPage.new
  end

end
