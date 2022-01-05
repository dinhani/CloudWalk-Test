module Quake
  module Infra
    class LogParser
      # ----------------------------------------------------------------------
      # Static Factory
      # ----------------------------------------------------------------------
      def parse_matches(log_io)
        # read all events from IO
        events = log_io
          .map { |line| LogLine.parse(line) }
          .compact

        # convert events to games
        matches = []
        current_match = nil
        events.each do |event|
          case event
          when LogLineForNewGame
            current_match = Domain::Match.new
            matches << current_match
          when LogLineForConnect
            current_match.update_player(event.client_id, event.client_name)
          when LogLineForDisconnect
            current_match.remove_player(event.client_id)
          when LogLineForKill
            current_match.add_kill(event.killer_id, event.victim_id, event.kill_type)
          end
        end
        matches
      end
    end
  end
end
