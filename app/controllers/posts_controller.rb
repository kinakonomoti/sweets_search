class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def index
    @posts = Post.page(params[:page])
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy  
    redirect_to posts_path
  end

  def edit
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :image)
  end
end
