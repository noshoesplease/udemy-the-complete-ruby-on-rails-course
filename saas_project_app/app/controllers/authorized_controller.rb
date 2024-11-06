class AuthorizedController < ApplicationController
  before_action :set_current_team

  before_action :authorize_member

  private
  def set_current_team
    @current_team = Team.find(params[:team_id])
  end

  def authorize_member
    redirect_to teams_path, alert: "You are not a member" unless @current_team.users.include? current_user
  end
end
