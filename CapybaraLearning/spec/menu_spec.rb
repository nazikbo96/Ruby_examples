require_relative '../all_requires.rb'

describe 'When testing demo.opensourcecms website' do
  let(:login_page) { LoginPage.new }
  let(:home_page) { HomaPage.new }
  let(:pages_array) {[ HomePage.new, UpdatesPage.new, AllPostsPage.new, CategoriesPage.new, TagsPage.new,
    AllPagesPage.new, CommentsPage.new, AppearancePage.new, WidgetsPage.new, MenusPage.new,
    PluginsPage.new, UsersPage.new, YourProfilePage.new, ToolsPage.new, ImportPage.new,
    ExportPage.new, SiteHealthPage.new, SettingsGeneralPage.new, WritingPage.new, ReadingPage.new, DiscussionPage.new,
    PermalinkPage.new, PrivacyPage.new ]}

  before(:all) do
    Capybara.configure do |config|
      config.run_server = false
      config.default_driver = :poltergeist
    end
  end

  it 'Verify navigating to the login page' do
    login_page.load
  end

  it 'Verify loggining' do
    home_page = login_page.log_in('opensourcecms', 'opensourcecms')
    expect(home_page.loggined?).to be true
  end

  it 'Verify navigation to all pages' do
    pages_array.each do |current_page|
      current_page.visit_page
      expect(current_page).to have_content current_page.page_message
      expect(current_page).to have_css current_page.page_css
    end
  end

end
