class TictactoesController < ApplicationController

  def index
  end

  def new
    @opponents = User.all
  end

  def create
    game_params = params[:user]
    game = Tictactoe.create! players: [current_user.id, game_params[:id]]
    redirect_to show_tictactoe_path(game)
  end

  def show
    @game = Tictactoe.find_by(params[:id])
    @can_play = @game.winner.nil? && @game.player_turn?(current_user.id)
  end

  def update
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
  #   redirect_to show_tictactoe_path(game)
  # end

  # def create
  #   game = Tictactoe.start_game current_user
  #   redirect_to show_tictactoe_path(game)
  # end
end