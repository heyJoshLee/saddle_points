class Matrix

  attr_accessor :rows, :columns

  def initialize(string)
    @rows = []
    temp = string.split("\n").each do |string|
      temp = []
      string.split(" ").each do |char|
          temp << char.to_i unless char == " " 
      end
      @rows << temp
    end
    make_columns
  end


  def saddle_points 
    output = []
    
    @rows.each_with_index do |row, x|
      row.each_with_index do |el, y|
        if el == row.max
          output << [x, y] if @columns[y].min == el
        end
      end
    end
    output
  end


  private

  def make_columns
    @columns = []

    @rows[0].length.times do |i|
      temp = []
      @rows.each { |row| temp << row[i] }
      @columns << temp
    end
  end

end

