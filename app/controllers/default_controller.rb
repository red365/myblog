class DefaultController < ApplicationController

  def show
    @articles = Article.all
    if @articles.last
      @article = @articles.last
      render template: "default/default"
    else
      render template: "default/empty"
    end
  end

end
