# ------------------------------------------------------------------------------
# Load libs and classes
# ------------------------------------------------------------------------------
require "json"

require_relative "./domain/Kill.rb"
require_relative "./domain/KillType.rb"
require_relative "./domain/Match.rb"
require_relative "./domain/MatchScore.rb"
require_relative "./domain/Player.rb"
require_relative "./infra/LogLine.rb"
require_relative "./infra/LogLineForConnect.rb"
require_relative "./infra/LogLineForDisconnect.rb"
require_relative "./infra/LogLineForKill.rb"
require_relative "./infra/LogLineForNewGame.rb"
require_relative "./infra/LogParser.rb"
require_relative "./view/JsonReporter.rb"

# ------------------------------------------------------------------------------
# Functions
# ------------------------------------------------------------------------------
def write_report(filename, report)
  puts "Writing report: #{filename}"
  File.write(filename, report)
end

# ------------------------------------------------------------------------------
# Init required services
# ------------------------------------------------------------------------------
parser = Quake::Infra::LogParser.new
reporter = Quake::View::JsonReporter.new

# ------------------------------------------------------------------------------
# Read log file
# ------------------------------------------------------------------------------
log_filename = "#{__dir__}/../data/input/qgames.log"  # default filename inside the package
if not ARGV.empty?
  log_filename = ARGV[0]
end

puts "Reading logfile: #{log_filename}"
log_file = File.open(log_filename)

# ------------------------------------------------------------------------------
# Parse log file
# ------------------------------------------------------------------------------
puts "Parsing logfile: #{File.absolute_path(log_file)}"
matches = parser.parse_matches(log_file)
log_file.close

# ------------------------------------------------------------------------------
# Output report
# ------------------------------------------------------------------------------
write_report("#{__dir__}/../data/output/kills_by_player.json", reporter.report_by_player(matches))
write_report("#{__dir__}/../data/output/kills_by_type.json", reporter.report_by_kill_type(matches))
