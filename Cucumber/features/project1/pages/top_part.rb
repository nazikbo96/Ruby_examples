module TopPart
  attr_accessor :logout_btn,:home_btn

  def initialize(driver)
    @driver = driver
    @logout_btn = @driver.find_element(css: '.logout>a')
  end

  def logout_btn_click
    @logout_btn.click
  end
  
  def home_btn
    @driver.find_element(xpath: "//a[contains(@href,'home')]")
  end

  def home_btn_click
    home_btn.click
    HomePage.new(@driver)
  end

end
