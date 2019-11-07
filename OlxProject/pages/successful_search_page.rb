require_relative '../tools/all_requires'
require_relative 'top_search_part'
require_relative 'top_part'
require_relative 'product_component_conteiner'
require_relative 'wrapper_part'

class SuccessfulSearchPage
  include TopSearchPart
  include TopPart
  include ProductComponentContainer
  include WrapperPart

  def do_list_all_names
    get_all_names.map { |e| e.text }
  end

  def not_correct_search?(search_item)
    do_list_all_names.any? { |word| !(word.downcase.include? search_item.downcase) }
  end

  def do_list_all_prices
    get_all_prices.map { |e| e.text }
  end

  def not_correct_currency?(currency)
    do_list_all_prices.any? { |word| !(word.downcase.include? currency) }
  end

  def is_sorted_price_asc?
    get_int_price(do_list_all_prices).each_cons(2).all?{|left, right| left <= right}
  end

  def is_sorted_price_desc?
    get_int_price(do_list_all_prices).each_cons(2).all?{|left, right| left >= right}
  end

  def is_correct_items_with_delivery
    get_all_items_with_delivery.length == get_all_names.length
  end

  def get_int_price(string_list)
    string_list.map {|x| (x[/\d+/]).to_i}
  end

end
