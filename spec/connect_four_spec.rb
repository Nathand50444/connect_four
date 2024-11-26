# instructions -> https://www.theodinproject.com/lessons/ruby-connect-four#project-tdd-connect-four

require_relative '../lib/connect_four'

describe ConnectFour do

  describe 'Game Constants' do
    
    before do
      stub_const("ConnectFour::COLUMNS", {
        1 => [0, 7, 14, 21, 28, 35],
        2 => [1, 8, 15, 22, 29, 36],
        3 => [2, 9, 16, 23, 30, 37],
        4 => [3, 10, 17, 24, 31, 38],
        5 => [4, 11, 18, 25, 32, 39],
        6 => [5, 12, 19, 26, 33, 40],
        7 => [6, 13, 20, 27, 34, 41]
      })
    end
  
    it 'uses the stubbed constant in the test' do
      expect(ConnectFour::COLUMNS[1]).to eq([0, 7, 14, 21, 28, 35])
    end
  end

  describe '#valid_move?' do
    game = ConnectFour.new

    before do
      game.instance_variable_set(:@board, [ 
        "O", " ", " ", " ", " ", " ", " ", # Row 1 
        "X", " ", " ", " ", " ", " ", " ", # Row 2 
        "O", " ", " ", " ", " ", " ", " ", # Row 3 
        "X", " ", " ", " ", " ", " ", " ", # Row 4 
        "O", " ", " ", " ", " ", " ", " ", # Row 5 
        "X", " ", " ", " ", " ", " ", " "  # Row 6 
        ])
      end
      
    it 'returns false for a taken column' do
      expect(game.valid_move?(1)).to eq(false)
    end

    it 'returns false for value not between 1-7' do
      expect(game.valid_move?(0)).to eq(false)
    end
    
    it 'returns true for a column with empty spots' do
      expect(game.valid_move?(2)).to eq(true)
    end
  end

  describe '#turn_count' do
      game = ConnectFour.new

      before do
        game.instance_variable_set(:@board, [ 
          " ", " ", " ", " ", " ", " ", " ", # Row 1 
          " ", " ", " ", " ", " ", " ", " ", # Row 2 
          " ", " ", " ", " ", " ", " ", " ", # Row 3 
          " ", " ", " ", " ", " ", " ", " ", # Row 4 
          " ", " ", " ", " ", " ", " ", " ", # Row 5 
          "X", "O", "X", "O", " ", " ", " "  # Row 6 
          ])
      end

      it 'shows the turn count is 4' do
        expect(game.turn_count).to eq(4)
      end
  end

  describe '#horizontal_win?' do
    context 'when four X values are in a row horizontally' do
      let(:game) { ConnectFour.new }

      before do
        game.instance_variable_set(:@board, [ 
          " ", " ", " ", " ", " ", " ", " ", # Row 1 
          " ", " ", " ", " ", " ", " ", " ", # Row 2 
          " ", " ", " ", " ", " ", " ", " ", # Row 3 
          " ", " ", " ", " ", " ", " ", " ", # Row 4 
          "O", "O", "O", " ", " ", " ", " ", # Row 5 
          "X", "X", "X", "X", " ", " ", " "  # Row 6 
          ])
      end

      it 'returns true' do
        expect(game.horizontal_win?("X")).to eq(true)
      end
    end
  end

  describe '#vertical_win?' do
    context 'when four X values are in a row vertically' do
      let(:game) { ConnectFour.new }

      before do
        game.instance_variable_set(:@board, [ 
          " ", " ", " ", " ", " ", " ", " ", # Row 1 
          " ", " ", " ", " ", " ", " ", " ", # Row 2 
          "X", " ", " ", " ", " ", " ", " ", # Row 3 
          "X", "O", " ", " ", " ", " ", " ", # Row 4 
          "X", "O", " ", " ", " ", " ", " ", # Row 5 
          "X", "O", " ", " ", " ", " ", " "  # Row 6 
          ])
      end

      it 'returns true' do
        expect(game.vertical_win?("X")).to eq(true)
      end
    end
  end

 describe '#diagonal_win?' do
    context 'when four X values are in a row diagonally' do
      let(:game) { ConnectFour.new }

      before do
        game.instance_variable_set(:@board, [ 
          " ", " ", " ", " ", " ", " ", " ", # Row 1 
          " ", " ", " ", " ", " ", " ", " ", # Row 2 
          " ", " ", " ", "X", " ", " ", " ", # Row 3 
          " ", "O", "X", "O", " ", " ", " ", # Row 4 
          " ", "X", "O", "X", " ", " ", " ", # Row 5 
          "X", "O", "X", "O", " ", " ", " "  # Row 6 
          ])
      end

      it 'returns true' do
        expect(game.diagonal_win?("X")).to eq(true)
      end
    end
  end

  # describe '#current_player' do
  #   context 'when the turn count is odd' do
  #     let(:game) { ConnectFour.new }

  #     before do
  #       game.instance_variable_set(:@board, [ 
  #         " ", " ", " ", " ", " ", " ", " ", # Row 1 
  #         " ", " ", " ", " ", " ", " ", " ", # Row 2 
  #         "X", " ", " ", " ", " ", " ", " ", # Row 3 
  #         "X", "O", " ", " ", " ", " ", " ", # Row 4 
  #         "X", "O", " ", " ", " ", " ", " ", # Row 5 
  #         "X", "O", " ", " ", " ", " ", " "  # Row 6 
  #         ])
  #     end

  #     it 'returns player "O" is the current player' do
  #       expect(game.current_player).to eq("O")
  #     end
  #   end
  # end

  describe '#game_over' do
    context 'when any win condition is met' do
      let(:game) { ConnectFour.new }

      before do
        game.instance_variable_set(:@board, [ 
          " ", " ", " ", " ", " ", " ", " ", # Row 1 
          " ", " ", " ", " ", " ", " ", " ", # Row 2 
          " ", " ", " ", "X", " ", " ", " ", # Row 3 
          " ", "O", "X", "O", " ", " ", " ", # Row 4 
          " ", "X", "O", "X", " ", " ", " ", # Row 5 
          "X", "O", "X", "O", " ", " ", " "  # Row 6 
          ])
      end

      it 'returns true and puts "Congratulations! Token X wins!"' do
        expect(game.game_over?("X")).to eq(true)
      end
    end
  end

  describe 'No winning scenarios' do
    context 'when there is no 4-in-a-row' do
      let(:game) { ConnectFour.new }

      before do
        game.instance_variable_set(:@board, [ 
          " ", " ", " ", " ", " ", " ", " ", # Row 1 
          " ", " ", " ", " ", " ", " ", " ", # Row 2 
          " ", " ", " ", " ", " ", " ", " ", # Row 3 
          "X", "O", " ", " ", " ", " ", " ", # Row 4 
          "X", "O", " ", " ", " ", " ", " ", # Row 5 
          "X", "O", " ", " ", " ", " ", " "  # Row 6 
          ])
      end

      it 'diagonal_win? returns false' do
        expect(game.vertical_win?("X")).to eq(false)
      end

      it 'horizontal_win? returns false' do
        expect(game.vertical_win?("X")).to eq(false)
      end

      it 'vertical_win? returns false' do
        expect(game.vertical_win?("X")).to eq(false)
      end

    end
  end
end