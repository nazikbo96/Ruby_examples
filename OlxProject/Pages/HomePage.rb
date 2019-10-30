require_relative '../Tools/driver'
require_relative '../Reposes/SearchRepos'
require_relative 'SuccessfulSearchPage'
require_relative 'UnsuccessfulSearchPage'
require_relative 'TopPart'
require_relative 'LogRegisterPage'
require_relative 'TopSearchPart'

class HomePage
  include TopPart

  public def HomeSearchField
    return $driver.find_element(:id => ("headerSearch"))
  end

  public def HomeSearchButton
    return $driver.find_element(:id => ("submit-searchmain"))
  end

  public def HomeSearchFieldInput(search_item)
    HomeSearchField().send_keys search_item
  end

  public def HomeSearchButtonClick
    HomeSearchButton().click
  end

  public def MakeSuccessHomeSearch
    HomeSearchButtonClick()
    return SuccessfulSearchPage.new
  end

  public def MakeUnsuccessHomeSearch
    HomeSearchButtonClick()
    return UnsuccessfulSearchPage.new
  end
end
