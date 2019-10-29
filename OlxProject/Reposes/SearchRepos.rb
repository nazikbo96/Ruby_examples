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
$searhSuccessfulItem = SearchItem.new("MacBook")
$searhUnsuccessfulItem = SearchItem.new("qweqwe")

$top_search_item = TopSearchItem.new("MacBook","Львовская область")
