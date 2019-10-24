class Repos
  attr_reader :searchItem
  attr_writer :searchItem
  def initialize (searchItem)
    @searchItem = searchItem
  end
  public def checker(array)
    check = true
    array.each do |e|
      if (e.text.to_s.downcase.include? searchItem.downcase.to_s) ==false
        check = false
        puts "#{e.text.to_s} ------ ERROR"
      end
    end
    return check
  end
end

$searhItem1 = Repos.new("MacBook")
$searhItem2 = Repos.new("qweqwe")
