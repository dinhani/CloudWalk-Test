
# frozen_string_literal: true
module Quake
  module Infra
    class LogLineForKill
      # ------------------------------------------------------------------
      # Static
      # ------------------------------------------------------------------
      def self.matches?(line)
        line.include? "Kill:"
      end

      # ------------------------------------------------------------------
      # Constructor
      # ------------------------------------------------------------------
      attr_reader :killer_id, :victim_id, :kill_type

      # example:
      # 20:54 Kill: 1022 2 22: <world> killed Isgalamido by MOD_TRIGGER_HURT
      def initialize(line)
        _, _, @killer_id, @victim_id, rest = line.split(" ", 5)
        @kill_type = rest.split(" ")[-1]
      end
    end
  end
end
