require_relative '../tools/all_requires'

class UserPage
  include TopPart
  USER_PAGE_MESSAGE = "Объявления"

  protected def observed_search_link
    $driver.find_element(id: 'observed-search-link')
  end

  def observed_search_link_click
    observed_search_link().click
  end

  def get_observed_item
    $driver.find_element(xpath: "//span[contains(@class,'block fbold')]").text
  end

  def clear_observed_click
    $driver.find_element(xpath: "//a[contains(@class,'link removeObservedSearch')]").click
  end

  def get_user_page_message
    $driver.find_element(css: '#usertabs>div>div>h2').text
  end

  def user_page_loaded?
    puts get_user_page_message()
    get_user_page_message() == USER_PAGE_MESSAGE ? true : false
  end
end
