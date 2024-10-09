class UsersController < ApplicationController
  def my_portfolio
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
