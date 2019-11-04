require_relative '../tools/all_requires'

module ProductComponentContainer

  def get_all_names
    driver.find_elements(css: ".lheight22.margintop5>a")
  end

  def current_page_number
    driver.find_element(xpath: "//span[contains(@class,'block br3 c41 large tdnone lheight24 current')]")
  end

end
