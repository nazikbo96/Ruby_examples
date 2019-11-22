require_relative '../all_requires.rb'
require_relative 'menu_part'

module DashbordPart SitePrism::Page
  def get_main_page_ref
    all(:xpath, "//div[contains(@id,'wpbody-content')]//a")
  end

  def get_main_page_buttons
    all(:css, 'button')
  end

  def get_main_page_headings
    headings = Array.new
    all(:css, 'h1').each {|h| headings << h}
    all(:css, 'h2').each {|h| headings << h}
    all(:css, 'h3').each {|h| headings << h}
  end

  def get_main_page_input
    all(:css, 'input')
  end

  def get_main_page_text
    all(:xpath, "//div[contains(@id,'wpbody-content')]//div[contains(text(),'')]")
  end

end
