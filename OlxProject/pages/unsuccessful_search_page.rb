require_relative '../tools/all_requires'

class UnsuccessfulSearchPage
  include TopSearchPart
  include TopPart

  NO_FOUND_MESSAGE = "Не найдено ни одного объявления"

  def get_error_message
    $driver.find_element(xpath: "//div[contains(@class, 'emptynew  large lheight18')]/p").text
  end

  def search_unsuccess?
    (get_error_message().include? NO_FOUND_MESSAGE) ? true : false
  end
end
