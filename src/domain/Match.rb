module Quake
  module Domain
    class Match
      # ------------------------------------------------------------------
      # Constructor
      # ------------------------------------------------------------------
      attr_reader :players

      def initialize
        @players = {}
        @kills = []
      end

      # ------------------------------------------------------------------------
      # Modifiers
      # ------------------------------------------------------------------------
      def update_player(id, name)
        id = id.to_i
        # if exists, update name and set status to connected
        # if not exists, create connected
        if @players.key(id)
          player = @players[id]
          player.name = name
        else
          player = Player.new(id, name)
          @players[id] = player
        end
        player.connected = true
      end

      def remove_player(id)
        id = id.to_i
        @players[id].connected = false
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
