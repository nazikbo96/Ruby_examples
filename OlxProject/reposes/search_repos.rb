class SearchItem
  attr_accessor :searchItem
  def initialize (searchItem)
    @searchItem = searchItem
  end
end

class TopSearchItem
  attr_accessor :searchItem, :city
  def initialize (searchItem, city)
    @searchItem = searchItem
    @city = city
  end
end
$searh_successfu_item = SearchItem.new("MacBook")
$searh_unsuccessful_item = SearchItem.new("qweqwe")

$top_search_item = TopSearchItem.new("MacBook","Львовская область")
