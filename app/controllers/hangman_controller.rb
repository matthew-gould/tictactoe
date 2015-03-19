class HangmanController < ApplicationController
  
  def show
    @game = Hangman.saved_game params[:id]
    if current_user == @game.current_player
      render :play
    else
      render :spectate
    end
  end
 
  def move
    game = Hangman.saved_game params[:id]
    if game.over?
      flash[:danger] = "This game is already over!"
    elsif current_user == game.current_player
      game.take_move params[:selected_move]
    else
      flash[:danger] = "It's not your turn to play!"
    end
    redirect_to show_hangman_path(game)
  end
 
  def create
    game = Hangman.start_game current_user
    redirect_to show_hangman_path(game)
  end
end