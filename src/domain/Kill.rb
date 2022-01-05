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
    # World is any client with ID below 0 or above MAX_CLIENTS (64)
    # https://github.com/id-Software/Quake-III-Arena/blob/dbe4ddb10315479fc00086f08e25d968b4b43c49/code/cgame/cg_event.c#L103
    # https://github.com/id-Software/Quake-III-Arena/blob/dbe4ddb10315479fc00086f08e25d968b4b43c49/code/botlib/be_aas_def.h#L35
    def by_world?
      @killer < 0 or @killer >= 64
    end

    # When the killer is aldo the killed party, it is because the player commited suicide
    def by_suicide?
      @killer == @killed
    end
  end
end
