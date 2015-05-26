module UniaraVirtualParser
  module Models
    class Subject
      attr_reader :name, :first_bimester, :second_bimester, :third_bimester,
                  :fourth_bimester, :substitutive, :average, :recovery, :status

      def initialize(attributes = {})
        @name             = attributes.fetch :name
        @first_bimester   = attributes.fetch :first_bimester
        @second_bimester  = attributes.fetch :second_bimester
        @third_bimester   = attributes.fetch :third_bimester
        @fourth_bimester  = attributes.fetch :fourth_bimester
        @substitutive     = attributes.fetch :substitutive
        @average          = attributes.fetch :average
        @recovery         = attributes.fetch :recovery
        @status           = attributes.fetch :status
      end
    end
  end
end
