# ------------------------------------------------------------------------------
# Load libs and classes
# ------------------------------------------------------------------------------
require_relative "_libs.rb"
require "rspec"

files = Dir.glob("#{__dir__}/../test/**/*").select { |it| it.end_with? "rb" }
puts files
RSpec::Core::Runner.run(files, $stderr, $stdout)
