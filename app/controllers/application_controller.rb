class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def require_signin
    unless current_user
      session[:intended_url] = request.url
      redirect_to new_session_url, alert: "Please sign in first"
    end
  end

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def current_user?(user)
    current_user == user
  end

  helper_method :current_user?

  def admin?
    current_user.admin?
  end

  helper_method :admin?

  def track_activity(trackable, post,  action = params[:action])
    Activity.create! action: action, trackable: trackable, post: post, user: current_user
  end

  # this is a front-end helper and likely shouldn't be here. will look into moving it later
  def get_background(post)
    "background-image: url(#{post.background.url});"
  end

  helper_method :get_background

end
