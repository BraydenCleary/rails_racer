
function Player(id) {
  this.id       = id;
  this.position = 1;
}

Player.prototype.advance = function() {
  this.position ++;
};

function Game(player1, player2) {
  this.player1    = player1;
  this.player2    = player2;
  this.startTime  = $.now();
  this.boardSize  = 10;
  this.gameTime   = null;
  this.winner     = null;
}

Game.prototype.finished = function() {
  if(game.player1.position == game.boardSize || game.player2.position == game.boardSize){
    game.gameTime = game.startTime - $.now();
    return true;
  } else {
    return false;
  }
}

Game.prototype.updateBoard = function() {
  $("td").removeClass("active");
  $(".player1-board td:nth-child(" +player1.position+ ")").addClass("active");
  $(".player2-board td:nth-child(" +player2.position+ ")").addClass("active");
}

Game.prototype.onKeyUp = function(event) {
  if (game.finished() == true){
    //$.post
  } else {
    if(event.keyCode == 65){
      player1.advance();
      $.ajax({
        url: '/games/1/move',
        type: 'PUT',
        data: {user_id: player1.id},
        success: function(data) {
          console.log(data);
        }
      });
      game.updateBoard();
      if(game.finished() == true){
        game.winner = player1;
        alert("player 1 wins!!!!!!!!");
      }
    }
    else if(event.keyCode == 76){
      player2.advance();
      game.updateBoard();
      if(game.finished() == true){
        game.winner = player2;
        alert("player 2 wins!!!!!!!!");
      }
    }
  }  
}

jQuery(document).ready(function($) {
  var p1Id = $("span").attr("data-player1-id"); 
  var p2Id = $("span").attr("data-player2-id"); 
  var gameId = $("span").attr("data-player2-id"); 
  player1 = new Player(p1Id);
  player2 = new Player(p2Id);
  game = new Game(player1, player2);
  game.updateBoard();
  $(document).on('keyup', game.onKeyUp);
});


// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
