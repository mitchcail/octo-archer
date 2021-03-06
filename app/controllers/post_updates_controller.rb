class PostUpdatesController < ApplicationController

  before_action :require_signin

  #before_action :require_correct_user, only: [:new, :create]

  def index
    @post = Post.find(params[:post_id])
    @post_updates = @post.post_updates.all
  end

  def new
    @post = Post.find(params[:post_id])
    @post_updates = @post.post_updates.new
  end

  def create
    @post = Post.find(params[:post_id])
    @post_updates = @post.post_updates.new(update_params)
    if @post_updates.save
      track_activity(@post_updates, @post)
      redirect_to @post
    else
      render :new
    end
  end


  private

  def update_params
    params.require(:post_update).permit(:content)
  end
end
