module Quake
  module Domain
    class Kill
      attr_reader :killer_id, :victim_id, :type
      # ----------------------------------------------------------------------
      # Constructor
      # ----------------------------------------------------------------------
      def initialize(killer_id, victim_id, type)
        @killer_id = killer_id
        @victim_id = victim_id
        @type = type
      end

      # ----------------------------------------------------------------------
      # Checks
      # ----------------------------------------------------------------------
      # World is any client with ID below 0 or above MAX_CLIENTS (64)
      # https://github.com/id-Software/Quake-III-Arena/blob/dbe4ddb10315479fc00086f08e25d968b4b43c49/code/cgame/cg_event.c#L103
      # https://github.com/id-Software/Quake-III-Arena/blob/dbe4ddb10315479fc00086f08e25d968b4b43c49/code/botlib/be_aas_def.h#L35
      def by_world?
        @killer_id < 0 or @killer_id >= 64
      end

      # When the killer is also the victim, it is because the player commited suicide
      # 8:13 Kill: 7 7 7: Assasinu Credi killed Assasinu Credi by MOD_ROCKET_SPLASH
      def by_suicide?
        @killer_id == @victim_id
      end
    end
  end
end
