class RegistrationsController < Devise::RegistrationsController
  def create
    team_params = params[:user].delete(:team)

    # Manually handle user creation
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      # Create team and membership manually
      team = Team.create(name: team_params[:name], plan: team_params[:plan])
      Membership.create(user: resource, team: team, roles: { admin: true })

      # Instead of signing in the user, redirect to a welcome or setup page
      flash[:notice] = "Registration successful! Please log in."
      redirect_to new_user_session_path
    else
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
