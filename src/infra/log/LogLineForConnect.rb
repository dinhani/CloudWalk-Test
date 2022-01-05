module Quake
    module Log
        class LogLineForConnect
            # ------------------------------------------------------------------
            # Static
            # ------------------------------------------------------------------
            def self.is_connect?(line)
                line.include? "ClientUserinfoChanged:"
            end

            # ------------------------------------------------------------------
            # Constructor
            # ------------------------------------------------------------------
            attr_reader :client_id, :client_name
            def initialize(line)
                _, _, @client_id, connection_info = line.split(" ", 4)
                @client_name = connection_info.split("\\")[1]
            end
        end
    end
end
