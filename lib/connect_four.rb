class ConnectFour

  def initialize
    @board = Array.new(42, " ")
    @current_player = "X"
  end

  def turn_count # Test Complete
    @board.count { |position| position != " " }
  end

  def display_board
    puts " 1   2   3   4   5   6   7"
    puts "-" * 29

    (0..42).step(7) do |row_start|
      row = @board[row_start, 7]
      puts row.map { |cell| cell == " " ? " " : cell }.join(" | ")
      puts "-" * 29
    end
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
      column = gets.strip.to_i
      # No we have the player's input we will need to convert it to the index of the chosen column
      if valid_move?(column)
        place_counter(column, @current_player)
        display_board
        
        if game_over?(@current_player)
          puts "Congratulations! Token #{@current_player} wins!"
          break
        elsif turn_count == 42
          puts "It's a draw! Game over."
          break
        end
        turn_count
        @current_player = @current_player == "X" ? "O" : "X"
      else
        puts 'Invalid move, please choose a value between 1-7.'
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

  # def current_player # Test Complete
  #   turn_count.even? ? "X" : "O"
  # end

  # def input_to_index(input) # Test Complete
  #   input.to_i - 1
  #     NOW NOT REQUIRED AS COLUMNS ARE NOT ZERO-INDEXED
  # end

  def valid_move?(move) # Test complete
    # Ensure the column number is valid and the top-most position in the column is empty
    move.between?(1, 7) && @board[COLUMNS[move].first] == " "
    # Each do chosen column, iterate through @board spaces and determine
    # Is there a 'free space' available
    # AND is the value between 1 - 7 
  end

  def game_over?(token)
    if vertical_win?(token) || horizontal_win?(token) || diagonal_win?(token)
      return true
    end
  #     iterate over vertical, diagonal and horizontal values for four in a row.

  #     when four tokens are in a row the game is over and outputs the winner
  #     && when the number of turns exceeds 42 || there are no " " values remaining

  #     four_in_row? - iterates/checks for four from current point across each of the diagonal, horizontal, vertical spaces
  #     four_in_row, will be triggered by game_over? and will start from each cell to loop and validate
  end

  def vertical_win?(token) # Test complete
    COLUMNS.each_value do |column|
      column.each_cons(WINNING_LENGTH) do |sequence|
        return true if sequence.all? { |index| @board[index] == "#{token}" }
      end
    end
    false
  end

  def horizontal_win?(token) # Test complete
    (0..42).each_slice(7) do |row|
      row.each_cons(WINNING_LENGTH) do |sequence|
        return true if sequence.all? { |index| @board[index] == "#{token}" }
      end
    end
    false
  end

  def diagonal_win?(token) # Test complete
    DIAGONALS.each do |line|
      line.each_cons(WINNING_LENGTH) do |sequence|
        return true if sequence.all? { |index| @board[index] == "#{token}" }
      end
    end
    false
  end
end