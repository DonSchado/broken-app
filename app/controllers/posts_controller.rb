class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :destroy]

  def index
    @posts = User.find(params[:user_id]).posts
  end

  def edit
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to root_path, notice: 'Post successfully created'
    else
      render action: 'new'
    end
  end

  def update
    if @post.update(post_params)
      redirect_to root_path, notice: 'Post successfully updated'
    else
      render action: 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  private

  def set_post
    @post = current_user.posts.find(params[:post_id])
  end

  def post_params
    params.require(:post).permit(:content)
  end
end
