class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @tracked_stocks = @user.stocks
  end

  def my_portfolio
    @user = current_user
    @tracked_stocks = current_user.stocks
  end

  def my_friends
    @friends = current_user.friends
  end

  def friend_search
    @friends = User.search(params[:friend])
    @friends = current_user.except_current_user(@friends) if @friends.present?

    if @friends.present?
      respond_to do |format|
        format.html { render partial: "users/friend_search", locals: { friends: @friends } }
      end
    else
      respond_to do |format|
        flash.now[:alert] = "Couldn't find user"
        format.html { render partial: "users/friend_search", locals: { friends: nil } }
      end
    end
  end
end
