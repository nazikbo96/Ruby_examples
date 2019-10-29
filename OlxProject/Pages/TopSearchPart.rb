require_relative 'HomePage'

class TopSearchPart
  public def TopSearchField
    return $driver.find_element(:id => ("search-text"))
  end

  public def TopSearchButton
    return $driver.find_element(:id => ("search-submit"))
  end

  public def CityField
    return $driver.find_element(:id => ("cityField"))
  end

  public def CategoryChooseLabel
    return $driver.find_element(:id => ("main-category-choose-label"))
  end

  public def CategorySelectList
    return $driver.find_element(:id => ("categorySelectList"))
  end

  ##################
  public def TopSearchFieldInput(top_search_item)
    TopSearchField().clear
    TopSearchField().send_keys top_search_item
  end

  public def CityFieldInput(search_city_item)
    CityField().send_keys search_city_item
  end

  public def CategorySelectListChoose
    CategorySelectList().click
    $driver.find_element(:id => ("a-category-37")).click
  end

  public def TopSearchButtonClick
    TopSearchButton().click
  end

  public def MakeTopSearch(search_item)
    TopSearchFieldInput(search_item.searchItem)
    CityFieldInput(search_item.city)
    TopSearchButton().click
    sleep(5) # Fail with out this line
    return SuccessfulSearchPage.new
  end
  
end
