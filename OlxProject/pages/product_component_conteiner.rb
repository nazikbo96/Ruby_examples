require_relative '../tools/all_requires'
module ProductComponentContainer

  def get_all_names
    driver.find_elements(css: ".lheight22.margintop5>a")
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

  protected def last_page_text
    driver.find_element(xpath: "//a[contains(@data-cy,'page-link-last')]/span").text
  end

  protected def prev_next(element)
    driver.find_elements(xpath: "//#{element}[contains(@class,'link pageNextPrev')]")
  end

  def get_current_page_number
    wait_untill(current_page_number).text
  end

  def goto_first_page
    scroll_down
    wait_untill(first_page).click
    until correct_page_number?('1')
      sleep(1)
    end
  end

  def goto_last_page
    scroll_down
    last_p = last_page_text
    wait_untill(last_page).click
    until correct_page_number?(last_p)
      sleep(1)
    end
  end

  def goto_prev_next_page
    scroll_down
    prev_p = (get_current_page_number.to_i + 1).to_s
    next_p = (get_current_page_number.to_i - 1).to_s
    (wait_untill(prev_next('a')[0])).click
    until correct_page_number?(prev_p) || correct_page_number?(next_p)
      sleep(1)
    end
  end

  def correct_button_count?(buttons, spans)
    prev_next('a').length == buttons && prev_next("span").length == spans
  end

  def correct_page_number?(page)
    puts get_current_page_number
    get_current_page_number == page
  end

end
