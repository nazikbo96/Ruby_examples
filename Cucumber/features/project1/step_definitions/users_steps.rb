Given("I launch login page") do
  @driver = driver
  @LoginPage = start_test("https://demo.openmrs.org/openmrs/login.htm")
end

And(/^I enter username$/) do
  @LoginPage.enterUsername("admin")
end

And(/^I enter password$/) do
  @LoginPage.enterPassword("Admin123")
end

And(/^I click location$/) do
  @LoginPage.clickLocation
end

When(/^I click Login button$/) do
  @LoginPage.clickLoginButton
end

Then(/^I see Home page$/) do
  @LoginPage.verifyHomePageHeader
end
