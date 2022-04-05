# This represents the robot that is traversing the table according to user inputs
class Robot
  attr_reader :table, :x_position, :y_position, :orientation

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
