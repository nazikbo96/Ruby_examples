require_relative '../tools/all_requires'

module WrapperPart
  protected def currency_dolar
    driver.find_element(xpath: "//a[contains(@data-symbol, '$')]")
  end

  protected def currency_euro
    driver.find_element(xpath: "//a[contains(@data-symbol, '€')]")
  end

  protected def currency_hryvnia
    driver.find_element(xpath: "//a[contains(@data-symbol, 'грн.')]")
  end

  protected def current_currency
    driver.find_element(xpath: "//ul[contains(@class, 'view-currency currencySelector')]
    //span[contains(@class, 'selected')]")
  end

  protected def sort_price_asc_button
    driver.find_element(xpath: "//a[contains(@data-type, 'filter_float_price:asc')]")
  end

  protected def sort_price_desc_button
    driver.find_element(xpath: "//a[contains(@data-type, 'filter_float_price:desc')]")
  end

  def current_sort_method
    driver.find_element(css: "#order-select-gallery>li>a.link.selected>span").text
  end

  def currency_change_dolar
    currency_dolar.click
    until current_currency.text == '$'
      sleep(0.5)
    end
  end

  def currency_change_euro
    currency_euro.click
    until current_currency.text == '€'
      sleep(0.5)
    end
  end

  def currency_change_hryvnia
    currency_hryvnia.click
    until current_currency.text == 'грн.'
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
