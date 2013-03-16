class SessionsController < ApplicationController

  def create
    @user = User.find_by_email(params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:success] = "Welcome back, #{@user.name}!"
      redirect_to new_game_path
    else
      flash[:error] = 'Inccorect email/password combination.'
      redirect_to root_path
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_url
  end
end
