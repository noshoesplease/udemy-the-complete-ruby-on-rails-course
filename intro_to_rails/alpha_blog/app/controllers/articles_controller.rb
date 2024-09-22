class ArticlesController < ApplicationController
  before_action :load_article, only: [ :show, :edit, :update, :destroy ]
  before_action :require_user, except: [ :index, :show ]
  before_action :require_same_user, only: [ :edit, :update, :destroy ]

  def index
    # @articles = Article.all
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end

  def show
    # debugger
  end

  def new
    # used in the template if there are errors
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      flash[:notice] = "Article was created successfully."
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article was updated successfully."
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def edit
  end

  def destroy
    @article.destroy
    flash[:notice] = "Article was deleted successfully."
    redirect_to articles_path
  end

  private
  def load_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end

  def require_same_user
    if current_user != @article.user and !current_user.admin?
      flash[:alert] = "You can only edit or delete your own article."
      redirect_to @article
    end
  end
end
