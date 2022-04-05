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
