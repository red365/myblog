class TagsController < ApplicationController
  http_basic_authenticate_with name: "red365",
                               password: "jobsite_log1n",
                               except: [:index, :show]
  
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
