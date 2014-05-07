class PostsController < ApplicationController

	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		@post.update(post_params)
		redirect_to @post
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.create(post_params)
		redirect_to posts_url
	end

	def destroy
		Post.find(params[:id]).destroy
		redirect_to posts_url
	end


	private

	def post_params
		params.require(:post).permit(:title, :link, :description)
	end
end
