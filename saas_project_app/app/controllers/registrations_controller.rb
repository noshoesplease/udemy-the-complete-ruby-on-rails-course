class RegistrationsController < Devise::RegistrationsController
  def create
    team_params = params[:user].delete(:team)

    # Start a database transaction to ensure consistency
    ActiveRecord::Base.transaction do
      # Manually handle user creation
      build_resource(sign_up_params)

      if resource.save
        # Create team and membership manually, and validate successful creation
        team = Team.create!(name: team_params[:name], plan: team_params[:plan])
        Membership.create!(user: resource, team: team, roles: { admin: true })

        # Redirect to login page with a flash notice
        flash[:notice] = "Registration successful! Please log in."
        redirect_to new_user_session_path and return
      else
        # Rollback transaction if resource cannot be saved
        raise ActiveRecord::Rollback
      end
    rescue ActiveRecord::RecordInvalid => e
      # Handle validation errors for team or membership creation
      flash.now[:alert] = "Registration failed: #{e.message}"
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
