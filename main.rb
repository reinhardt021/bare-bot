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
    # check if has x y and orientation set
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
    # if not placed then will ignore
    # print out the x y and orientation
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
      # puts "command: " + command.to_s
      # check that  input has PLACE keyword
      if command.first == 'PLACE' && command.count == 4
        x_value = command[1].split(//).first
        y_value = command[2].split(//).first
        direction = command[3]

        @robot.place(x_value, y_value, direction)
        # input = Integer(x_value) rescue false
        # puts "x: " + input.to_s
        # puts "x class: "+ x_value.class.name
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
        #@robot.report
      end

    end

  end

end

game = Game.new
game.play


# The PLACE X, Y, O
# will place the robot at position X, Y on the grid,
# with orientation O.
# Orientation are N, E, S, W (for North, East, South and West).
# Position (0,0) on the grid is the south west corner.
# First coordinate is along the East/West axis,
# the second coordinate is along the North/South axis.

# MOVE will move the robot one step forward,
# in whichever direction it is currently facing


# LEFT and RIGHT respectfully
# turn the robot 90° angle to the left or to the right.

# REPORT announces the position and orientation of the robot
# (X, Y, O) in any format (such as standard out)


# CONSTRAINTS:
# Commands are to be ignored until a valid PLACE command is issued
# Any commands that would put the robot out of the defined grid is to be ignored,
# all other commands (including another PLACE) are to be obeyed
