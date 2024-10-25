
# RegistrationsController inherits from Devise::RegistrationsController and handles user registration.
# It overrides the create action to include payment processing during user sign-up.
#
# Methods:
# - create: Handles user registration and payment processing.
# - configure_permitted_parameters: Permits additional parameters for user sign-up.
#
# create:
# - Builds the resource (user) with sign_up_params.
# - Saves the resource within a transaction.
# - If the resource is persisted, it creates a Payment object with the user's email, payment token, and user ID.
# - Validates the Payment object and processes the payment.
# - If payment processing fails, it destroys the resource and renders the new registration form with an error message.
# - If the resource is active for authentication, it sets a flash message, signs in the user, and redirects to the appropriate path.
# - If the resource is not active for authentication, it sets a flash message and redirects to the appropriate path for inactive sign-ups.
# - If the resource is not persisted, it cleans up passwords, sets the minimum password length, and responds with the resource.
#
# configure_permitted_parameters:
# - Permits the :payment parameter during user sign-up.
class RegistrationsController < Devise::RegistrationsController
  def create
    build_resource(sign_up_params)

    # debugger

    resource.class.transaction do
      resource.save
      yield resource if block_given?

      # debugger

      if resource.persisted?
        @payment = Payment.new({
          email: params[:user][:email],
          token: params[:payment][:token],
          user_id: resource.id
        })

        unless @payment.valid?
          flash[:error] = "Please check registration errors"
          render :new and return
        end

        begin
          @payment.process_payment
          @payment.save
        rescue StandardError => e
          flash[:error] = e.message
          resource.destroy
          puts "Payment failed"
          render :new and return
        end

        if resource.active_for_authentication?
          set_flash_message!(:notice, :signed_up)
          sign_up(resource_name, resource)
          respond_with resource, location: after_sign_up_path_for(resource)
        else
          set_flash_message!(:notice, :"signed_up_but_#{resource.inactive_message}")
          expire_data_after_sign_in!
          respond_with resource, location: after_inactive_sign_up_path_for(resource)
        end
      else
        clean_up_passwords resource
        set_minimum_password_length
        respond_with resource
      end
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :payment ])
  end
end
