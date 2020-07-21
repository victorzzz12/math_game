# Create a 2-Player math game where players take turns to answer simple math addition problems. A new math question is generated for each turn by picking two numbers between 1 and 20. The player whose turn it is is prompted the question and must answer correctly or lose a life.

# Player Class
  # Initialized with 3 lives and a name
  # Initialized with false for their turn

# Question Class
  # Random number generator function bewteen 1 and 20
  # Symbols array (division bug found, so was excluded)
  # Correct Answer
  # Expression of the two numbers


# Match Class
  # Initialized with starting text
  # If player life is greater than 3, assign new match
  # If one player's life is zero, ask if players would like to play again
  #


  require './match.rb'
  require './questions.rb'
  require './players.rb'
  
  match = Match.new
  match.turn