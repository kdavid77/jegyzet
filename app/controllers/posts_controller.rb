class PostsController < ApplicationController

  def new
    @post=Post.new
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "Post created"
    else
      flash[:error] = "Post failed"
    end
    redirect_to root_path
  end
  
  def show
    @post=Post.find_by_id(params[:id])
  end
  
  def index
    @allposts = Post.all
  end
  
  def edit
    @post=Post.find_by_id(params[:id])
  end
  
  def update
    @post=Post.find_by_id(params[:id])
    @post.update_attributes(post_params)
    redirect_to(@post)
  end
  
  def destroy
    Post.find_by_id(params[:id]).destroy
    flash[:success] = "Torolve"
    redirect_to root_path
  end
  
  private
  
    def post_params
      params.require(:post).permit(:id, :title, :content)
    end
  
end
