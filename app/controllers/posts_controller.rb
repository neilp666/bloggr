class PostsController < ApplicationController
before_action :find_post, only: [:show, :edit, :update, :destroy]


  def index
    @posts = Post.all.order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def show
  end

  def edit
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  def update
    if @post.update post_params
      redirect_to post_path(@post), notice: "Your post was updated"
    else
      render :edit
    end
  end



  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post, notice: "Your post was saved successfully"
    else
      render 'new', notice: "Unable to save"
    end
  end

  private

  def post_params
    @post = params.require(:post).permit(:title, :body)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
