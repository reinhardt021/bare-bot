require './table'
require './robot'

# This class represents the interaction between the user inputs and the robot on the table
class Game
  def initialize
    @prompt = 'Welcome to BareBot!
    Please provide one of the valid commands to move the robot on the 6x6 square grid:
    PLACE X, Y, O (X-coordinate, Y-coordinate, Compass Orientation)
    MOVE
    LEFT
    RIGHT
    REPORT'
    @table = Table.new(6, 6)
    @robot = Robot.new(@table)
  end

  def play
    puts @prompt

    play = true
    while play
      user_input = gets.strip
      break if user_input == 'exit'

      command = user_input.split(' ')
      if command.first == 'PLACE' && command.count == 4
        x_value = command[1].split(//).first
        y_value = command[2].split(//).first
        direction = command[3]

        @robot.place(x_value, y_value, direction)
      end

      next unless @robot.ready?

      @robot.move if user_input == 'MOVE'
      @robot.left if user_input == 'LEFT'
      @robot.right if user_input == 'RIGHT'
      @robot.report if user_input == 'REPORT'
    end
  end
end
