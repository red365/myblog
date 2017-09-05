class TagsController < ApplicationController
  before_action :require_login, only: [:index, :destroy]
  
  def show
    @tag = Tag.find(params[:id])
  end

  def index
    @tags = Tag.all
    if @tags.last
      @tags
    else
      render template: "tags/none"
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy

    redirect_to tags_path

  end
    
end
