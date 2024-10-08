class UsersController < ApplicationController
  def my_portfolio
    @tracked_stocks = current_user.stocks
  end

  def my_friends
    @friends = current_user.friends
  end

  def friend_search
    # render json: params[:friend]
    # @friends = User.search(params[:friend])

    # debugger
    # respond_to do |format|
    #   format.html { render partial: "users/friend_search", locals: { friends: @friends } }
    #   format.turbo_stream # For turbo frame requests
    # end
    #
    #
    # @friend = User.search(params[:friend])

    @friend = params[:friend]
    if @friend.present? or !@friend.empty?
      respond_to do |format|
        format.html { render partial: "users/friend_search", locals: { friend: @friend } }
      end
    else
      respond_to do |format|
        flash.now[:alert] = "Couldn't find user"
        format.html { render partial: "users/friend_search", locals: { friend: nil } }
      end
    end
  end
end
