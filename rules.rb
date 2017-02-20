class Rules
  def initialize
    display_rules
  end

  def display_rules
    puts "\nTHE RULES OF MASTERMIND"
    puts "\nThe two players decide in advance how many games they will play, which"
    puts "must be an even number. One player becomes the codemaker, the other the"
    puts "codebreaker. The codemaker chooses a pattern of four code pegs. Duplicates"
    puts "are allowed. The codebreaker tries to guess the pattern, in both order"
    puts "and color, within twelve turns. After each round player gets feedback about"
    puts "how many of elements are choosen well (both color and place) and how many are"
    puts "suits only by color. Game ends when player figures out the code or after 12 rounds."
  end
end


