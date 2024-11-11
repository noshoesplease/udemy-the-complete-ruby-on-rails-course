class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]
  def index
    if current_user
      @projects = current_user.teams.includes(:projects).map(&:projects).flatten
    end
  end
end
