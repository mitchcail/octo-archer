class PostsController < ApplicationController

	def index
		@posts = ['google', 'shopify', 'y-combinator']
	end
end
