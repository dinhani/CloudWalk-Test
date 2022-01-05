module Quake
  module Domain
    class Match
      # ------------------------------------------------------------------
      # Init
      # ------------------------------------------------------------------
      attr_reader :players

      def initialize
        @players = Set.new # all players that joined the game, even if they disconnected
        @active_players = {} # players that are active in the game, new connections will replace old connections
        @kills = []
      end

      def add_player(id, name)
        @players << name
        @active_players[id] = name
      end

      def add_kill(killer_id, killed_id, type)
        @kills << Kill.new(@active_players[killer_id], @active_players[killed_id], type)
      end

      # ------------------------------------------------------------------
      # Report
      # ------------------------------------------------------------------
      def score
        MatchScore.new(@players, @kills)
      end
    end
  end
end
