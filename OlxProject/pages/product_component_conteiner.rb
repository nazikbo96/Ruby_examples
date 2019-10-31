require_relative '../tools/all_requires'

class ProductComponentContainer
  def get_all_products
     $driver.find_element(id: 'offers_table')
  end

end
