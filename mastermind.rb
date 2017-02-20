require_relative "player"
require_relative "computer"
require_relative "rules"

class NewGame
  def initialize
    Rules.new
    choosing_side
  end

  def choosing_side
    puts "\nWelcome to MASTERMIND" 
    puts "\nDo you want to be codemaker or codebreaker ?"
    
    @users_side_choice = gets.chomp.downcase
    
    until @users_side_choice == "codemaker" || @users_side_choice == "codebreaker"
      puts "\nWrong answer. Please type: \"codemaker\" or \"codebreaker\".\n"
      @users_side_choice = gets.chomp.downcase
    end

    if @users_side_choice == "codemaker"
      Computer.new
    elsif @users_side_choice == "codebreaker"
      Player.new
    end
  end
end

NewGame.new