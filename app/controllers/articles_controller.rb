class ArticlesController < ApplicationController
  before_action :require_login, except: [:show]
  
  
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

 def edit
   @article = Article.find(params[:id])
 end

 def create
   @article = Article.new(article_params)
   @article.date = Time.now.year.to_s + "-" + Time.now.month.to_s + "-" + Time.now.day.to_s

   if @article.save
     redirect_to @article
   else
     render 'new'
   end
 end

 def update
  @article = Article.find(params[:id])
 
  if @article.update(article_params)
    flash.notice = "Article '#{@article.title}' updated!"
    redirect_to @article
  else
    render 'edit'
  end
 end

 def show
   @tags = Tag.all
   if params[:id]
     @article = Article.find(params[:id])
   else
     @articles = Article.all
     if @articles.last
      @article = @articles.last
     end
   end
 end

 def destroy
   @article = Article.find(params[:id])
   @article.destroy

   redirect_to articles_path
 end

 private
 def article_params
   params.require(:article).permit(:title, :text, :tag_list, :image)
 end

end
                                                                   
