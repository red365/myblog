class HomeController < ApplicationController
  def index
    @articles = Article.all
    if @articles.last
      @article = @articles.last
    else
      redirect_to "/home/empty.html"
    end
  end

  def empty
  end
end
