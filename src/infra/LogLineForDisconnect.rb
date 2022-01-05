module Quake
  module Infra
    class LogLineForDisconnect
      # ------------------------------------------------------------------
      # Static
      # ------------------------------------------------------------------
      def self.matches?(line)
        line.include? "ClientUserinfoChanged:"
      end

      # ------------------------------------------------------------------
      # Constructor
      # ------------------------------------------------------------------
      attr_reader :client_id

      # example:
      # 7:58 ClientDisconnect: 8
      def initialize(line)
        _, _, @client_id = line.split(" ", 4)
      end
    end
  end
end
