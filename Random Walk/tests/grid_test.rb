require 'test/unit'
require_relative '../grid.rb'

class GridTest < Test::Unit::TestCase
  def setup
    @grid = Grid.new(5)
  end

  def test_initialize
    assert_equal(4, @grid.home_coordinate, 'Home coordinate should be 4')
  end
end