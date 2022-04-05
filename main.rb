puts "Welcome to BareBot"

# robot should be prevented from exceeding limits of the grid
# otherwise allowed to move freely (no obstructions)

# The PLACE X, Y, O will place the robot at position X, Y on the grid, with orientation O. Orientation are N, E, S, W (for North, East, South and West). Position (0,0) on the grid is the south west corner. First coordinate is along the East/West axis, the second coordinate is along the North/South axis.

# MOVE will move the robot one step forward, in whichever direction it is currently facing


# LEFT and RIGHT respectfully 
# turn the robot 90° angle to the left or to the right.

# REPORT announces the position and orientation of the robot 
# (X, Y, O) in any format (such as standard out)


# CONSTRAINTS:
# Commands are to be ignored until a valid PLACE command is issued

# Any commands that would put the robot out of the defined grid is to be ignored, 
# all other commands (including another PLACE) are to be obeyed
