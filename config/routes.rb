Rails.application.routes.draw do
  devise_for :users

  root to: 'tictactoes#index'

  get 'tictactoe/new' => 'tictactoes#new', as: 'new_tictactoe'
  post 'tictactoe' => 'tictactoes#create', as: 'create_tictactoe'
  get 'tictactoe/:tictactoe_id' => 'tictactoes#show', as: 'show_tictactoe'
  post 'tictactoe/:tictactoe_id/update' => 'tictactoes#update', as: 'update_tictactoe'

  get 'hangman/new' => 'hangman@new', as: 'new_hangman'
  post 'hangman' => 'hangman#create', as: 'create_hangman'
  get 'hangman/:hangman_id' => 'hangman#show', as: 'show_hangman'
  post 'hangman/:hangman_id/update' => 'hangman#move', as: 'update_hangman'
end