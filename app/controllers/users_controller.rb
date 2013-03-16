class UsersController < ApplicationController
  
  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/games'
    else
      render '/'
    end
  end

  def show
    
  end
end
