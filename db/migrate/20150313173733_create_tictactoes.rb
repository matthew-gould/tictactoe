class CreateTictactoes < ActiveRecord::Migration
  def change
    create_table :tictactoes do |t|
      t.string  :board, default: "123456789"
      t.integer :player_x
      t.integer :player_o
      t.integer :turn, default: 0
      t.integer :winner_id
      t.integer :loser_id

      t.timestamps null: false
    end
  end
end
