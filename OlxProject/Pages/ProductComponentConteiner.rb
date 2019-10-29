require_relative 'HomePage'

class ProductComponentContainer
  public def get_all_products
    all_products = $driver.find_element(:id => ("offers_table"))
  end

end
