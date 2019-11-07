require_relative '../tools/all_requires'

module WrapperPart

  protected
  def currency_by_type(type)
    driver.find_element(xpath: "//a[contains(@data-symbol, '#{type}')]")
  end

  def current_currency
    driver.find_element(xpath: "//ul[contains(@class, 'view-currency currencySelector')]
    //span[contains(@class, 'selected')]")
  end

  def sort_price_asc_button
    driver.find_element(xpath: "//a[contains(@data-type, 'filter_float_price:asc')]")
  end

  def sort_price_desc_button
    driver.find_element(xpath: "//a[contains(@data-type, 'filter_float_price:desc')]")
  end

  public

  def current_sort_method
    driver.find_element(css: '#order-select-gallery>li>a.link.selected>span').text
  end

  def change_currency_to(type)
    currency_by_type(type).click
    until current_currency.text == type
      sleep(0.5)
    end
  end

  def sort_price_asc
    sort_price_asc_button.click
    until current_sort_method.include? 'дешевые'
      sleep(0.5)
    end
  end

  def sort_price_desc
    sort_price_desc_button.click
    until current_sort_method.include? 'дорогие'
      sleep(0.5)
    end
  end

end
