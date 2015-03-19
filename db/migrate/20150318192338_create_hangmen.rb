class CreateHangmen < ActiveRecord::Migration
  def change
    create_table :hangmen do |t|
      t.integer :player_id, null: false
      t.string :answer, null: false
      t.text :guesses_json
      t.integer :guesses_left, default: 6
      

      t.timestamps null: false
    end
  end
end
