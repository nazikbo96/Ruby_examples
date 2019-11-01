require_relative '../tools/all_requires'

module ProductComponentContainer

   def get_all_products
     driver.find_element(id: 'offers_table')
  end

  def get_all_names
    driver.find_elements(xpath: "//h3[contains(@class, 'lheight22 margintop5')]/a")
  end
end
