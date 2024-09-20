class UsersController < ApplicationController
  def new
    # used in the template if there are errors
    @user = User.new
  end
end
