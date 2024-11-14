class KanbanController < ApplicationController
  before_action :set_team

  # GET /kanban
  def index
    @projects = @team.projects.group_by(&:status)
  end

  # PATCH /kanban/update_status
  def update_status
    @project = Project.find(params[:id])

    if @project.update(status: params[:status])
      render json: { success: true }
    else
      render json: { success: false, errors: @project.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_team
    @team = Team.find(params[:team_id])
  end
end
