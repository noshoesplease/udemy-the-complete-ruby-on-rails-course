module ApplicationHelper
  def team_name(team_id)
    team = Team.find(team_id)
    team.name
  end
end
