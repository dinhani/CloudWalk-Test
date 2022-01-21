module Quake
  module Domain
    class Player
      # ------------------------------------------------------------------
      # Constructor
      # ------------------------------------------------------------------
      attr_reader :id, :name

      def initialize(id, name)
        @id = id
        @name = name
      end
    end
  end
end
