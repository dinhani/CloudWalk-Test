module Quake
  module View
    class JsonReporter
      def report_by_player(matches)
        report = matches.map.with_index { |match, index|
          score = match.score
          {
            "game_#{index + 1}": {
              total_kills: score.kill_count,
              players: match
                .players
                .values
                .map(&:name)
                .sort,
              kills: score
                .kills_by_player
                .transform_keys { |k| match.players[k].name }
                .sort_by { |k, v| -v }.to_h,
            },
          }
        }
        JSON.pretty_generate(report)
      end

      def report_by_kill_type(matches)
        report = matches.map.with_index { |match, index|
          score = match.score
          {
            "game_#{index + 1}": {
              kills_by_means: score
                .kills_by_type
                .sort_by { |k, v| -v }.to_h,
            },
          }
        }
        JSON.pretty_generate(report)
      end
    end
  end
end
