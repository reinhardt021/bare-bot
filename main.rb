class Table
  def initialize(columns, rows)
    @columns = columns
    @rows = rows
    @directions = ['N', 'E', 'S', 'W']
  end

  def is_integer?(input)
    return Integer(input) rescue false
  end
  
  def valid_column?(column)
    if !is_integer?(column)
      return false
    end
    column = column.to_i

    return (0 <= column && column < @columns) 
  end
  
  def valid_row?(row)
    if !is_integer?(row)
      return false
    end
    row = row.to_i

    return (0 <= row && row < @rows) 
  end

  def valid_direction?(direction)
    return @directions.include?(direction)
  end

  def valid_place?(column, row, direction)
    return valid_column?(column) && valid_row?(row) && valid_direction?(direction)
  end
end

class Robot
  def initialize(table)
    @table = table
  end

  def place(column, row, direction)
    if !@table.valid_place?(column, row, direction)
      return false
    end
    @x_position = column
    @y_position = row
    @orientation = direction

    return true
  end

  def ready?
    return @x_position && @y_position && @orientation
  end

  def is_facing_table_edge()
  end
  # robot should be prevented from exceeding limits of the grid
  # otherwise allowed to move freely (no obstructions)
  def move
    # check if facing the edge of the table
    # if fine then update coordinates in direction facing
  end

  def left
    # turn 90 degrees counter clockwise
  end

  def right
    # turn 90 degrees clockwise
  end

  def report
    puts "Robot is at column: #{@x_position} and row: #{@y_position}, facing: #{@orientation}"
  end

end

class Game
  def initialize
    @prompt = 'Welcome to BareBot!
    Please provide one of the valid commands to move the robot on the 6x6 square grid:
    PLACE X,Y,O (X-coordinate, Y-coordinate, Compass Orientation)
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

      if user_input == "exit"
        break
      end

      command = user_input.split(" ")
      if command.first == 'PLACE' && command.count == 4
        x_value = command[1].split(//).first
        y_value = command[2].split(//).first
        direction = command[3]

        @robot.place(x_value, y_value, direction)
      end

      if !@robot.ready?
        puts 'Robot is not ready yet. Please provide a valid PLACE'
        next
      end

      puts "Robot is ready"

      if user_input == 'MOVE'
        #@robot.move
      end

      if user_input == 'LEFT'
        #@robot.left
      end

      if user_input == 'RIGHT'
        #@robot.right
      end

      if user_input == 'REPORT'
        @robot.report
      end

    end

  end

end

game = Game.new
game.play



# MOVE will move the robot one step forward,
# in whichever direction it is currently facing


# LEFT and RIGHT respectfully
# turn the robot 90° angle to the left or to the right.


# CONSTRAINTS:
# Commands are to be ignored until a valid PLACE command is issued
# Any commands that would put the robot out of the defined grid is to be ignored,
# all other commands (including another PLACE) are to be obeyed
