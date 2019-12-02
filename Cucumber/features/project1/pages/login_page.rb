class LoginPage
  attr_accessor :loginTab,:txtUsername,:txtPassword,:btnLogin

  def initialize(browser)
    @browser = browser
    @loginTab    = @browser.a(:text =&gt; "Login")
    @txtUsername = @browser.text_field(:id =&gt; "userId")
    @txtPassword = @browser.text_field(:id =&gt; "password")
    @btnLogin    = @browser.element(:id =&gt; "log_in_button")
  end

  def visit
    @browser.goto "https://codoid.com"
  end

  def clickLoginTab()
    @loginTab.click
  end

  def enterUsername(username)
    @txtUsername.set username
  end

  def enterPassword(password)
    @txtPassword.set password
  end

  def clickLoginButton
    @btnLogin.click
  end

  def verifyHomePageHeader()
    @browser.element(:text =&gt; "Dashboard").wait_until_present
  end
end
