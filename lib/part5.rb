class CartesianProduct
  include Enumerable

  def initialize(x_array, y_array)
    @x_array = x_array
    @y_array = y_array
  end
  
  def each
    return to_enum unless block_given?
    @x_array.each do |x| 
      @y_array.each { |y| yield [x, y] }
    end
  end

end
