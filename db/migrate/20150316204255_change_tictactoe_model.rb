class ChangeTictactoeModel < ActiveRecord::Migration
  def change
    remove_column :tictactoes, :player_x
    remove_column :tictactoes, :player_o
    add_column :tictactoes, :players, :text
    add_column :tictactoes, :current_player, :integer, default: 0
  end
end
