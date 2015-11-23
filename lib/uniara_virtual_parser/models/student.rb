module UniaraVirtualParser
  module Models
    class Student
      attr_reader :name

      def initialize(attributes = {})
        @name = attributes.fetch :name
      end
    end
  end
end
