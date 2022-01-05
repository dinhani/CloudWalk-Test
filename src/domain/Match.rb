module Quake
  module Domain
    class Match
      # ------------------------------------------------------------------
      # Constructor
      # ------------------------------------------------------------------
      attr_reader :players, :kills

      def initialize
        @players = {}
        @kills = []
      end

      # ------------------------------------------------------------------------
      # Modifiers
      # ------------------------------------------------------------------------
      def update_player(id, name)
        id = id.to_i
        # if exists, update name
        # if not exists, create it
        if @players.key(id)
          player = @players[id]
          player.name = name
        else
          player = Player.new(id, name)
          @players[id] = player
        end
      end

      def add_kill(killer_id, victim_id, type)
        killer_id = killer_id.to_i
        victim_id = victim_id.to_i
        @kills << Kill.new(killer_id, victim_id, type)
      end

      # ------------------------------------------------------------------
      # Report
      # ------------------------------------------------------------------
      def score
        MatchScore.new(@players.clone, @kills.clone)
      end
    end
  end
end
