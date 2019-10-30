require_relative 'HomePage'
require_relative 'TopSearchPart'
require_relative 'TopPart'

class SuccessfulSearchPage
  include TopSearchPart
  include TopPart

  public def GetAllNames
    list_with_names = Array.new
    tmp = $driver.find_elements(:xpath => ("//h3[contains(@class, 'lheight22 margintop5')]/a"))
    (tmp).each do |el|
      list_with_names << el.text.to_s
    end
    return list_with_names
  end

  public def IsCorrectSearch(search_item)
    checker = true
    GetAllNames().each do |name|
      if (name.downcase.include? search_item.downcase) ==false
        checker = false
      end
    end
    return checker
  end
end
