require_relative '../tools/all_requires'

class UnsuccessfulSearchPage
  include TopSearchPart
  include TopPart

  NO_FOUND_MESSAGE = "Не найдено ни одного объявления"

  def error_message
    driver.find_element(xpath: "//div[contains(@class, 'emptynew  large lheight18')]/p")
  end

  def error_message_text
    error_message.text
  end

  def search_unsuccess?
    error_message_text.include? NO_FOUND_MESSAGE
  end
end
