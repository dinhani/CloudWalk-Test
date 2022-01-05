module Quake
  module Domain
    class Player
      # ------------------------------------------------------------------
      # Constructor
      # ------------------------------------------------------------------
      attr_reader :id, :name
      attr_accessor :connected

      def initialize(id, name)
        @id = id
        @name = name
      end

      def connected?
        @connected
      end
    end
  end
end
