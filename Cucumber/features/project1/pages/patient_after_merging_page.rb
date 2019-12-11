require_relative 'top_part.rb'
class PatientAfterMergingPage
  include TopPart

  def given_name
    driver.find_element(css: '.PersonName-givenName')
  end

  def family_name
    driver.find_element(css: '.PersonName-familyName')
  end

  def correct_merge?(name, last_name)
    given_name.text == name && family_name.text == last_name
  end

end
