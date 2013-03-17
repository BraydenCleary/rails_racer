class GamesController < ApplicationController
  
  def index
    @open_games = Game.all.select { |game| game.open? }
  end

  def new
    @game = Game.new
  end

  def create
    @user1 = User.find(session[:user_id])
    @game = Game.create 
    @user1.games << @game
    game_user = GameUser.find_by_game_id_and_user_id(@game.id, @user1.id)
    game_user.update_attributes(player: 1)
    @game.save!
    redirect_to @game
  end

  def update 
    # create a new game_user 
  end 

  def move
    game = Game.find(params[:id])
    game_user = game.locate_game_user(params[:user_id])
    game.advance!(game_user)
    render json: { p1_position: game.p1_position, p2_position: game.p2_position, p2_id: game.player2.id }
  end

  def show
    @game = Game.find(params[:id])
    @user1 = @game.users.first 
    unless @user1 == current_user
      @user2 = current_user 
      @user2.games << @game
      game_user = GameUser.find_by_game_id_and_user_id(@game.id, @user2.id)
      game_user.update_attributes(player: 2)
    end
  end

  def results
    @game = Game.find(params[:id])
    @game.finish!(params[:winner],params[:game_time], params[:position])
    redirect_to user_path(current_user)
  end 

end
