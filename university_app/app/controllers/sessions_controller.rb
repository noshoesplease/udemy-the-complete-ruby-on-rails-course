class SessionsController < ApplicationController
  def new
  end

  def create
    student = Student.find_by email: params[:session][:email].downcase
    if student and student.authenticate(params[:session][:password])
      session[:student_id] = student.id
      flash[:notice] = "You have successfully logged in"
      redirect_to student
    else
      flash.now[:alert] = "There was something wrong with your login information"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:student_id] = nil
    flash[:notice] = "Logged out"
    redirect_to root_path
  end
end
