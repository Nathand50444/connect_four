
class ConnectFour

  def initialize
    @board = array.new(42, " ")
  end

  # turn_count - count number of non-empty spaces
  # player_turn - is the current player who can choose a space i.e .even? O : X
  # turn -to begin the game and continue each turn
  # game_over? - when four tokens are in a row the game is over and outputs the winner
  # four_in_row? - iterates/checks for four from current point across each of the diagonal, horizontal, vertical spaces
  # four_in_row, will be triggered by game_over? and will start from each cell to loop and validate

end