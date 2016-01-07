class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])

    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
      flash[:success] = "Successfully logged in."
    else
      flash.now[:error] = ['Invalid username/password combination.']
      render 'new'
    end
  end

  def destroy
    session.clear
    redirect_to '/'
    flash[:notice] = 'You have successfully logged out.'
  end

end
