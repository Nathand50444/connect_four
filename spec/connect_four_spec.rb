# instructions -> https://www.theodinproject.com/lessons/ruby-connect-four#project-tdd-connect-four

require_relative '../lib/connect_four'

describe ConnectFour do
  describe '#valid_move?' do
    it 'returns true for an empty spot' do
      game = ConnectFour.new
      expect(game.valid_move?(0)).to eq(true)
    end

    it 'returns false for a taken spot' do
      game = ConnectFour.new
      game.move("ADD MOVE HERE")
      expect(game.valid_move?(0)).to eq(false)
    end
  end

  describe 'turn_count' do
    it 'returns the number turns performed' do
      game = ConnectFour.new

      before do
        game.instance_variable_set(:@board, [" ", " ", " "] ) #42 spaces?
      end

      expect(game.turn_count).to eq(0)
    end
  end
end