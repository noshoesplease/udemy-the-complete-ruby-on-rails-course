class RegistrationsController < Devise::RegistrationsController
  def new
    build_resource({})
    resource.teams.build # This adds a blank Team instance for the form
    respond_with resource
  end

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, teams_attributes: [ :name, :plan ])
  end
end
