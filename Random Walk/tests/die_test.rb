require 'test/unit'
require_relative '../die.rb'

class DieTest < Test::Unit::TestCase
  def setup
    @die = Die.new
  end

  def test_initialize
    assert_equal({"North" => 0, "South" => 0, "East" => 0, "West" => 0}, @die.sides, 'class die does not initialized properly')
  end

  def test_track_throws
    5.times do
      @die.track_throws(0)
    end
    assert_equal(5, @die.sides["North"], 'north throws should be 5')

    6.times do
      @die.track_throws(1)
    end
    assert_equal(6, @die.sides["South"], 'south throws should be 6')

    7.times do
      @die.track_throws(2)
    end
    assert_equal(7, @die.sides["East"], 'east throws should be 7')

    8.times do
      @die.track_throws(3)
    end
    assert_equal(8, @die.sides["West"], 'west throws should be 8')
  end

  def test_throws_calculation
    5.times do
      @die.track_throws(0)
    end

    6.times do
      @die.track_throws(1)
    end

    7.times do
      @die.track_throws(2)
    end

    8.times do
      @die.track_throws(3)
    end

    assert_equal(26, @die.total_throws, 'total throw should be 26')
    assert_equal((5.to_f / 26 * 100).round(1), @die.north_throws, 'north throws should be 19.2%')
    assert_equal((6.to_f / 26 * 100).round(1), @die.south_throws, 'south throws should be 23.1%')
    assert_equal((7.to_f / 26 * 100).round(1), @die.east_throws, 'east throws should be 26.9%')
    assert_equal((8.to_f / 26 * 100).round(1), @die.west_throws, 'west throws should be 30.8%')
  end
end