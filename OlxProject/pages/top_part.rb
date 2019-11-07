require_relative '../tools/all_requires'

module TopPart

  protected

  def home_button
    driver.find_element(id: 'headerLogo')
  end

  def post_new                                        # TODO
    driver.find_element(id: 'postNewAdLink')
  end

  def change_lang
    driver.find_element(id: 'changeLang')
  end

  def top_login_button
    driver.find_element(id: 'topLoginLink')
  end

  def logout_button
    driver.find_element(id: 'login-box-logout')
  end

  public

  def logout_button_click
    driver.action.move_to(top_login_button).perform
    logout_button.click
  end

  def change_lang_click
    change_lang.click
  end

  def home_button_click
    home_button.click
    HomePage.new
  end

  def top_login_button_click
    top_login_button.click
    LogRegisterPage.new
  end

  def top_login_for_loggined_click
    top_login_button.click
    UserPage.new
  end
end
