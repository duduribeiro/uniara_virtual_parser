module UniaraVirtualParser
	module Models
		class Absence
			attr_reader :frequency, :total

			def initialize(attributes={})
				@frequency = attributes.fetch :frequency, nil
				@total =     attributes.fetch :total, nil
			end
		end
	end
end
