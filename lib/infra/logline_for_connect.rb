module Quake
  module Infra
    class LogLineForConnect
      # ------------------------------------------------------------------
      # Static
      # ------------------------------------------------------------------
      def self.matches?(line)
        line.include? 'ClientUserinfoChanged:'
      end

      # ------------------------------------------------------------------
      # Constructor
      # ------------------------------------------------------------------
      attr_reader :client_id, :client_name

      # example:
      # 20:34 ClientUserinfoChanged: 2 n\Isgalamido\t\0\model\xian/default\hmodel\xian/default\g_redteam\\g_blueteam\\c1\4\c2\5\hc\100\w\0\l\0\tt\0\tl\0
      def initialize(line)
        _, _, @client_id, connection_info = line.split(' ', 4)
        @client_name = connection_info.split("\\")[1]
      end
    end
  end
end
