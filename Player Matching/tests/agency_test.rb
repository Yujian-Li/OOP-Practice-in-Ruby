require 'test/unit'
require_relative '../agency.rb'
require_relative '../player.rb'

class AgencyTest < Test::Unit::TestCase
  def setup
    @man = Player.new("John",1,2)
    @woman = Player.new("Mary",3,4)
    @agency = Agency.new
  end

  def test_add_male_player
    @agency.add_male_player(@man)
    assert(@agency.male_players[0].name == "John",'fail to add male player')
  end

  def test_add_female_player
    @agency.add_female_player(@woman)
    assert(@agency.female_players[0].proficiency == 3,'fail to add female player')
  end

  def test_player_satisfaction
    p_sati = @agency.player_satisfaction(@man,@woman)
    assert(p_sati == 0,'calculated player satisfaction incorrectly')
  end

  def test_team_satisfaction
    t_sati = @agency.team_satisfaction(@man,@woman)
    assert(t_sati == -1.5,'calculated player satisfaction incorrectly')
  end

  def test_create_team
    @agency.add_male_player(@man)
    @agency.add_female_player(@woman)
    team = @agency.create_teams(@agency.male_players,@agency.female_players)
    assert(team[[@man,@woman]] == -1.5,'failed to create team')
  end

  def test_fitness
    @agency.add_male_player(@man)
    @agency.add_female_player(@woman)
    @agency.create_teams(@agency.male_players,@agency.female_players)
    assert_equal(-1.5,@agency.fitness,'calculated fitness incorrectly')
  end
end