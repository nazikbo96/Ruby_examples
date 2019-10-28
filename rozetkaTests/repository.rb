class SearchRepos
  attr_accessor :searchItem
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

$searhItem1 = SearchRepos.new("MacBook")
$searhItem2 = SearchRepos.new("qweqwe")

class AccountRepos
  attr_accessor :name, :password, :mail, :reason
  def initialize (name, password, mail , reason )
    @name = name
    @password = password
    @mail = mail
    @reason = reason
  end
end

$account = AccountRepos.new("Nazar", "123546Ghj@^%",
  "nazar-y96@ukr.net", "I don`t need this account.")
