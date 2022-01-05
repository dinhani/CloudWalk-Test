module Quake
  module Infra
    class LogLine
      def self.parse(line)
        if LogLineForNewGame.matches?(line)
          return LogLineForNewGame.new(line)
        end
        if LogLineForKill.matches?(line)
          return LogLineForKill.new(line)
        end
        if LogLineForConnect.matches?(line)
          return LogLineForConnect.new(line)
        end
        if LogLineForDisconnect.matches?(line)
          return LogLineForDisconnect.new(line)
        end
        return nil
      end
    end
  end
end
