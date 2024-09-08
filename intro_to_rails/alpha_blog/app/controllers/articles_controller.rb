class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  def show
    # debugger
    @article = Article.find(params[:id])
  end

  def new
    # used in the template if there are errors
    @article = Article.new
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
    @article.author = "dev"
    if @article.save
      flash[:notice] = "Article was created successfully."
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end
end
