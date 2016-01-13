#Add to AbsencesFeature
module UniaraVirtualParser
  module Models
    class Subject
      attr_reader :name, :first_bimester, :second_bimester, :third_bimester,
                  :fourth_bimester, :substitutive, :average, :recovery, :status,
	  			  			:absences

      def initialize(attributes = {})
        @name             = attributes.fetch :name, nil
        @first_bimester   = attributes.fetch :first_bimester, nil
        @second_bimester  = attributes.fetch :second_bimester, nil
        @third_bimester   = attributes.fetch :third_bimester, nil
        @fourth_bimester  = attributes.fetch :fourth_bimester, nil
        @substitutive     = attributes.fetch :substitutive, nil
        @average          = attributes.fetch :average, nil
        @recovery         = attributes.fetch :recovery, nil
        @status           = attributes.fetch :status, nil
    		@absences		  		= attributes.fetch :absences, nil
      end
    end
  end
end
