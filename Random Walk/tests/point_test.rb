require 'test/unit'
require_relative '../point.rb'

class PointTest < Test::Unit::TestCase
  def setup
    @point = Point.new
  end

  def test_initialize
    assert_equal(0, @point.x, 'x should be 0')
    assert_equal(0, @point.y, 'y should be 0')
  end

  def test_move
    20.times do
      assert_respond_to(@point, :move, 'Point object does not respond to move method')
    end
  end

end