class PostsController < ApplicationController
  def index
    @posts = Post.all_posts
  end

  def show
    @post = Post.find_post(params[:id])
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
