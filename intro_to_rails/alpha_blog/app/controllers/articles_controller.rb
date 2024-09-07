class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  def show
    # debugger
    @article = Article.find(params[:id])
  end

  def new
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
    @article.author = "dev"
    @article.save
    redirect_to @article
  end
end
