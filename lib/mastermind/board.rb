
module Mastermind

	class Board

		def initialize
			puts "New game initiated"
		end

		def generate_code
			colors = ["O","R","B","G"]
			selection = []
			4.times do 
				a = rand(4)
				selection.push(colors[a])
			end
			selection
		end
	end
end




