class WelcomeController < ApplicationController
  # Skip the before_action :authenticate_user! to allow access to the welcome page without authentication.
  skip_before_action :authenticate_user!, only: [ :index ]
  def index
  end
end
