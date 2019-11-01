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

class User
  attr_accessor :mail , :pass
  def initialize (mail, pass)
    @mail = mail
    @pass = pass
  end
end
