require_relative 'HomePage'

module TopPart
  public def HomeButton
    return $driver.find_element(:id => ("headerLogo"))
  end

  public def PostNew                                        # TODO
    return $driver.find_element(:id => ("postNewAdLink"))
  end

  public def ChangeLang
    return $driver.find_element(:id => ("changeLang"))
  end

  public def TopLoginButton
    return $driver.find_element(:id => ("topLoginLink"))
  end


  public def ChangeLangClick
    ChangeLang().click
  end

  public def HomeButtonClick
    HomeButton().click
    return HomePage.new
  end

  public def TopLoginButtonClick
    TopLoginButton().click
    return LogRegisterPage.new
  end
end
