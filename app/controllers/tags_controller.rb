class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.create tag_params
    redirect_to tags_path
  end

  def show
    @tag = Tag.find params[:id]
    # render json: params
  end

  def destroy
    # render json: params
    t = Tag.find(params[:id])
    num_c = t.creatures.length
    if num_c > 0
      flash[:danger] = "You cannot delete this tag because there are #{num_c} creatures with this tag."
    else
    # t.creatures.tags.find(params[:id]).delete
    t.delete
    end
    redirect_to tags_path
  end

  private
  def tag_params
    params.require(:tag).permit(:name)
  end

end
