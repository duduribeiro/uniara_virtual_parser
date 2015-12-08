module UniaraVirtualParser
	module Models
		class Absence
			attr_reader :frequency, :total

			def initialize(attribuites={})
				@frequency = 		:attribuites.fetch :frequency
				@total = 			:attribuites.fetch :total
		end
	end
end
