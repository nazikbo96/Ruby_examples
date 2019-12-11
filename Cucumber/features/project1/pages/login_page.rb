class LoginPage

  def txt_username
    driver.find_element(id: 'username')
  end

  def txt_password
    driver.find_element(id: 'password')
  end

  def location
    driver.find_element(xpath: "//li[contains(text(),'Inpatient Ward')]")
  end

  def btn_login
    driver.find_element(id: 'loginButton')
  end

  def visit_page
    driver.navigate.to "https://demo.openmrs.org/openmrs/login.htm"
  end

  def enter_username(username)
    txt_username.send_keys username
  end

  def enter_password(password)
    txt_password.send_keys password
  end

  def click_location
    location.click
  end

  def click_login_button
    btn_login.click
  end

  def verify_home_page
    return HomePage.new if driver.find_element(:xpath => "//h4[contains(text(), 'Logged in as Super User')]").nil? == false
  end

end
