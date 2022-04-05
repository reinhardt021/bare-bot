require_relative '../lib/robot'
require_relative '../lib/table'

RSpec.describe Robot, '#initialize' do
  context 'when new robot is created' do
    it 'should have a table' do
      # ARRANGE
      table = Table.new(6,6)

      # ACT
      robot = Robot.new(table)

      # ASSERT
      expect(robot.table).to be_a Table
    end
  end
end
