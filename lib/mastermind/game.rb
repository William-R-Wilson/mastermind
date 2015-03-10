module Mastermind

	class Game

		def initialize(board = Board.new)
	  	@board = board
	  	@code = board.generate_code
	  	@guess = []
	  	
	  	puts "The computer has randomly chosen a 4 color code, "
	  	puts "using the colors Orange, Red, Green, and Blue."
	  	puts "You will have 8 guesses to choose the correct answer."
	  	puts "After each guess you will see 4 numbers."
	  	puts "A 2 means that one of your colors is the correct color,"
	  	puts " in the correct position."
	  	puts "A 1 means that you chose a color that is in the code, but" 
	  	puts "isn't in the correct place."
	  	puts "A 0 means that you chose a color that isn't in the code."
	  end
	
	  attr_reader :code
		attr_accessor :guess
		attr_accessor :feedback
		

		def guess_code
			puts "Enter the letters of your guess, separated by a comma\n"
			input = gets.chomp.upcase
			case
			when input == "RESET" 
				new_game
			when input == "EXIT"
				exit
			else
				@guess = input.split(",")
			end
			print "guess: #{@guess}    "
		end

		def compare_guess_to_code() 
			correct_color = "1"
			correct_color_and_pos = "2"
			incorrect_color = "0"
			tempcode = @code.clone
			feedback = []
			a = 0
			4.times do
				if @guess[a] == tempcode[a] 
					feedback.push(correct_color_and_pos)  
					tempcode.delete_at(a)  
					@guess.delete_at(a)
				else
					a +=1
				end
			end

			a = 0
			@guess.length.times do
				if tempcode.include?(guess[a])
					feedback.push(correct_color)
					tempcode.delete_at(a)
					@guess.delete_at(a)
				elsif !(tempcode.include?(guess[a]))				
					feedback.push(incorrect_color)
					tempcode.delete_at(a)
					@guess.delete_at(a)
				else
					puts "Error"
				end				
			end
			feedback.sort!
			feedback.reverse!
			print "Feedback: #{feedback}"
		end


		def guess_feedback
		end

		def play
			turns = 1
			while turns < 9
			print "Code:  #{@code}\n"	
			guess_code
			if @guess == @code 
				puts "Game Over! You win!"
				break
			else
	 			compare_guess_to_code()
				turns += 1
			end
		end
	end

	
	end
	
	

end

def new_game
	game = Mastermind::Game.new
	game.play
end

new_game