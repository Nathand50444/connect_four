
class ConnectFour

  def initialize
    @board = Array.new(42, " ")
  end

  def turn_count # Test Complete
    @board.count { |position| position != " " }
  end

  COLUMNS = { # Test Complete
    1 => [0, 7, 14, 21, 28, 35],
    2 => [1, 8, 15, 22, 29, 36],
    3 => [2, 9, 16, 23, 30, 37],
    4 => [3, 10, 17, 24, 31, 38],
    5 => [4, 11, 18, 25, 32, 39],
    6 => [5, 12, 19, 26, 33, 40],
    7 => [6, 13, 20, 27, 34, 41]
  }

  DIAGONALS =
    [
      [3, 9, 15, 21], [4, 10, 16, 22], [5, 11, 17, 23], [6, 12, 18, 24],
      [10, 16, 22, 28], [11, 17, 23, 29], [12, 18, 24, 30], [13, 19, 25, 31],
      [17, 23, 29, 35], [18, 24, 30, 36], [19, 25, 31, 37], [20, 26, 32, 38],
      [14, 22, 30, 38], [7, 15, 23, 31], [0, 8, 16, 24], [1, 9, 17, 25],
      [8, 16, 24, 32], [9, 17, 25, 33], [2, 10, 18, 26], [3, 11, 19, 27]
    ]

  WINNING_LENGTH = 4

  def turn
    loop do
      # turn -to begin the game and continue each turn
      puts "Choose a column 1-7 to place your counter!"
      column = gets.strip
      # No we have the player's input we will need to convert it to the index of the chosen column
      if valid_move?(column)
        place_counter(column, current_player)
        turn_count
      else
        puts 'Invalid move, please choose a value between 1-7.'
      end

      if game_over?(current_player)
        break
      end

    end
  end

  def place_counter(column, token)
    # iterate through the values of the chosen column (in reverse) 
    # and find the first value that is empty
    COLUMNS[column].reverse_each do |index|
      if @board[index] == " "
        @board[index] = token
        break
      end
    end
    # This needs to be set up so that IF the value iterated is " "
    # that position becomes the current token and breaks.
  end

  def current_player # Test Complete
    turn_count.even? ? "X" : "O"
  end

  # def input_to_index(input) # Test Complete
  #   input.to_i - 1
  #     NOW NOT REQUIRED AS COLUMNS ARE NOT ZERO-INDEXED
  # end

  def valid_move?(move)
    # Ensure the column number is valid and the top-most position in the column is empty
    move.between?(1, 7) && @board[COLUMNS[move].first] == " "
    # Each do chosen column, iterate through @board spaces and determine
    # Is there a 'free space' available
    # AND is the value between 1 - 7 
  end

  def game_over?(token)
    if vertical_win?(token) || horizontal_win?(token) || diagonal_win(token)
      puts "Congratulations! Token #{token} wins!"
    end
  #     iterate over vertical, diagonal and horizontal values for four in a row.

  #     when four tokens are in a row the game is over and outputs the winner
  #     && when the number of turns exceeds 42 || there are no " " values remaining

  #     four_in_row? - iterates/checks for four from current point across each of the diagonal, horizontal, vertical spaces
  #     four_in_row, will be triggered by game_over? and will start from each cell to loop and validate
  end

  def vertical_win(token)
    COLUMNS.each_value do |column|
      column.each_cons(WINNING_LENGTH) do |sequence|
        if sequence.all? { |index| @board[index] == "#{token}" }
      end
    end
  end

  def horizontal_win(token) 

  end

  def diagonal_win(token)

  end
  # turn_count - count number of non-empty spaces
  # player_turn - is the current player who can choose a space i.e .even? O : X
  # input_to_index - the player will choose a column from 1-7 which will be converted from 0-6 index
  # column_free_space - as the token is 'dropped' into the column, it will find that last free space.

  # Maybe we need to organise the @board by column, so 'array' columns within another array @board

end