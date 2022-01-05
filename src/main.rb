# ------------------------------------------------------------------------------
# Load libs and classes
# ------------------------------------------------------------------------------
require "set"

require_relative "./domain/Kill.rb"
require_relative "./domain/KillType.rb"
require_relative "./domain/Match.rb"
require_relative "./domain/MatchScore.rb"
require_relative "./infra/log/LogLine.rb"
require_relative "./infra/log/LogLineForConnect.rb"
require_relative "./infra/log/LogLineForKill.rb"
require_relative "./infra/log/LogLineForNewGame.rb"
require_relative "./infra/log/LogParser.rb"

# ------------------------------------------------------------------------------
# Init required services
# ------------------------------------------------------------------------------
parser = Quake::Log::LogParser.new

# ------------------------------------------------------------------------------
# Parse file from fixed filename or STDIN
# ------------------------------------------------------------------------------
logfile = File.open("qgames.log")
matches = parser.parse_matches(logfile)
matches.each do |match|
    puts match.score.kills_by_player
    puts match.score.kills_by_type
end
logfile.close
