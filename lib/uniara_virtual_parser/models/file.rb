module UniaraVirtualParser
  module Models
    class File
      attr_reader :grade, :link, :name

      def initialize(attributes = {})
        @grade  = attributes.fetch :grade
        @link   = attributes.fetch :link
        @name   = attributes.fetch :name
      end
    end
  end
end
