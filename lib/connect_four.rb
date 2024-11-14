
class ConnectFour

  def initialize
    @board = Array.new(42, " ")
  end

  def turn_count # Test Complete
    @board.count { |position| position != " " }
  end

  COLUMNS = {
    1 => [0, 7, 14, 21, 28, 35],
    2 => [1, 8, 15, 22, 29, 36],
    3 => [2, 9, 16, 23, 30, 37],
    4 => [3, 10, 17, 24, 31, 38],
    5 => [4, 11, 18, 25, 32, 39],
    6 => [5, 12, 19, 26, 33, 40],
    7 => [6, 13, 20, 27, 34, 41]
  }

  def turn
    loop do
      # turn -to begin the game and continue each turn
      puts "Choose a column 1-7 to place your counter!"
      column = gets.strip
      # No we have the player's input we will need to convert it to the index of the chosen column
      index = input_to_index(column)
      if valid_move?(index)
        place_counter(index, current_player)
      else
        puts 'Invalid move, please choose a value between 1-7.'
      end
    end
  end

  def place_counter(column, token)
    # iterate through the values of the chosen column (in reverse) 
    # and find the first value that is empty
    @board[column].reverse_each do |index| index = " "
    # This needs to be set up so that IF the value iterated is " "
    # that position becomes the current token and breaks.
  end

  def current_player # Test Complete
    turn_count.even? ? "X" : "O"
  end

  def input_to_index(input) # Test Complete
    input.to_i - 1
  end

  def valid_move?(move) # Test Complete
    COLUMNS[move].each do |index| index = " " end && move.between?(1, 7)
    # Each do chosen column, iterate through @board spaces and determine
    # Is there a 'free space' available
    # AND is the value between 1 - 7 
  end

  # turn_count - count number of non-empty spaces
  # player_turn - is the current player who can choose a space i.e .even? O : X
  # input_to_index - the player will choose a column from 1-7 which will be converted from 0-6 index
  # column_free_space - as the token is 'dropped' into the column, it will find that last free space.

  # Maybe we need to organise the @board by column, so 'array' columns within another array @board

  # game_over? - when four tokens are in a row the game is over and outputs the winner
  # four_in_row? - iterates/checks for four from current point across each of the diagonal, horizontal, vertical spaces
  # four_in_row, will be triggered by game_over? and will start from each cell to loop and validate

end