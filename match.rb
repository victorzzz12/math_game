require './questions.rb'
require './players.rb'

class Match

  def initialize
    puts 'Welcome to the Math Olympics'
    sleep(1)

    puts 'Player 1 Name:'
    name1 = gets.chomp
    @player1 = Players.new(name1)
    
    puts 'Player 2 Name:'
    name2 = gets.chomp
    @player2 = Players.new(name2)

    sleep(1)
    puts "Okay, #{@player1.name} and #{@player2.name}..."
    puts 'Fight!'
  end

  def question
    q = Question.new
    @query = q.question
    @ans = q.answer
    sleep(1)
    puts '||QUESTION||'

    if @player1.turn
      sleep(1)
      puts "  - #{@player1.name} -"
      puts "#{@query}"
    else
      sleep(1)
      puts " - #{@player2.name} - "
      puts "#{@query}"
    end
  end

  #How many lives are left
  def life
    sleep(1)
    puts "Score: "
    puts "#{@player1.name}: #{@player1.life.to_s}/3 :: #{@player2.name}: #{@player2.life.to_s}/3}"
  end

  def correct?
    if STDIN.gets.chomp.to_i == @ans
      if @player1.turn
        puts 'You are correct!'
        @player1.turn = false
        @player2.turn = true
        life
        win?
      else
        puts 'You are correct!'
        @player1.turn = true
        @player2.turn = false
        life
        win?
      end
    else
      if @player1.turn
        @player1.life -= 1
        puts "#{@player1.name} was WRONG!"
        @player1.turn = false
        @player2.turn = true
        sleep(1)
        puts "The corrent answer was #{@ans}."
        life
        win?
      else
        @player2.life -= 1
        puts "#{@player2.name} was WRONG!"
        @player1.turn = true
        @player2.turn = false
        sleep(1)
        puts "The corrent answer was #{@ans}."
        life
        win?
      end
    end
  end

#Whose turn is it?
  def turn
    question
    correct?
  end

#Is the game over?
  def game_over?
    @life <= 0
  end

#Did a player win?
  def win?
    if @player1.life == 0
      sleep(1)
      puts ' - GAME OVER -'
      sleep(1)
      puts "#{@player2.name} wins!"
      sleep(1)
      puts 'Would you like to play again? (Y/N)'
      choice = gets.chomp
      if choice == 'Y'
        new_match = Match.new
        new_match.turn
      else
        puts 'Thank you for playing!'
      end
    elsif @player2.life == 0
      puts ' - GAME OVER -'
      sleep(1)
      puts "#{@player1.name} wins!"
      sleep(1)
      puts 'Would you like to play again? (Y/N)'
      choice = gets.chomp
      if choice == 'Y'
        new_match = Match.new
        new_match.turn
      else
        puts 'Thank you for playing!'
      end
    else
      turn
    end
  end
end