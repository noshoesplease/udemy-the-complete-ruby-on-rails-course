class MembershipsController < ApplicationController
  before_action :set_current_team
  def index
    @memberships = @current_team.memberships
  end

  def invite
    email = params[:email]
    return redirect_to team_memberships_path(@current_team), alert: "Email is required." if email.blank?

    user = User.find_by(email:) || User.invite!({ email: }, current_user)
    return redirect_to team_memberships_path(@current_team), alert: "Email is invalid." unless user.valid?

    user.memberships.find_or_create_by(team: @current_team, roles: { admin: false, editor: true })
    redirect_to team_memberships_path(@current_team), notice: "#{email} was successfully invited."
  end

  private
  def set_current_team
    @current_team = Team.find(params[:team_id])
  end
end
