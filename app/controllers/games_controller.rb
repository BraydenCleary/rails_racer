class GamesController < ApplicationController


  def index

  end

  def new
    @game = Game.new
  end

  def create
    #@user1 = User.find(session[:id])
    @user1 = User.find(1)
    #@user2 = User.find(2)
    @game = Game.new 
    @game.game_users
    @game.save!

    # if @game.save
       redirect_to @game
    # else 
    #   redirect_to :back
    # end 
  end

  def update 
    # create a new game_user 
  end 

  def move
    p params
    game = Game.find(params[:id])
    user = game.locate_game_user(params[:user_id])
    game.advance!(user)
    render :json => game
  end

  def show
    @game = Game.find(params[:id])
    @user1 = User.find(1)
    @user2 = User.find(2)
  end

>>>>>>> good luck to us
end
