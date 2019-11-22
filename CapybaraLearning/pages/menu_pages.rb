require_relative '../all_requires.rb'
require_relative 'menu_part'
require_relative 'dashboard_part'

class HomePage < SitePrism::Page
  include MenuPart
  include DashbordPart

  set_url 'https://s1.demo.opensourcecms.com/wordpress/wp-admin/index.php'

  def loggined?
    text.include? 'Welcome to WordPress!'
  end

  def home_page_message
    'WordPress 5.2.4 running'
  end

end

class UpdatesPage < SitePrism::Page
  include MenuPart

  def updates_message
    "The following plugins have new versions available. Check the ones you want"
  end

end

class AllPostsPage < SitePrism::Page
  include MenuPart

  def all_posts_page_message
    'item'
  end

end

class CategoriesPage < SitePrism::Page
  include MenuPart

  def categories_page_message
    'The default category cannot be deleted.'
  end

end

class TagsPage < SitePrism::Page
  include MenuPart

  def tags_page_message
    'Add New Tag'
  end

end

class AllPagesPage < SitePrism::Page
  include MenuPart

  def all_pages_page_message
    'items'
  end

  def all_pages_page_css
    ".publish"
  end

end

class CommentsPage < SitePrism::Page
  include MenuPart

  def comments_page_path
    '/wordpress/wp-admin/edit-comments.php'
  end

  def comments_page_message
    'Comments'
  end

  def author_page_message
    'Author'
  end

end

class AppearancePage < SitePrism::Page
  include MenuPart

  def appearance_page_path
    "https://s1.demo.opensourcecms.com/wordpress/wp-admin/themes.php"
  end

  def appearance_page_message
    'Themes'
  end

end

class CustomizePage < SitePrism::Page
  include MenuPart

  def customize_page_path
    'https://s1.demo.opensourcecms.com/wordpress/wp-admin/customize.php?return=%2Fwordpress%2Fwp-admin%2Fthemes.php'
  end

  def customize_page_message
    'You are customizing'
  end

end

class WidgetsPage < SitePrism::Page
  include MenuPart

  def widgetsPage_message
    'A monthly archive of your site’s Posts.'
  end

end

class MenusPage < SitePrism::Page
  include MenuPart

  def menus_page_path
    'https://s1.demo.opensourcecms.com/wordpress/wp-admin/nav-menus.php'
  end

  def menus_page_message
    'Add menu items'
  end

end

class HeaderPage < SitePrism::Page
  include MenuPart

  def header_page_path
    'https://s1.demo.opensourcecms.com/wordpress/wp-admin/customize.php?return=%2Fwordpress%2Fwp-admin%2Fthemes.php&autofocus%5Bcontrol%5D=header_image'
  end

end

class PluginsPage < SitePrism::Page
  include MenuPart

  def plugins_page_message
    'items'
  end

end

class UsersPage < SitePrism::Page
  include MenuPart

  def users_page_path
    'https://s1.demo.opensourcecms.com/wordpress/wp-admin/users.php'
  end

end

class YourProfilePage < SitePrism::Page
  include MenuPart

  def your_profile_page_message
    'Personal Options'
  end

end

class ToolsPage < SitePrism::Page
  include MenuPart

  def tools_page_message
    'Categories and Tags Converter'
  end

end

class ImportPage < SitePrism::Page
  include MenuPart

  def import_page_message
    'WordPress can import those into this site'
  end

end

class ExportPage < SitePrism::Page
  include MenuPart

  def export_page_message
    'WordPress will create an XML file'
  end

end

class SiteHealthPage < SitePrism::Page
  include MenuPart

  def site_health_page_message
    'The site health check shows critical information about your WordPress'
  end

end

class SettingsGeneralPage < SitePrism::Page
  include MenuPart

  def settings_general_page_message
    'WordPress Address (URL)'
  end

end

class WritingPage < SitePrism::Page
  include MenuPart

  def writing_page_message
    'To post to WordPress by email you must set up'
  end

end

class ReadingPage < SitePrism::Page
  include MenuPart

  def reading_page_message
    'Blog pages show at most'
  end

end

class DiscussionPage < SitePrism::Page
  include MenuPart

  def discussion_page_message
    'Default article settings'
  end

end

class PermalinkPage < SitePrism::Page
  include MenuPart

  def permalink_page_message
    'Common Settings'
  end

end

class PrivacyPage < SitePrism::Page
  include MenuPart

  def privacy_page_message
    'As a website owner, you may need to follow'
  end

end
