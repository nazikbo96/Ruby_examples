require_relative '../all_requires.rb'
require_relative 'menu_part'
require_relative 'dashboard_part'

class HomePage < SitePrism::Page
  include MenuPart
  include DashbordPart

  set_url 'https://s1.demo.opensourcecms.com/wordpress/wp-admin/index.php'

  def loggined?
    text.include? 'WordPress 5.3 is available! Please update now.'
  end

  def page_message
    'WordPress 5.2.4 running'
  end

  def visit_page
    home_button_click
  end
end

class UpdatesPage < SitePrism::Page
  include MenuPart

  def page_message
    "The following plugins have new versions available. Check the ones you want"
  end

  def visit_page
    updates_button_click
  end

end

class AllPostsPage < SitePrism::Page
  include MenuPart

  def page_message
    'All'
  end

  def visit_page
    all_posts_button_click
  end

end

class CategoriesPage < SitePrism::Page
  include MenuPart

  def page_message
    'The default category cannot be deleted.'
  end

  def visit_page
    categories_button_click
  end

end

class TagsPage < SitePrism::Page
  include MenuPart

  def page_message
    'Add New Tag'
  end

  def visit_page
    tags_button_click
  end

end

class AllPagesPage < SitePrism::Page
  include MenuPart

  def page_message
    'items'
  end

  def all_pages_page_css
    ".publish"
  end

  def visit_page
    all_pages_button_click
  end

end

class CommentsPage < SitePrism::Page
  include MenuPart

  def comments_page_path
    '/wordpress/wp-admin/edit-comments.php'
  end

  def page_message
    'Comments'
  end

  def author_page_message
    'Author'
  end

  def visit_page
    comments_button_click
  end

end

class AppearancePage < SitePrism::Page
  include MenuPart

  def appearance_page_path
    "https://s1.demo.opensourcecms.com/wordpress/wp-admin/themes.php"
  end

  def page_message
    'Themes'
  end

  def visit_page
    appearance_button_click
  end

end

class CustomizePage < SitePrism::Page
  include MenuPart

  def customize_page_path
    'https://s1.demo.opensourcecms.com/wordpress/wp-admin/customize.php?return=%2Fwordpress%2Fwp-admin%2Fthemes.php'
  end

  def page_message
    'You are customizing'
  end

  def visit_page
    customize_button_click
  end

end

class WidgetsPage < SitePrism::Page
  include MenuPart

  def page_message
    'A monthly archive of your site’s Posts.'
  end

  def visit_page
    widgets_button_click
  end

end

class MenusPage < SitePrism::Page
  include MenuPart

  def menus_page_path
    'https://s1.demo.opensourcecms.com/wordpress/wp-admin/nav-menus.php'
  end

  def page_message
    'Add menu items'
  end

  def visit_page
    menus_button_click
  end

end

class HeaderPage < SitePrism::Page
  include MenuPart

  def header_page_path
    'https://s1.demo.opensourcecms.com/wordpress/wp-admin/customize.php?return=%2Fwordpress%2Fwp-admin%2Fthemes.php&autofocus%5Bcontrol%5D=header_image'
  end

  def visit_page
    header_button_click
  end

end

class PluginsPage < SitePrism::Page
  include MenuPart

  def page_message
    'items'
  end

  def visit_page
    plugins_button_click
  end

end

class UsersPage < SitePrism::Page
  include MenuPart

  def page_message
    'all'
  end

  def users_page_path
    'https://s1.demo.opensourcecms.com/wordpress/wp-admin/users.php'
  end

  def visit_page
    users_button_click
  end

end

class YourProfilePage < SitePrism::Page
  include MenuPart

  def page_message
    'Personal Options'
  end

  def visit_page
    your_profile_button_click
  end

end

class ToolsPage < SitePrism::Page
  include MenuPart

  def page_message
    'Categories and Tags Converter'
  end

  def visit_page
    tools_button_click
  end

end

class ImportPage < SitePrism::Page
  include MenuPart

  def page_message
    'WordPress can import those into this site'
  end

  def visit_page
    import_button_click
  end

end

class ExportPage < SitePrism::Page
  include MenuPart

  def page_message
    'WordPress will create an XML file'
  end

  def visit_page
    export_button_click
  end

end

class SiteHealthPage < SitePrism::Page
  include MenuPart

  def page_message
    'The site health check shows critical information about your WordPress'
  end

  def visit_page
    site_health_button_click
  end

end

class SettingsGeneralPage < SitePrism::Page
  include MenuPart

  def page_message
    'WordPress Address (URL)'
  end

  def visit_page
    settings_general_button_click
  end

end

class WritingPage < SitePrism::Page
  include MenuPart

  def page_message
    'To post to WordPress by email you must set up'
  end

  def visit_page
    writing_button_click
  end

end

class ReadingPage < SitePrism::Page
  include MenuPart

  def page_message
    'Blog pages show at most'
  end

  def visit_page
    reading_button_click
  end

end

class DiscussionPage < SitePrism::Page
  include MenuPart

  def page_message
    'Default article settings'
  end

  def visit_page
    discussion_button_click
  end

end

class PermalinkPage < SitePrism::Page
  include MenuPart

  def page_message
    'Common Settings'
  end

  def visit_page
    permalink_button_click
  end

end

class PrivacyPage < SitePrism::Page
  include MenuPart

  def page_message
    'As a website owner, you may need to follow'
  end

  def visit_page
    privacy_button_click
  end

end
