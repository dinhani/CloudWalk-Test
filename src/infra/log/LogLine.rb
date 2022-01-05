module Quake
    module Log
        class LogLine
            def self.parse(line)
                if LogLineForNewGame.is_init?(line)
                    return LogLineForNewGame.new(line)
                end
                if LogLineForKill.is_kill?(line)
                    return LogLineForKill.new(line)
                end
                if LogLineForConnect.is_connect?(line)
                    return LogLineForConnect.new(line)
                end
                return nil
            end
        end
    end
end
