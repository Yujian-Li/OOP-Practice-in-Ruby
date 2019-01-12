class Grid
  attr_reader :home_coordinate

  def initialize(dimension)
    @dimension = dimension
    @home_coordinate = @dimension - 1
  end

end