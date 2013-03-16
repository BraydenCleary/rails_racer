class SessionsController < ApplicationController

  def create
    @user = User.find_by_email(params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:notice] = "Welcome back, #{@user.name}!"
      redirect_to games_path
    else
      render 'pages/main'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_url
  end
end
