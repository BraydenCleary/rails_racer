class UsersController < ApplicationController
  
  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "User successfully created"
      redirect_to new_game_path
    else
      render 'pages/main'
    end
  end

  def show
    @user = User.find(params[:id])
  end
end
