module Quake
    class Kill
        attr_reader :killer, :killed, :type
        # ----------------------------------------------------------------------
        # Constructor
        # ----------------------------------------------------------------------
        def initialize(killer, killed, type)
            @killer = killer
            @killed = killed
            @type = type
        end

        # ----------------------------------------------------------------------
        # Checks
        # ----------------------------------------------------------------------
        def killed_by_world?
            @killer.nil?
        end
    end
end
