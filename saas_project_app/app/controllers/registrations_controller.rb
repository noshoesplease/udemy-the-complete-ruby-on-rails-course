class RegistrationsController < Devise::RegistrationsController
  def create
    # Extract team information from the main params hash before calling `super`
    team_params = params[:user].delete(:team)

    super do |user|
      if user.persisted?
        # Create the team with the provided data
        team = Team.create(name: team_params[:name], plan: team_params[:plan])

        # Create the membership linking the user and team with admin role
        Membership.create(user: user, team: team, roles: { admin: true })
      end
    end
  end

  private

  def sign_up_params
    # Only permit standard user fields
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
