require_relative '../tools/all_requires'

class LogRegisterPage

  include TopPart

  protected def login_tab
    driver.find_element(id: 'login_tab')
  end

  protected def log_user_email_field
    driver.find_element(id: 'userEmail')
  end

  protected def log_user_pass_field
    driver.find_element(id: 'userPass')
  end

  protected def log_user_button
    driver.find_element(id: 'se_userLogin')
  end

  protected def log_fb_button
    driver.find_element(id: 'fblogin')
  end

  protected def captha                              # TODO
    driver.find_element(id: 'recaptcha-anchor')
  end
  # -----------------------------------------------------------------------
  protected def register_tab
    driver.find_element(id: 'register_tab')
  end

  protected def reg_user_pass
    driver.find_element(id: 'userPassRegister')
  end

  protected def reg_user_email_field
    driver.find_element(id: 'userEmailPhoneRegister')
  end

  protected def reg_accept_checkbox
    driver.find_element(xpath: "//input[contains(@id,'checkbox_accept-terms')]/../../.././label[contains(@class,'icon f_checkbox inlblk vtop')]")
  end

  protected def reg_user_button
    driver.find_element(id: 'button_register')
  end
  # -----------------------------------------------------------------------
  def login_tab_click
    return login_tab.click
  end

  def register_tab_click
    return register_tab.click
  end

  def log_user_button_click
    return log_user_button.click
  end

  def log_user_email_field_input(mail)
    log_user_email_field.send_keys mail
  end

  def log_user_pass_field_input(pass)
    log_user_pass_field.send_keys pass
  end

  def log_fb_button_click
    log_fb_button.click
  end
  # -----------------------------------------------------------------------
  def reg_user_email_field_input(mail)
    reg_user_email_field.send_keys mail
  end

  def reg_user_pass_input(pass)
    reg_user_pass.send_keys pass
  end

  def reg_accept_checkbox_click
    reg_accept_checkbox.click
  end

  def reg_user_button_click
    driver.execute_script('window.scrollTo(0, document.body.scrollHeight)')
    reg_user_button.click
  end
  # -----------------------------------------------------------------------
  def fb_mail_field_input(mail)
    driver.find_element(id: 'email').send_keys mail
  end

  def fb_pass_field_input(pass)
    driver.find_element(id: 'pass').send_keys pass
  end

  def fb_login_button_click
    driver.find_element(id: 'loginbutton').click
  end

  def registration(user)
    register_tab_click
    reg_user_email_field_input(user.mail)
    reg_user_pass_input(user.pass)
    reg_accept_checkbox_click
    reg_user_button_click
  end

  def loging(user)
    login_tab_click
    log_fb_button_click
    fb_mail_field_input(user.mail)
    fb_pass_field_input(user.pass)
    fb_login_button_click
    UserPage.new
  end
end
