
class ConnectFour

  def initialize
    @board = Array.new(42, " ")
  end

  def turn_count
    @board.count { |position| position != " " }
  end



  # turn_count - count number of non-empty spaces
  # player_turn - is the current player who can choose a space i.e .even? O : X
  # input_to_index - the player will choose a column from 1-7 which will be converted from 0-6 index
  # column_free_space - as the token is 'dropped' into the column, it will find that last free space.

  # Maybe we need to organise the @board by column, so 'array' columns within another array @board

  # turn -to begin the game and continue each turn
  # game_over? - when four tokens are in a row the game is over and outputs the winner
  # four_in_row? - iterates/checks for four from current point across each of the diagonal, horizontal, vertical spaces
  # four_in_row, will be triggered by game_over? and will start from each cell to loop and validate
  #

end