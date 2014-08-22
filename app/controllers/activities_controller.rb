class ActivitiesController < ApplicationController

  def index
    @feed = user_feed.order(created_at: :desc)
    binding.pry
  end


  private

  def user_feed
    current_user.likes.joins(post: :activities)
  end
end
