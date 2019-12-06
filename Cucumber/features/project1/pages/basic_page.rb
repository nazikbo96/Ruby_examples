require_relative 'top_part.rb'

class BasicPage

  include TopPart

  def initialize(browser)
    @driver = browser
  end

end
