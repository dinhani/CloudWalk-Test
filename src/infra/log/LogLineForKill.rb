module Quake
    module Log
        class LogLineForKill
            # ------------------------------------------------------------------
            # Static
            # ------------------------------------------------------------------
            def self.is_kill?(line)
                line.include? "Kill:"
            end

            # ------------------------------------------------------------------
            # Constructor
            # ------------------------------------------------------------------
            attr_reader :killer_id, :killed_id, :kill_type
            def initialize(line)
                _, _, @killer_id, @killed_id, rest = line.split(" ", 5)
                @kill_type = rest.split(" ")[-1]
            end
        end
    end
end
