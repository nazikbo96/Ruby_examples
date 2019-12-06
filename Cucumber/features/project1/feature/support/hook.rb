Before do |scenario|
  @login_page = start_test("https://demo.openmrs.org/openmrs/login.htm")
  @login_page.enter_username("admin")
  @login_page.enter_password("Admin123")
  @login_page.click_location
  @login_page.click_login_button
  @home_page = @login_page.verify_home_page
  expect(@home_page).not_to be nil
end
