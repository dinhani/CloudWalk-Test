module Quake
  module Infra
    class LogLine
      def self.parse(line)
        parser = [LogLineForNewGame, LogLineForKill, LogLineForConnect].find { |parser| parser.matches?(line) }
        return parser.new(line) unless parser.nil?
      end
    end
  end
end
