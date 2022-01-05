module Quake
    module Log
        class LogLineForNewGame
            # ------------------------------------------------------------------
            # Static
            # ------------------------------------------------------------------
            def self.is_init?(line)
                line.include? "InitGame:"
            end

            # ------------------------------------------------------------------
            # Constructor
            # ------------------------------------------------------------------
            def initialize(line)
            end
        end
    end
end
