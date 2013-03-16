class UsersController < ApplicationController
  
  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
<<<<<<< Updated upstream
      redirect_to new_game_path
=======
      flash[:success] = "User successfully created"
      redirect_to '/games'
>>>>>>> Stashed changes
    else
      puts ">>>>>>>>>>"
      puts @user.errors.full_messages
      render 'pages/main'
    end
  end

  def show
    @user = User.find(params[:id])
  end
end
