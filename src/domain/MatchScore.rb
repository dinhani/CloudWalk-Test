module Quake
  module Domain
    class MatchScore
      # ------------------------------------------------------------------
      # Initialize
      # ------------------------------------------------------------------
      def initialize(players, kills)
        @players = players
        @kills = kills
      end

      # ------------------------------------------------------------------
      # Calculators - Public
      # ------------------------------------------------------------------
      def kills_by_player
        initial_kills_by_player
          .merge(player_kills)
          .merge(world_kills) { |_, pk, wk| pk - wk }
      end

      def kills_by_type
        kills_by_type = @kills.group_by(&:type).transform_values(&:size)
        initial_kills_by_type.merge(kills_by_type)
      end

      def kill_count
        player_kills.values.sum + world_kills.values.sum
      end

      # ------------------------------------------------------------------
      # Calculators - Private
      # ------------------------------------------------------------------
      private def initial_kills_by_player
        @players.zip([0].cycle).to_h
      end

      private def initial_kills_by_type
        KillType.constants.zip([0].cycle).to_h
      end

      private def player_kills
        @kills
          .reject(&:killed_by_world?)
          .group_by(&:killed)
          .transform_values(&:size)
      end

      private def world_kills
        @kills
          .select(&:killed_by_world?)
          .group_by(&:killed)
          .transform_values(&:size)
      end
    end
  end
end
