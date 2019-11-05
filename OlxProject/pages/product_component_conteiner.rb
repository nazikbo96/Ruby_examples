require_relative '../tools/all_requires'
module ProductComponentContainer

  def get_all_names
    driver.find_elements(css: ".lheight22.margintop5>a")
  end

  def get_all_prices
    driver.find_elements(xpath: "//table[contains(@id, 'offers_table')]//p[contains(@class,'price')]")
  end

  def get_all_items_with_delivery
    driver.find_elements(css: "div.olx-delivery-badge")
  end
  
  protected def current_page_number
    driver.find_element(xpath: "//span[contains(@class,'block br3 c41 large tdnone lheight24 current')]")
  end

  protected def first_page
    driver.find_element(xpath: "//*[text() = '1']")
  end

  protected def last_page
    driver.find_element(xpath: "//a[contains(@data-cy,'page-link-last')]")
  end

  protected def next_page
    driver.find_element(xpath: "//a[contains(@data-cy,'page-link-next')]")
  end

  protected def prev_page
    driver.find_element(xpath: "//a[contains(@data-cy,'page-link-prev')]")
  end

  def last_page_text
    driver.find_element(xpath: "//a[contains(@data-cy,'page-link-last')]/span").text
  end

  def get_current_page_number
    wait_untill(current_page_number).text
  end

  def goto_first_page
    scroll_down
    first_page.click
    until correct_page_number?('1')
      sleep(0.5)
    end
  end

  def goto_last_page
    scroll_down
    last_p = last_page_text
    last_page.click
    until correct_page_number?(last_p)
      sleep(0.5)
    end
  end

  def goto_next_page
    scroll_down
    next_p = (get_current_page_number.to_i + 1).to_s
    next_page.click
    until correct_page_number?(next_p)
      sleep(0.5)
    end
  end

  def goto_prev_page
    scroll_down
    prev_p = (get_current_page_number.to_i - 1).to_s
    prev_page.click
    until correct_page_number?(prev_p)
      sleep(0.5)
    end
  end

  def correct_page_number?(page)
    get_current_page_number == page
  end

  def next_page_button_available?
    driver.find_elements(xpath: "//a[contains(@data-cy,'page-link-next')]").empty?
  end

  def prev_page_button_available?
    driver.find_elements(xpath: "//a[contains(@data-cy,'page-link-prev')]").empty?
  end


end
