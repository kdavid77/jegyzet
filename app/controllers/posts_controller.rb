class PostsController < ApplicationController

  def new
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
  
  private
  
    def post_params
      params.require(:post).permit(:title, :content)
    end
  
end
