class Agency
  attr_reader :male_players,:female_players

  def initialize
    @male_players = []
    @female_players = []
  end
  
  def add_male_player(player)
    @male_players << player
  end
  
  def add_female_player(player)
    @female_players << player
  end

  def no_of_teams
    @male_players.length
  end

  def sort_players(players_list)
    1.upto(players_list.length - 1) do |i|
      current_player = players_list[i]
      value = players_list[i].proficiency
      j = i - 1
      while j >= 0 and players_list[j].proficiency < value
        players_list[j+1] = players_list[j]
        j -= 1
      end
      players_list[j+1] = current_player
    end
    players_list
  end

  def player_satisfaction(player,partner)
    if player.desired_pro <= partner.proficiency
      p_satisfaction = 0
    else
      p_satisfaction = partner.proficiency - player.desired_pro
    end
    p_satisfaction
  end

  def team_satisfaction(male_player,female_player)
    t_satisfaction = 0.5 * (player_satisfaction(male_player,female_player) + player_satisfaction(female_player,male_player))
    t_satisfaction
  end

  def create_teams(male_players,female_players)
    @teams = {}
    i = 0
    no_of_teams.times do
      team = [male_players[i],female_players[i]]
      satisfaction = team_satisfaction(male_players[i],female_players[i])
      @teams[team] = satisfaction
      i += 1
    end
    @teams
  end

  def team_to_s(teams)
    teams.each do |team,t_sati|
       puts '('+ team[0].name + ',' + team[1].name + ')' + " Satisfaction: " + t_sati.to_s
    end
  end

  def each_player(player_list)
    player_list.each do |player|
      yield player
    end
  end

  def fitness
    @fitness = 0
    @teams.each do |team,t_sati|
      @fitness += t_sati
    end
    @fitness
  end

  def swap(male_players,female_players,before_fitness,i=0)
    @male_players = male_players
    current_fitness = before_fitness

    #swap and apply the best
    while i < @male_players.length
      i.upto(@male_players.length - 2) do|j|
        tmp = @male_players[i]
        @male_players[i] = @male_players[j+1]
        @male_players[j+1] = tmp
        teams = create_teams(@male_players,female_players)

        if fitness > current_fitness
          @current_teams = teams
          current_fitness = fitness
          @x,@y = i, j+1
        end

        tmp = @male_players[i]
        @male_players[i] = @male_players[j+1]
        @male_players[j+1] = tmp
      end

      i += 1
    end

    #Keep swapping until current_fitness does not change
    if current_fitness == before_fitness
        team_to_s(@current_teams)
    else
      before_fitness = current_fitness
      tmp = @male_players[@x]
      @male_players[@x] = @male_players[@y]
      @male_players[@y] = tmp
      swap(@male_players,female_players,before_fitness,i=0)
    end
  end

  def first_ascent(male_players,female_players,before_fitness,i=0)
    current_fitness = before_fitness

    while i < male_players.length
      i.upto(male_players.length - 2) do|j|
        tmp = male_players[i]
        male_players[i] = male_players[j+1]
        male_players[j+1] = tmp
        teams = create_teams(male_players,female_players)

        if fitness > current_fitness
          @current_teams = teams
          @current_fitness = fitness
          @male_players = male_players
          break
        else
          tmp = male_players[i]
          male_players[i] = male_players[j+1]
          male_players[j+1] = tmp
        end
      end
      i += 1
    end
        if @current_fitness == before_fitness
          team_to_s(@current_teams)
        else
          first_ascent(@male_players,female_players,@current_fitness)
        end

  end
end