class GamesController < ApplicationController

  def index

  end

  def move
    game = Game.find(params[:id])
    player = game.locate_game_user(params[:user_id])
    game.advance!(player)
    render :json => game
  end

end