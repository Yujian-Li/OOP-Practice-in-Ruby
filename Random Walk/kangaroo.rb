require_relative 'die.rb'
require_relative 'point.rb'
require_relative 'grid.rb'

class Kangaroo
  attr_reader :my_grid, :my_point, :my_die

  def initialize(name,dimension)
    @name = name
    @my_grid = Grid.new(dimension)
    @my_point = Point.new
    @my_die = Die.new
  end
end