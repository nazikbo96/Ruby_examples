class LoginPage
  attr_accessor :txtUsername,:txtPassword,:btnLogin,:location

  def initialize(browser)
    @driver = browser
    @txtUsername = @driver.find_element(id: 'username')
    @txtPassword = @driver.find_element(id: 'password')
    @location    = @driver.find_element(xpath: "//li[contains(text(),'Inpatient Ward')]")
    @btnLogin    = @driver.find_element(id: 'loginButton')
  end

  def visit
    @driver.navigate.to "https://demo.openmrs.org/openmrs/login.htm"
  end

  def enterUsername(username)
    @txtUsername.send_keys username
  end

  def enterPassword(password)
    @txtPassword.send_keys password
  end

  def clickLocation
    @location.click
  end

  def clickLoginButton
    @btnLogin.click
  end

  def verifyHomePageHeader()
    @driver.find_element(:xpath => "//h4[contains(text(),'Logged in as Super User () at Inpatient Ward.')]")
  end
end
