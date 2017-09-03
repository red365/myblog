class CommentsController < ApplicationController
  before_action :require_login, except: [:create]
                                 
  def create
    date = Time.now.year.to_s + "-" + Time.now.month.to_s + "-" + Time.now.day.to_s
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    @comment.date = date
    @comment.save
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end
 
  private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
