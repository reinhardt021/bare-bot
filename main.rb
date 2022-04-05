class Table
  attr_reader :directions

  def initialize(columns, rows)
    @columns = columns
    @rows = rows
    @directions = ['N', 'E', 'S', 'W']
  end

  def integer?(input)
    Integer(input) rescue false
  end

  def valid_column?(column)
    return false unless integer?(column)

    column = column.to_i
    (0 <= column && column < @columns)
  end

  def valid_row?(row)
    return false unless integer?(row)

    row = row.to_i
    (0 <= row && row < @rows)
  end

  def valid_direction?(direction)
    @directions.include?(direction)
  end

  def valid_place?(column, row, direction)
    valid_column?(column) && valid_row?(row) && valid_direction?(direction)
  end
end

class Robot
  def initialize(table)
    @table = table
  end

  def place(column, row, direction)
    return false unless @table.valid_place?(column, row, direction)

    @x_position = column
    @y_position = row
    @orientation = direction

    true
  end

  def ready?
    @x_position && @y_position && @orientation
  end

  def move
    x_value = @x_position.to_i
    y_value = @y_position.to_i
    direction = @orientation
    y_value += 1 if direction == 'N'
    x_value += 1 if direction == 'E'
    y_value -= 1 if direction == 'S'
    x_value -= 1 if direction == 'W'

    # checks done in place method
    place(x_value.to_s, y_value.to_s, direction)
  end

  def left
    # turn 90 degrees counter clockwise
    curr_index = @table.directions.find_index(@orientation)
    if curr_index.zero?
      curr_index = @table.directions.count - 1
    else
      curr_index -= 1
    end

    @orientation = @table.directions[curr_index]
  end

  def right
    # turn 90 degrees clockwise
    curr_index = @table.directions.find_index(@orientation)
    if curr_index == (@table.directions.count - 1)
      curr_index = 0
    else
      curr_index += 1
    end

    @orientation = @table.directions[curr_index]
  end

  def report
    puts "Robot is at column: #{@x_position} and row: #{@y_position}, facing: #{@orientation}"
  end
end

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

game = Game.new
game.play
