require_relative 'player.rb'
require_relative 'agency.rb'

@agency = Agency.new

#Part 1
puts "Part 1"
puts 'MALE Players'
begin
  IO.foreach('men.txt') do |line|
    men_data = line.split
    name = men_data[0]
    proficiency = men_data[1].to_i
    desired_proficiency = men_data[2].to_i
    player = Player.new(name, proficiency, desired_proficiency)
    @agency.add_male_player(player)
    puts name + ',proficiency: '+ proficiency.to_s + ' seeks proficiency >= '+ desired_proficiency.to_s + '.'
  end
end rescue abort('error reading men.txt')

puts "\n"
puts 'FEMALE Players'
begin
  IO.foreach('women.txt') do |line|
    women_data = line.split
    name = women_data[0]
    proficiency = women_data[1].to_i
    desired_proficiency = women_data[2].to_i
    player = Player.new(name, proficiency, desired_proficiency)
    @agency.add_female_player(player)
    puts name + ',proficiency: '+ proficiency.to_s + ' seeks proficiency >= '+ desired_proficiency.to_s + '.'
  end
end rescue abort('error reading women.txt')

#Part 2
puts "\nPart 2"
sorted_male = @agency.sort_players(@agency.male_players)
sorted_female = @agency.sort_players(@agency.female_players)
team = @agency.create_teams(sorted_male,sorted_female)
@agency.team_to_s(team)

#Part 3
puts "\nPart 3 Elite Players"
@agency.each_player(@agency.male_players) do |player|
  if player.proficiency > 9
    puts player.name
  end
end
@agency.each_player(@agency.female_players) do |player|
  if player.proficiency > 9
    puts player.name
  end
end

#Part 4
puts "\nPart 4"
before_fitness = @agency.fitness
@agency.swap(sorted_male,sorted_female,before_fitness)
@agency.first_ascent(sorted_male,sorted_female,before_fitness)
