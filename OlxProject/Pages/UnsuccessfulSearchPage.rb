require_relative 'HomePage'
require_relative 'TopSearchPart'

class UnsuccessfulSearchPage < TopSearchPart
  NO_FOUND_MESSAGE = "Не найдено ни одного объявления"

  public def GetErrorMessage
    return error_message = $driver.find_element(:xpath => ("//div[contains(@class, 'emptynew  large lheight18')]/p")).text
  end

  public def IsSearchUnsuccess
    (GetErrorMessage().include? NO_FOUND_MESSAGE) ? true : false
  end
end
