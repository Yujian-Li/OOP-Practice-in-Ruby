require_relative 'kangaroo.rb'
##Counting attempts to hop over the border as valid hops.
##Checking home not as a point comparison (using ==) but member comparison one-by-one.
##Creating an instance variable even though the variable was only used in the current method and a local variable would suffice.

class Main
  puts "Enter dimension of the Grid (>=1):"
  @dimension = gets.to_i
  while @dimension < 1
    puts "Please check your enter..."
    @dimension = gets.to_i
  end

  #use hops to track the total number of hops

  @hops = 0
  your_kangaroo = Kangaroo.new("skippy",@dimension)

  while your_kangaroo.my_point.x != your_kangaroo.my_grid.home_coordinate || your_kangaroo.my_point.y != your_kangaroo.my_grid.home_coordinate
    your_kangaroo.my_point.move(your_kangaroo.my_grid.home_coordinate)
    your_kangaroo.my_die.track_throws(your_kangaroo.my_point.coordinate_change)
    @hops += 1
  end

  puts "Finished in #{@hops}!\n\n"
  puts "Die Statistics:"
  puts "Total throws: #{your_kangaroo.my_die.total_throws}"
  puts "North: #{your_kangaroo.my_die.north_throws}% South: #{your_kangaroo.my_die.south_throws}% \
East: #{your_kangaroo.my_die.east_throws}% West: #{your_kangaroo.my_die.west_throws}%"
end

