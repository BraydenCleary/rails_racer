class UsersController < ApplicationController
  
  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to new_game_path
    else
      render '/'
    end
  end

  def show
    
  end
end
