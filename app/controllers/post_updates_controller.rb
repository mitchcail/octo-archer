class PostUpdatesController < ApplicationController


  def index
    @post = Post.find(params[:post_id])
    @post_updates = @post.post_updates.all
  end
end
