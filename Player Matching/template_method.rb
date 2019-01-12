class TemplateMethod
  def steepest_ascent_hill_climb(start_state,goal_state)
    current_state = start_state
    while have_neighbor?
      if distance(current_state, goal_state) > distance(neighbor, goal_state)
        current_state = neighbor
      end
    end

    if current_state == start_state
      current_state
    else
      steepest_ascent_hill_climb(current_state,goal_state)
    end
  end
end
