class PostsController < ApplicationController

	before_action :require_signin, except: [:homepage, :index, :show]


	def homepage
	end

	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
		@comments = @post.comments
		@likers = @post.likers

		if current_user
			@current_like = current_user.likes.find_by(post_id: @post.id)
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		if @post.update(post_params)
			flash[:notice] = "Your Post was successfully updated"
			redirect_to @post
		else
			render :edit
		end
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			flash[:notice] = "New Post successfully created"
			redirect_to posts_url
		else
			render :new
		end
	end

	def destroy
		Post.find(params[:id]).destroy
		redirect_to posts_url
	end

	def upvote
		post = Post.find(params[:id])
		post.upvote
		post.save
		redirect_to :back
	end


	private

	def post_params
		params.require(:post).permit(:title, :link, :description)
	end
end
