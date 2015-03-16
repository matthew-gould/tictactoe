Rails.application.routes.draw do
  devise_for :users

  root to: 'tictactoes#index'

  get 'tictactoe/new' => 'tictactoes#new', as: 'new_tictactoe'

  post 'tictactoe' => 'tictactoes#create', as: 'create_tictactoe'

  get 'tictactoe/:tictactoe_id' => 'tictactoes#show', as: 'show_tictactoe'

  post 'tictactoe/:tictactoe_id' => 'tictactoes#update'

end