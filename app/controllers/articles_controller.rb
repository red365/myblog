class ArticlesController < ApplicationController
  before_action :require_login, except: [:show]
  
  
  def index
    @articles = Article.all
    @authors = Author.all
    if current_user.id == 1
      @is_admin = true
    end
  end

  def new
    @article = Article.new
  end

 def edit
   @article = Article.find(params[:id])
   if @article.author_id != current_user.id and current_user.id != 1
     redirect_to articles_path
   end
 
 end

 def create
   @author = Author.find(current_user.id)
   @article = @author.articles.new(article_params)
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
   @articles = Article.all
   @tags = Tag.all
   if params[:id]
     @article = Article.find(params[:id])
     @author = @article.author
     @article.record_article_view
     @article.save
   else
     if @articles.last
       @article = @articles.last
       @author = @article.author
       @article.record_article_view
       @article.save
     end
   end
   if @articles.size > 2
     @top_three = get_most_viewed_articles
   end
 end

 def destroy
   @article = Article.find(params[:id])
   if @article.author_id != current_user.id and current_user.id != 1
     redirect_to articles_path
   else
     @article.destroy
     redirect_to articles_path
   end
 end

 private
 def article_params
   params.require(:article).permit(:title, :text, :tag_list, :image)
 end

 def get_most_viewed_articles
   @top_three = @articles.sort_by &:view_count
   @top_three = @top_three.reverse[0..2]
 end
end
                                                                   
