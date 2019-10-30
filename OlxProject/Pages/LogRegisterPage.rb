require_relative 'HomePage'
require_relative 'TopPart'

class LogRegisterPage

  include TopPart

  public def LoginTab
    return $driver.find_element(:id => ("login_tab"))
  end

  public def RegisterTab
    return $driver.find_element(:id => ("register_tab")).click
  end

  public def LogUserEmailField
    return $driver.find_element(:id => ("userEmail"))
  end

  public def LogUserPassField
    return $driver.find_element(:id => ("userPass"))
  end

  public def LogUserButton
    return $driver.find_element(:id => ("se_userLogin"))
  end

  public def Captha
    return $driver.find_element(:id => ("recaptcha-anchor"))
  end
  # -----------------------------------------------------------------------
  public def RegUserEmailField
    return $driver.find_element(:id => ("userEmailPhoneRegister"))
  end

  public def RegAcceptCheckbox
    return $driver.find_element(:id => ("checkbox_accept-terms"))
  end

  public def RegUserButton
    return $driver.find_element(:id => ("button_register"))
  end

end
