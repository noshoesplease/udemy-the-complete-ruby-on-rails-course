class MembershipsController < ApplicationController
  before_action :set_current_team
  def index
    @memberships = @current_team.memberships
  end

  private
  def set_current_team
    @current_team = Team.find(params[:team_id])
  end
end
