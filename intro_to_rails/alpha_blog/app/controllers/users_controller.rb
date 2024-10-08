class UsersController < ApplicationController
  before_action :set_user, only: [ :edit, :update, :show, :destroy ]
  before_action :require_user, only: [ :edit, :update ]
  before_action :require_same_user, only: [ :edit, :update ]

  def index
    # @users = User.all
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def show
    @articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end

  def new
    # used in the template if there are errors
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome to the Alpha Blog #{@user.username}, you have successfully signed up"
      redirect_to articles_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    session[:user_id] = nil if @user == current_user
    flash[:notice] = "Account and all associated articles successfully deleted"
    redirect_to articles_path
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "User was updated successfully"
      redirect_to @user
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @user and !current_user.admin?
      flash[:alert] = "You can only edit or delete your own account"
      redirect_to @user
    end
  end
end
