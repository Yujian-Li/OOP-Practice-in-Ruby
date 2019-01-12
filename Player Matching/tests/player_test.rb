require 'test/unit'
require_relative '../player.rb'

class PlayerTest < Test::Unit::TestCase
  def setup
    @player = Player.new("Bob",2,3)
  end

  def test_initialize
    assert_equal("Bob",@player.name,'initialize fail to set name correctly')
    assert_equal(2,@player.proficiency,'initialize fail to set proficiency correctly')
    assert_equal(3,@player.desired_pro,'initialize fail to set desired_proficiency correctly')
  end
end