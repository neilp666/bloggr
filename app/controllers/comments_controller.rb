class CommentsController < ApplicationController
  before_action :find_comments, only: [:create, :destroy]



  def create 
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)

    flash[:notice] = "Comment has been created!"
    redirect_to post_path(@post)
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy

    flash[:notice] = "Comment has been destroyed!"

    redirect_to post_path
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :body)
  end

  def find_comments
    @post = Post.find(params[:post_id])
  end


end
