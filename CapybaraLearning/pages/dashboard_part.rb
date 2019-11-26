require_relative '../all_requires.rb'
require_relative 'menu_part'

module DashbordPart SitePrism::Page
  def get_main_page_ref
    all(:xpath, "//div[contains(@id,'wpbody-content')]//a")
  end

  def dashboard_headings
    ['Dashboard', 'Welcome to WordPress!', 'At a Glance', 'Activity', 'Quick Draft',
      'WordPress Events and News', 'Get Started', 'Next Steps', 'More Actions',
      'Recently Published', 'Recent Comments', 'View more comments']
  end

  def get_main_page_buttons
    all(:xpath, "//div[contains(@id,'wpbody-content')]//button[contains(@type,'button')]")
  end

  def get_main_page_headings
    headings = []
    ['h1', 'h2', 'h3'].map {|h| all(:css, "#{h}").map {|element| headings << element.text}}
    headings
  end

  def correct_headings?
    get_main_page_headings == dashboard_headings
  end

  def get_main_page_input
    all(:css, 'input')
  end

  def get_main_page_text
    all(:xpath, "//div[contains(@id,'wpbody-content')]//div[contains(text(),'')]")
  end

end
