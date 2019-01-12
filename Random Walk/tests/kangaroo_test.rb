require 'test/unit'
require_relative '../kangaroo.rb'

class KangarooTest < Test::Unit::TestCase
  def setup
    @kangaroo = Kangaroo.new("skippy", 3)
  end

  def test_initialize
    assert_instance_of(Grid, @kangaroo.my_grid, 'fail to new a grid object')
    assert_instance_of(Point, @kangaroo.my_point, 'fail to new a point object')
    assert_instance_of(Die, @kangaroo.my_die, 'fail to new a die object')
  end
end