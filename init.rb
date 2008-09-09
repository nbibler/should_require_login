begin
  require 'shoulda'
rescue LoadError
  raise(LoadError, "Please install the Shoulda plugin from GitHub (http://github.com/thoughtbot/shoulda)")
end

Test::Unit::TestCase.send(:extend, ShouldRequireLogin)
