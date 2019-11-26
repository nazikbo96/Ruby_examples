require_relative '../all_requires.rb'

class LoginPage < SitePrism::Page
  set_url 'https://s1.demo.opensourcecms.com/wordpress/wp-login.php?redirect_to=https%3A%2F%2Fs1.demo.opensourcecms.com%2Fwordpress%2Fwp-admin%2Findex.php&reauth=1'
  element :username_field, "input[name='log']"
  element :password_field, "input[name='pwd']"

  def log_in(username, password)
    username_field.set(username)
    password_field.set(password)
    click_on('Log In')
    HomePage.new
  end
end
