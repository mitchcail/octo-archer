class SessionsController < ApplicationController
  
  def new
    
  end

  def create
    
    if user = User.authenticate(params[:email], params[:password])
      # session
      session[:user_id] = user.id

      flash[:notice] = "welcome back, #{user.name}"
      redirect_to(session[:intended_url] || user)
      session[:intended_url] = nil
    else
      flash.now[:alert] = "Invalid email/password combination!"
      render :new
    end
  end

  def destroy
    fail
    session[:user_id] = nil
    redirect_to root_url
  end

  #for some reason the destroy goes to the show method, will fix in future
  def show
    session[:user_id] = nil
    redirect_to root_url
  end

end
