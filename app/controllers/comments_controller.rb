class CommentsController < ApplicationController
  before_action :find_post
  before_action :authenticate_user!

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to post_path(@post), notice: "Comment Added to Post"
    else
      render 'new'
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])

    if @comment.user_id == current_user.id 
      @comment.delete
      redirect_to post_path(@post), notice: "Comment deleted"
    end
  end

  private

    def find_post
      @post = Post.find(params[:post_id])
    end

    def comment_params
      params.require(:comment).permit(:content)
    end
end
