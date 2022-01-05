# ------------------------------------------------------------------------------
# Load libs and classes
# ------------------------------------------------------------------------------
require "json"
require "set"

require_relative "./domain/Kill.rb"
require_relative "./domain/KillType.rb"
require_relative "./domain/Match.rb"
require_relative "./domain/MatchScore.rb"
require_relative "./infra/LogLine.rb"
require_relative "./infra/LogLineForConnect.rb"
require_relative "./infra/LogLineForKill.rb"
require_relative "./infra/LogLineForNewGame.rb"
require_relative "./infra/LogParser.rb"
require_relative "./view/JsonReporter.rb"

# ------------------------------------------------------------------------------
# Init required services
# ------------------------------------------------------------------------------
parser = Quake::Infra::LogParser.new
reporter = Quake::View::JsonReporter.new

# ------------------------------------------------------------------------------
# Parse file from fixed filename or STDIN
# ------------------------------------------------------------------------------
logfile = File.open("#{__dir__}/../data/qgames.log")
matches = parser.parse_matches(logfile)
puts reporter.report_by_player(matches)
puts reporter.report_by_kill_type(matches)
logfile.close
