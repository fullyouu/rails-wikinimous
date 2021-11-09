class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    id = params[:id]
    @article = Article.find(id)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(strong_params)
    @article.save
    redirect_to article_path(@article.id)
  end

  def edit
    id = params[:id]
    @article = Article.find(id)
  end

  def update
    id = params[:id]
    @article = Article.find(id)
    @article.update(strong_params)
    redirect_to article_path(@article.id)
  end

  def delete
    id = params[:id]
    @article = article.find(id)
    @article.destroy
    redirect_to articles_path
  end

  private

  def strong_params
    params.require(:article).permit(:title, :content)
  end
end
