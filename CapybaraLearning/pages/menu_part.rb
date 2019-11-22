require_relative '../all_requires.rb'

module MenuPart

  def home_button_click
    click_on 'Home'
    HomePage.new
  end

  def updates_button_click
    home_button_click
    click_on 'Updates'
    UpdatesPage.new
  end

  def all_posts_button_click
    click_on 'Posts'
    click_on 'All Posts'
    AllPostsPage.new
  end

  def categories_button_click
    click_on 'Posts'
    click_on 'Categories'
    CategoriesPage.new
  end

  def tags_button_click
    click_on 'Posts'
    click_on 'Tags'
    TagsPage.new
  end

  def all_pages_button_click
    click_link 'Pages'
    click_link 'All Pages'
    AllPagesPage.new
  end

  def comments_button_click
    find('#menu-comments').click_on
    CommentsPage.new
  end

  def appearance_button_click
    click_link 'Appearance'
    AppearancePage.new
  end

  def customize_button_click
    appearance_button_click
    find(:xpath, "//li//a[contains(text(),'Customize')]").click
    CustomizePage.new
  end

  def widgets_button_click
    appearance_button_click
    click_link 'Widgets'
    WidgetsPage.new
  end

  def menus_button_click
    appearance_button_click
    click_link 'Menus'
    MenusPage.new
  end

  def header_button_click
    appearance_button_click
    click_link 'Header'
    HeaderPage.new
  end

  def plugins_button_click
    visit 'https://s1.demo.opensourcecms.com/wordpress/wp-admin/plugins.php'
    click_on 'Installed Plugins'
    PluginsPage.new
  end

  def users_button_click
    click_link 'Users'
    click_link 'All Users'
    UsersPage.new
  end

  def your_profile_button_click
    click_link 'Users'
    click_link 'Your Profile'
    YourProfilePage.new
  end

  def tools_button_click
    click_link 'Tools'
    click_link 'Available Tools'
    ToolsPage.new
  end

  def import_button_click
    tools_button_click
    click_link 'Import'
    ImportPage.new
  end

  def export_button_click
    tools_button_click
    click_link 'Export'
    ExportPage.new
  end

  def site_health_button_click
    tools_button_click
    click_link 'Site Health'
    SiteHealthPage.new
  end

  def setting_button_click
    click_link 'Settings'
  end

  def settings_general_button_click
    setting_button_click
    click_link 'General'
    SettingsGeneralPage.new
  end

  def writing_button_click
    setting_button_click
    click_link 'Writing'
    WritingPage.new
  end

  def reading_button_click
    setting_button_click
    click_link 'Reading'
    ReadingPage.new
  end

  def discussion_button_click
    setting_button_click
    click_link 'Discussion'
    DiscussionPage.new
  end

  def permalink_button_click
    setting_button_click
    click_link 'Permalink'
    PermalinkPage.new
  end

  def privacy_button_click
    setting_button_click
    click_link 'Privacy'
    PrivacyPage.new
  end

end
