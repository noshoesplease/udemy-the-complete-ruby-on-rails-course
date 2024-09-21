class SessionsController < ApplicationController
  def new
  end

  def create
    email = params[:session][:email]
    password = params[:session][:password]
  end

  def destroy
  end
end
