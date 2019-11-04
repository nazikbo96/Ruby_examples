require_relative '../tools/all_requires'
require_relative 'top_search_part'
require_relative 'top_part'
require_relative 'product_component_conteiner'

class SuccessfulSearchPage
  include TopSearchPart
  include TopPart
  include ProductComponentContainer

  def do_list_all_names
    get_all_names.map{|e| e.text}
  end

  def not_correct_search?(search_item)
    do_list_all_names.any? { |word| !(word.downcase.include? search_item.downcase)}
  end

end
