class Player
  attr_reader :name, :proficiency, :desired_pro
  def initialize (name, proficiency, desired_proficiency)
    @name = name
    @proficiency = proficiency
    @desired_pro = desired_proficiency
  end

  def to_s
    puts @name + @proficiency.to_s + desired_pro.to_s
  end
end