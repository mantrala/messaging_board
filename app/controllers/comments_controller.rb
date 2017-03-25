class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    comment = @post.comments.create(comment_params)
    comment.user = current_user

    respond_to do |format|
      if comment.save
        format.html { redirect_to @post, notice: 'Comment was successfully created.' }
      else
        format.html { redirect_to @post }
      end
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
