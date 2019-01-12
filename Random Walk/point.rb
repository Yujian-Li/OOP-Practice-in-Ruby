class Point
  attr_reader :x
  attr_reader :y
  attr_reader :coordinate_change

  def initialize
    @x = 0
    @y = 0
  end

  #Pick random direction and call corresponding private method to move
  def move(home_coordinate)
    @coordinate_change = rand(4)

    if @coordinate_change == 0
      move_north(home_coordinate)

    elsif @coordinate_change == 1
      move_south

    elsif @coordinate_change == 2
      move_east(home_coordinate)

    else
      move_west
    end
  end

  private
  def move_north(home_coordinate)
    if @x + 1 <= home_coordinate
      @x += 1
      puts "Hopped to: (#{@x}, #{@y})"
    else
      puts "Oops, hit the boundary: (#{@x+1}, #{@y})"
    end
  end

  def move_south
    if @x - 1 >= 0
      @x -= 1
      puts "Hopped to: (#{@x},#{@y})"
    else
      puts "Oops, hit the boundary: (#{@x-1}, #{@y})"
    end
  end

  def move_east(home_coordinate)
    if @y + 1 <= home_coordinate
      @y += 1
      puts "Hopped to: (#{@x}, #{@y})"
    else
      puts "Oops, hit the boundary: (#{@x}, #{@y+1})"
    end
  end

  def move_west
    if @y - 1 >= 0
      @y -= 1
      puts "Hopped to: (#{@x},#{@y})"
    else
      puts "Oops, hit the boundary: (#{@x}, #{@y-1})"
    end
  end
end
