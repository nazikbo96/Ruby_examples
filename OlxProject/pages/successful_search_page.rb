require_relative '../tools/all_requires'
require_relative 'top_search_part'
require_relative 'top_part'

class SuccessfulSearchPage
  include TopSearchPart
  include TopPart

  def get_all_names
    list_with_names = Array.new
    tmp = $driver.find_elements(xpath: "//h3[contains(@class, 'lheight22 margintop5')]/a")
    (tmp).each do |el|
      list_with_names << el.text.to_s
    end
    list_with_names
  end

  def correct_search?(search_item)
    checker = true
    get_all_names().each do |name|
      if (name.downcase.include? search_item.downcase) == false
        checker = false
        puts "#{name} ----- #{search_item}"
      end
    end
    checker
  end
end
