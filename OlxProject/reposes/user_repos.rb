class User
  attr_accessor :mail , :pass
  def initialize (mail, pass)
    @mail = mail
    @pass = pass
  end
end

$test_user = User.new("nazar-y96@ukr.net","qwetryGhj1")
$fb_account = User.new("nazar-y96@ukr.net","123546vbn")
