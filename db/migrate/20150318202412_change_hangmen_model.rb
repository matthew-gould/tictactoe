class ChangeHangmenModel < ActiveRecord::Migration
  def change
    remove_column :hangmen, :guesses_json
  end
end
