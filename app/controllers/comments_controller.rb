class CommentsController < ApplicationController

	def index
		@post = Post.find(params[:post_id])
		@comments = @post.comments
	end

	def new
		@post = Post.find(params[:post_id])
		@comment = @post.comments.new
	end

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.new(comment_params)

		if @comment.save
			flash[:notice] = "Your comment was successfully posted"
			redirect_to post_comments_url
		else
			render :new
		end
	end

	private

	def comment_params
		params.require(:comment).permit(:name, :comment, :rating)
	end

end
