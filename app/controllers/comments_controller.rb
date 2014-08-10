class CommentsController < ApplicationController

	before_action :require_signin

	def index
		@post = Post.find(params[:post_id])
		@comments = @post.comments.order("created_at desc")
	end

	def new
		@post = Post.find(params[:post_id])
		@comment = @post.comments.new
	end

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.new(comment_params)
		@comment.user = current_user

		if @comment.save
			flash[:notice] = "Your comment was successfully posted"
			redirect_to @post
		else
			render :new
		end
	end

	def show
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@user = current_user

		if @comment.user == current_user
			@comment.destroy
			redirect_to @post
		else
			redirect_to @post
		end

	end

	private

	def comment_params
		params.require(:comment).permit(:comment, :rating)
	end

end
