require_relative '../lib/table'

RSpec.describe Table, '#initialize' do  
  context 'when new table is created' do 
    it 'should have rows, columns, and directions' do
      # ARRANGE
      columns = 6
      rows = 6
      directions = ['N', 'E', 'S', 'W']

      # ACT
      table = Table.new(columns, rows)

      # ASSERT
      expect(table.columns).to eq(columns)
      expect(table.rows).to eq(rows)
      expect(table.directions).to eq(directions)
    end
  end
end

RSpec.describe Table, '#integer?' do  
  context 'when given a letter' do 
    it 'should return false' do
      # ARRANGE
      table = Table.new(6, 6)
      input = 'x'

      # ACT
      result = table.integer?(input)

      # ASSERT
      expect(result).to eq(false)
    end
  end
  
  context 'when given a number' do 
    it 'should return integer' do
      # ARRANGE
      table = Table.new(6, 6)
      input = '7'

      # ACT
      result = table.integer?(input)

      # ASSERT
      expect(result).to eq(input.to_i)
    end
  end
end

RSpec.describe Table, '#valid_column?' do  
  context 'when given a column inbounds' do 
    it 'should return true' do
      # ARRANGE
      table = Table.new(6, 6)
      input = '3'

      # ACT
      result = table.valid_column?(input)

      # ASSERT
      expect(result).to eq(true)
    end
  end
  context 'when given out of bounds column' do 
    it 'should return false' do
      # ARRANGE
      table = Table.new(6, 6)
      input = '7'

      # ACT
      result = table.valid_column?(input)

      # ASSERT
      expect(result).to eq(false)
    end
  end
end

RSpec.describe Table, '#valid_direction?' do  
  context 'when given N for North' do 
    it 'should return true' do
      # ARRANGE
      table = Table.new(6, 6)
      input = 'N'

      # ACT
      result = table.valid_direction?(input)

      # ASSERT
      expect(result).to eq(true)
    end
  end
  context 'when given NW for North West' do 
    it 'should return false' do
      # ARRANGE
      table = Table.new(6, 6)
      input = 'NW'

      # ACT
      result = table.valid_direction?(input)

      # ASSERT
      expect(result).to eq(false)
    end
  end
end

RSpec.describe Table, '#valid_place?' do  
  context 'when given valid column and direction but not row' do 
    it 'should return false' do
      # ARRANGE
      table = Table.new(6, 6)
      column = '3'
      row = '7'
      direction = 'N'

      # ACT
      result = table.valid_place?(column, row, direction)

      # ASSERT
      expect(result).to eq(false)
    end
  end

  context 'when given valid column and row but not direction' do 
    it 'should return false' do
      # ARRANGE
      table = Table.new(6, 6)
      column = '3'
      row = '5'
      direction = 'NE'

      # ACT
      result = table.valid_place?(column, row, direction)

      # ASSERT
      expect(result).to eq(false)
    end
  end

  context 'when given valid column and row and direction' do 
    it 'should return true' do
      # ARRANGE
      table = Table.new(6, 6)
      column = '3'
      row = '5'
      direction = 'E'

      # ACT
      result = table.valid_place?(column, row, direction)

      # ASSERT
      expect(result).to eq(true)
    end
  end
end
