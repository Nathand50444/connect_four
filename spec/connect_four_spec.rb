# instructions -> https://www.theodinproject.com/lessons/ruby-connect-four#project-tdd-connect-four

require_relative '../lib/connect_four'

describe ConnectFour do
  # describe '#valid_move?' do
  #  it 'returns true for an empty spot' do
  #    game = ConnectFour.new
  #    expect(game.valid_move?(0)).to eq(true)
  #  end

   # it 'returns false for a taken spot' do
   #   game = ConnectFour.new
   #   game.move("ADD MOVE HERE")
   #   expect(game.valid_move?(0)).to eq(false)
   # end
  # end

  describe '#input_to_index' do
    it 'returns the index - 1' do
      game = ConnectFour.new

      expect(game.input_to_index(4)).to eq(3)
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

  # describe '#game_over?' do
  # context 'when four X values are in a row horizontally' do
  #   let(:game) { ConnectFour.new }

  #   before do
  #     game.instance_variable_set(:@board, [ 
  #       " ", " ", " ", " ", " ", " ", " ", # Row 1 
  #       " ", " ", " ", " ", " ", " ", " ", # Row 2 
  #       " ", " ", " ", " ", " ", " ", " ", # Row 3 
  #       " ", " ", " ", " ", " ", " ", " ", # Row 4 
  #       "O", "O", "O", " ", " ", " ", " ", # Row 5 
  #       "X", "X", "X", "X", " ", " ", " "  # Row 6 
  #       ])
  #   end

  #   it 'returns true and outputs "Player X wins!"' do
  #     expect { game.game_over? }.to output("Player X wins!\n").to_stdout
  #     expect(game.game_over?).to eq(true)
  #   end
  # end
  # end

  # describe '#game_over?' do
  # context 'when four X values are in a row vertically' do
  #   let(:game) { ConnectFour.new }

  #   before do
  #     game.instance_variable_set(:@board, [ 
  #       " ", " ", " ", " ", " ", " ", " ", # Row 1 
  #       " ", " ", " ", " ", " ", " ", " ", # Row 2 
  #       "X", " ", " ", " ", " ", " ", " ", # Row 3 
  #       "X", "O", " ", " ", " ", " ", " ", # Row 4 
  #       "X", "O", " ", " ", " ", " ", " ", # Row 5 
  #       "X", "O", " ", " ", " ", " ", " "  # Row 6 
  #       ])
  #   end

  #   it 'returns true and outputs "Player X wins!"' do
  #     expect { game.game_over? }.to output("Player X wins!\n").to_stdout
  #     expect(game.game_over?).to eq(true)
  #   end
  # end
  # end

 # describe '#game_over?' do
 #   context 'when four X values are in a row' do
 #     let(:game) { ConnectFour.new }

 #     before do
 #       game.instance_variable_set(:@board, [ 
 #         " ", " ", " ", " ", " ", " ", " ", # Row 1 
 #         " ", " ", " ", " ", " ", " ", " ", # Row 2 
 #         " ", " ", " ", "X", " ", " ", " ", # Row 3 
 #         " ", "O", "X", "O", " ", " ", " ", # Row 4 
 #         " ", "X", "O", "X", " ", " ", " ", # Row 5 
 #         "X", "O", "X", "O", " ", " ", " "  # Row 6 
 #         ])
 #     end

 #     it 'returns true and outputs "Player X wins!"' do
 #      expect { game.game_over? }.to output("Player X wins!\n").to_stdout
 #       expect(game.game_over?).to eq(true)
 #     end
 #   end
 # end

  describe '#current_player' do
    context 'when the turn count is odd' do
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

      it 'returns player "O" is the current player' do
        expect(game.current_player).to eq("O")
      end
    end
  end
end