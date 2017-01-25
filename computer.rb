require_relative "player"

class Computer < Player
	def initialize
		geting_secret_code
		computer_guesing
	end

	def geting_secret_code
		puts "\nType your 4-elements secret code using: "
		puts "R(red), G(green), B(blue), Y(yellow), W(white), O(orange)\n"
		
		@secret_code = gets.chomp.upcase

		until @secret_code.match /^[RGBYWO]{4}$/
			puts "\nYou put invalid code."
			puts "\nType your 4-elements secret code using:"
			puts "R(red), G(green), B(blue), Y(yellow), W(white), O(orange)\n"

			@secret_code = gets.chomp.upcase
		end 
		
	end

	def computer_guesing
		@memory = []
		@round = 1
		computers_type

		until @secret_code == @computers_type || @round == 12
			@round += 1
			computers_type
		end

		win_or_lose(@computers_type)
	end

	def computers_type

		if @memory.length != 4

			case @round
			when 1
				@computers_type = "RRRR"
				feedback(@computers_type)
				@perfect_matches.times {|i| @memory << "R"}  
			when 2
				@computers_type = "GGGG"
				feedback(@computers_type)
				@perfect_matches.times {|i| @memory << "G"}  
			when 3
				@computers_type = "BBBB"
				feedback(@computers_type)
				@perfect_matches.times {|i| @memory << "B"}  
			when 4
				@computers_type = "YYYY"
				feedback(@computers_type)
				@perfect_matches.times {|i| @memory << "Y"}  
			when 5
				@computers_type = "WWWW"
				feedback(@computers_type)
				@perfect_matches.times {|i| @memory << "W"}  
			when 6
				@computers_type = "OOOO"
				feedback(@computers_type)
				@perfect_matches.times {|i| @memory << "O"}  
			end

		elsif @memory.length == 4
			@computers_type = @memory.permutation(4).to_a.shuffle![0].join
			feedback(@computers_type)
		end

	end

end