class TictactoesController < ApplicationController

  def index
  end

  def new
    @opponents = User.all
  end

  def create
    game = Tictactoe.new player_x: current_user.id, player_o: params[:user]
    redirect_to show_tictactoe_path(game.id)
  end

  # def show
  #   @game = Tictactoe.saved_game params[:id]
  #   if current_user == @game.current_player
  #     render :play # view for player, has form for making next move, unless the game is over
  #   else
  #     render :spectate # view for spectators, has no form
  #   end
  # end
  
  # def move
  #   game = Tictactoe.saved_game params[:id]
  #   if game.over?
  #     flash[:danger] = "This game is already over!"
  #   elsif current_user == game.current_player
  #     game.take_move params[:selected_move]
  #   else
  #     flash[:danger] = "It's not your turn to play!"
  #   end
  #   redirect_to hangman_show_path(game)
  # end

  # def create
  #   game = Tictactoe.start_game current_user
  #   redirect_to hangman_show_path(game)
  # end
end