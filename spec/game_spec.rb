require_relative '../lib/game'
require_relative '../lib/table'
require_relative '../lib/robot'

RSpec.describe Game, '#initialize' do
  context 'when new game is created' do
    it 'should have a new table and robot are added' do
      # ARRANGE
      # ACT
      game = Game.new

      # ASSERT
      expect(game.table).to be_a Table
      expect(game.robot).to be_a Robot
    end
  end
end
