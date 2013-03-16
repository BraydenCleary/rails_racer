class GameController < ApplicationController
  def new
  end

  def create
  end

  def move
    game = Game.find(params[:id])
    player = game.locate_player(params[:user_id], params[:id])
    game.advance!(player)
    render :json => game
  end

end
