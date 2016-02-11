module UniaraVirtualParser
  module Models
    class Absence
      attr_reader :name, :frequency, :total

      def initialize(attributes={})
        @name      = attributes.fetch :name, nil
        @frequency = attributes.fetch :frequency, nil
        @total     = attributes.fetch :total, nil
      end
    end
  end
end
