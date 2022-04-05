require_relative '../lib/robot'
require_relative '../lib/table'

RSpec.describe Robot, '#initialize' do
  context 'when new robot is created' do
    it 'should have a table' do
      # ARRANGE
      table = Table.new(6, 6)

      # ACT
      robot = Robot.new(table)

      # ASSERT
      expect(robot.table).to be_a Table
    end
  end
end

RSpec.describe Robot, '#place' do
  context 'when robot is placed' do
    it 'should have x, y, and orientation' do
      # ARRANGE
      table = Table.new(6, 6)
      robot = Robot.new(table)
      column = '3'
      row = '4'
      direction = 'E'

      # ACT
      robot.place(column, row, direction)

      # ASSERT
      expect(robot.x_position).to eq(column)
      expect(robot.y_position).to eq(row)
      expect(robot.orientation).to eq(direction)
    end
  end

  context 'when robot is NOT placed correctly' do
    it 'should have NOT x, y, and orientation' do
      # ARRANGE
      table = Table.new(6, 6)
      robot = Robot.new(table)
      column = '3'
      row = '4'
      direction = 'NE'

      # ACT
      robot.place(column, row, direction)

      # ASSERT
      expect(robot.x_position).to eq(nil)
      expect(robot.y_position).to eq(nil)
      expect(robot.orientation).to eq(nil)
    end
  end
end

RSpec.describe Robot, '#left' do
  context 'when robot is placed and turned left' do
    it 'should have updated its orientation' do
      # ARRANGE
      table = Table.new(6, 6)
      robot = Robot.new(table)
      robot.place('3', '4', 'E')

      # ACT
      robot.left

      # ASSERT
      expect(robot.orientation).to eq('N')
    end
  end
end

RSpec.describe Robot, '#move' do
  context 'when robot is placed and not at the edge of the table' do
    it 'should move one space in the direction it is facing' do
      # ARRANGE
      table = Table.new(6, 6)
      robot = Robot.new(table)
      robot.place('3', '4', 'E')

      # ACT
      robot.move

      # ASSERT
      expect(robot.x_position).to eq('4')
    end
  end

  context 'when robot is placed and facing the edge of the table' do
    it 'should NOT move' do
      # ARRANGE
      table = Table.new(6, 6)
      robot = Robot.new(table)
      robot.place('3', '5', 'N')

      # ACT
      robot.move

      # ASSERT
      expect(robot.y_position).to eq('5')
    end
  end
end
