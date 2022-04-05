# This represents the table and provides methods to the robot to access if certain actions are possible
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

