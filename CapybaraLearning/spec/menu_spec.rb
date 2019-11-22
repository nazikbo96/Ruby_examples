require_relative '../all_requires.rb'

describe 'When testing demo.opensourcecms website' do

  before(:all) do
    Capybara.configure do |config|
      config.run_server = false
      config.default_driver = :poltergeist
    end
      @login_page = LoginPage.new
      @home_page = HomePage.new
      @updates_page = UpdatesPage.new
      @all_posts_page = AllPostsPage.new
      @categories_page = CategoriesPage.new
      @tags_page = TagsPage.new
      @all_pages_page = AllPagesPage.new
      @comments_page = CommentsPage.new
      @appearance_page = AppearancePage.new
      @customize_page = CustomizePage.new
      @widgets_page = WidgetsPage.new
      @menus_page = MenusPage.new
      @header_page = HeaderPage.new
      @plugins_page = PluginsPage.new
      @user_page = UsersPage.new
      @profile_page = YourProfilePage.new
      @tools_page = ToolsPage.new
      @import_page = ImportPage.new
      @export_page = ExportPage.new
      @site_health_page = SiteHealthPage.new
      @settings_general_page = SettingsGeneralPage.new
      @writing_page = WritingPage.new
      @reading_page = ReadingPage.new
      @discussion_page = DiscussionPage.new
      @permalink_page = PermalinkPage.new
      @privacy_page = PrivacyPage.new
  end

  it 'Verify navigating to the login page' do
    @login_page.load
  end

  it 'Verify loggining' do
    @home_page = @login_page.log_in('opensourcecms', 'opensourcecms')
    expect(@home_page.loggined?).to be true
  end

  it 'Verify navigating to Home page' do
    @home_page.home_button_click
    expect(@home_page).to have_content @home_page.home_page_message
  end

  it 'Verify navigating to Update page' do
    @updates_page = @home_page.updates_button_click
    expect(@updates_page).to have_content @updates_page.updates_message
  end

  it 'Verify navigating to Post page' do
    @all_posts_page = @updates_page.all_posts_button_click
    expect(@all_posts_page).to have_content @all_posts_page.all_posts_page_message
  end

  it 'Verify navigating to Categories page' do
    @categories_page = @all_posts_page.categories_button_click
    expect(@categories_page).to have_content @categories_page.categories_page_message
  end

  it 'Verify navigating to Tags page' do
    @tags_page = @categories_page.tags_button_click
    expect(@tags_page).to have_content @tags_page.tags_page_message
  end

  it 'Verify navigating to All Pages page' do
    @all_pages_page = @tags_page.all_pages_button_click
    expect(@all_pages_page).to have_content @all_pages_page.all_pages_page_message
    expect(@all_pages_page).to have_css(@all_pages_page.all_pages_page_css)
  end

  it 'Verify navigating to Comments page' do
    @comments_page = @all_pages_page.comments_button_click
    expect(@comments_page).to have_content @comments_page.comments_page_message
    expect(@comments_page).to have_content @comments_page.author_page_message
  end

  it 'Verify navigating to Appearance page' do
    @appearance_page = @comments_page.appearance_button_click
    expect(@appearance_page).to have_content @appearance_page.appearance_page_message
  end

  it 'Verify navigating to Customize page' do
    @customize_page = @appearance_page.customize_button_click
    expect(@customize_page).to have_current_path @customize_page.customize_page_path
    expect(@customize_page).to have_content @customize_page.customize_page_message
  end

  it 'Verify navigating to previous page' do
    @customize_page.go_back
    expect(@appearance_page).to have_current_path @appearance_page.appearance_page_path
  end

  it 'Verify navigating to Widgets page' do
    @widgets_page = @appearance_page.widgets_button_click
    expect(@widgets_page).to have_content @widgets_page.widgetsPage_message
  end

  it 'Verify navigating to Menus page' do
    @menus_page = @widgets_page.menus_button_click
    expect(@menus_page).to have_content @menus_page.menus_page_message
  end

  it 'Verify navigating to Header page' do
    @header_page = @menus_page.header_button_click
    expect(@header_page).to have_current_path @header_page.header_page_path
  end

  it 'Verify navigating to previous page' do
    @header_page.go_back
    expect(@appearance_page).to have_current_path @appearance_page.appearance_page_path
  end

  it 'Verify navigating to Plugins page' do
    @plugins_page = @appearance_page.plugins_button_click
    expect(@plugins_page).to have_content @plugins_page.plugins_page_message
  end

  it 'Verify navigating to User page' do
    @user_page = @plugins_page.users_button_click
    expect(@user_page).to have_current_path @user_page.users_page_path
  end

  it 'Verify navigating to Your Profile page' do
    @profile_page = @user_page.your_profile_button_click
    expect(@profile_page).to have_content @profile_page.your_profile_page_message
  end

  it 'Verify navigating to Tools page' do
    @tools_page = @profile_page.tools_button_click
    expect(@tools_page).to have_content @tools_page.tools_page_message
  end

  it 'Verify navigating to Import page' do
    @import_page = @tools_page.import_button_click
    expect(@import_page).to have_content @import_page.import_page_message
  end

  it 'Verify navigating to Export page' do
    @export_page = @import_page.export_button_click
    expect(@export_page).to have_content @export_page.export_page_message
  end

  it 'Verify navigating to Site Health page' do
    @site_health_page = @export_page.site_health_button_click
    expect(@site_health_page).to have_content @site_health_page.site_health_page_message
  end

  it 'Verify navigating to Site General Setting page' do
    @settings_general_page = @site_health_page.settings_general_button_click
    expect(@settings_general_page).to have_content @settings_general_page.settings_general_page_message
  end

  it 'Verify navigating to Site Writing page' do
    @writing_page = @settings_general_page.writing_button_click
    expect(@writing_page).to have_content @writing_page.writing_page_message
  end

  it 'Verify navigating to Site Reading page' do
    @reading_page = @writing_page.reading_button_click
    expect(@reading_page).to have_content @reading_page.reading_page_message
  end

  it 'Verify navigating to Discussion page' do
    @discussion_page = @reading_page.discussion_button_click
    expect(@discussion_page).to have_content @discussion_page.discussion_page_message
  end

  it 'Verify navigating to Permalink page' do
    @permalink_page = @discussion_page.permalink_button_click
    expect(@permalink_page).to have_content @permalink_page.permalink_page_message
  end

  it 'Verify navigating to Privacy page' do
    @privacy_page = @permalink_page.privacy_button_click
    expect(@privacy_page).to have_content @privacy_page.privacy_page_message
  end

end
