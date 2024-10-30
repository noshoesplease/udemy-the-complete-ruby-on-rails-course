class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # makes methods available in the views, as well as the controllers
  # so we can remove it from the application_helper.rb
  helper_method :current_user, :logged_in?

  def current_user
    student_id = session[:student_id]
    @current_user ||= Student.find student_id if student_id
  end

  def logged_in?
    !!current_user
  end
end
