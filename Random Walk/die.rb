#Die Class includes methods to track the number of throws in each direction and calculate Die Statistics
class Die
  attr_reader :sides

  def initialize
    @sides = {"North" => 0, "South" => 0, "East" => 0, "West" => 0}
  end

  def track_throws(coordinate_change)
    @coordinate_change = coordinate_change

    if @coordinate_change == 0
      @sides["North"] += 1

    elsif @coordinate_change == 1
      @sides["South"] += 1

    elsif @coordinate_change == 2
      @sides["East"] += 1

    else
      @sides["West"] += 1
    end
  end

  def total_throws
    return @total_throws = @sides["North"] + @sides["South"] + @sides["East"] + @sides["West"]
  end

  def north_throws
    return (@sides["North"].to_f / @total_throws * 100).round(1)
  end

  def south_throws
    return (@sides["South"].to_f / @total_throws * 100).round(1)
  end

  def east_throws
    return (@sides["East"].to_f / @total_throws * 100).round(1)
  end

  def west_throws
    return (@sides["West"].to_f / @total_throws * 100).round(1)
  end

end
