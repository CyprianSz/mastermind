class Player
	def initialize
		creating_secret_code
		breaking_the_code
	end

	def creating_secret_code
		colors = ["R","G","B","Y","W","O"]
		@secret_code = (0...4).map { ["R","G","B","Y","W","O"][rand(6)] }.join
	end

	def breaking_the_code
		@round = 1
		taking_players_type

		until @secret_code == @players_type || @round == 12
			@round += 1
			taking_players_type
		end

		win_or_lose(@players_type)
	end

	def taking_players_type
		puts "\nGive your type: "
		@players_type = gets.chomp.upcase

		until @players_type.match /^[RGBYWO]{4}$/
			puts "\nYour type is invalid."
			puts "\nType your 4-elements type using:"
			puts "R(red), G(green), B(blue), Y(yellow), W(white), O(orange)\n"

			@players_type = gets.chomp.upcase
		end

		feedback(@players_type)
	end

	def feedback(type)
		perfect_matches(type)
		correct_color(type)

		puts "\nChosen: #{type}, at round number #{@round}"
		puts "#{@perfect_matches} element(s) matches perfect."
		puts "#{@correct_color - @perfect_matches} element(s) color is correct."
	end

	def perfect_matches(type)
		@perfect_matches = 0
		@n = 0
		@secret_code.each_char { |x|
			@perfect_matches += 1 if x == type[0 + @n]
			@n += 1
		}
	end

	def correct_color(type)
		@correct_color = 0
		@array1 = type.split(//)
		@array2 = @secret_code.split(//)

		@array1.each { |x| 
			if @array2.include?(x)
				@correct_color += 1
				@array2.delete_at(@array2.index(x))
			end
		}
	end

	def win_or_lose(type)

		if @secret_code == type
			puts "\nCode broken in #{@round} round!"
			play_again?
		elsif @round >= 12
			puts "\nRound limit exceeded (12)."
			play_again?
		end

	end

	def play_again?
		puts "Play again ? (Type \"Y\" or \"N\")"
		play_again = gets.chomp.downcase

		until play_again == "y" || play_again == "n"
			puts "Type \"Y\" or \"N\""
			play_again = gets.chomp.downcase
		end

		if play_again == "y"
			NewGame.new
		elsif play_again == "n"
			exit
		end

	end

end