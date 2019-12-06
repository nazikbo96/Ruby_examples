require_relative 'top_part.rb'
class RegisterPatient
  attr_accessor :given_name_field,:family_name_field,:gender_menu,:male_choose,
  :female_choose,:birthdate_menu,:estimated_years_field,:estimated_mounth_field,:address_menu,:address_field,:phone_number_menu,
  :phone_field,:confirm_menu,:confirm_btn

  include TopPart

  def initialize(browser)
    @driver = browser

    @given_name_field = @driver.find_element(css: "input[name = givenName]")
    @family_name_field = @driver.find_element(css: "input[name = familyName]")

    @gender_menu = @driver.find_element(id: 'genderLabel')
    @male_choose = @driver.find_element(xpath: "//select[contains(@id,'gender-field')]//option[contains(text(),'Male')]")
    @female_choose = @driver.find_element(xpath: "//select[contains(@id,'gender-field')]//option[contains(text(),'Female')]")

    @birthdate_menu = @driver.find_element(id: 'birthdateLabel')
    @estimated_years_field = @driver.find_element(id: 'birthdateYears-field')
    @estimated_mounth_field = @driver.find_element(id: 'birthdateMonths-field')

    @address_menu = @driver.find_element(xpath: "//span[contains(text(),'Address')]")
    @address_field = @driver.find_element(id: 'address1')

    @phone_number_menu = @driver.find_element(xpath: "//span[contains(text(),'Phone')]")
    @phone_field = @driver.find_element(css: '.phone.focused')

    @confirm_menu = @driver.find_element(id: 'confirmation_label')

    @confirm_btn = @driver.find_element(id: 'submit')

    @similar_patient_message = @driver.find_element(id: 'similarPatients')
  end

  def given_name_field_input(name)
    @given_name_field.click
    @given_name_field.send_keys name
  end

  def family_name_field(name)
    @family_name_field.click
    @family_name_field.send_keys name
  end

  def gender_menu_click
    @gender_menu.click
  end

  def male_choose_click
    @male_choose.click
  end

  def female_choose_click
    @female_choose.click
  end

  def birthdate_menu_click
    @birthdate_menu.click
  end

  def estimated_years_field_input(years)
    @estimated_years_field.click
    @estimated_years_field.send_keys years
  end

  def estimated_mounth_field(mounth)
    @estimated_mounth_field.send_keys mounth
  end

  def address_menu_click
    @address_menu.click
  end

  def address_field_input(address)
    @address_field.click
    @address_field.send_keys address
  end

  def phone_number_menu_click
    @phone_number_menu.click
  end

  def phone_field_input(phone)
    @phone_field.click
    @phone_field.send_keys phone
  end

  def confirm_menu_click
    @confirm_menu.click
  end

  def confirm_btn_click
    @confirm_btn.click
  end

  def similar_message_onpage?
    @similar_patient_message.nil?
  end
end
