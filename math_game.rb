=begin
Create a 2-Player math game where players take turns to answer 
  simple math addition problems. A new math question is generated 
  for each turn by picking two numbers between 1 and 20. The player 
  whose turn it is is prompted the question and must answer correctly 
  or lose a life.

Task 1  - extract nouns:
    - player
    - match/game
      - guess
      - result

Player
    - lives
    - lose life

Match (player1, player2)
    - while(lives > 0)
    - turns
      - guess
      - answer
    - winner
    -start()

Question(x, y)
    - question -> "What does x plus y equal?"
    - check_guess -> x + y

=end

# Create new question
class Question
  def initialize
    @num1 = rand(1..25) # random number from 1-25
    @num2 = rand(1..25) # random number from 1-25
  end

  def question
    "What does #{@num1} plus #{@num2} equal?"
  end

  def check_guess?(guess)
    @num1 + @num2 == guess # returns true or false
  end

end

# Create new player
class Player
  attr_accessor :lives # Player.lives to get lives

  def initialize
    @lives = 3
  end

  def lose_life
    @lives -= 1
  end

end

# Create new match
class Match
  attr_accessor :player1, :player2

  def initialize
    # Game set-up:
    @player1 = Player.new
    @player2 = Player.new
    puts "----- STARTING LIVES -----"
    puts "P1: #{player1.lives}/3 vs P2: #{player2.lives}/3"
    puts "----- GAME START -----"
  end

  def start
    current_player = @player1
    player_num = 1
    

    while(@player1.lives > 0 && @player2.lives > 0)
      # generate and show question
      current_question = Question.new
      puts "Player #{player_num}: #{current_question.question}"
      
      # get player answer
      print "Answer: "
      guess = gets.chomp.to_i
      result = current_question.check_guess?(guess)

      if(result)
        puts "Player #{player_num}: YES! You are correct."
      else
        current_player.lose_life
        puts "Player #{player_num}: Seriously? No! You just lost a life."
      end
      puts "P1: #{player1.lives}/3 vs P2: #{player2.lives}/3"
      puts "----- NEW TURN -----"
      
      # update tracking variables
      player_num = (player_num == 1 ? 2 : 1)
      current_player = (current_player == @player1 ? @player2 : @player1)
    end

    puts "... some time later ..."
    puts "Player #{player_num} wins with a score of #{current_player.lives}/3"
    puts "----- GAME OVER -----"
    puts "Good bye!"

  end
end


# START GAME
game1 = Match.new
game1.start


# TESTS for classes:

# Player tests
# player1 = Player.new
# puts player1.lives
# player1.lose_life
# player1.lose_life
# puts player1.lives

# Question tests
# question1 = Question.new
# puts question1.question
# puts question1.check_guess?(3)
