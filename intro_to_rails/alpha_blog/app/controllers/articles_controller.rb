class ArticlesController < ApplicationController
  before_action :load_article, only: [ :show, :edit, :update, :destroy ]

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
    @article.author = "dev"
    @article.user = User.first
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
end
