class ChangeHangman < ActiveRecord::Migration
  def change
    change_column :hangmen, :guesses, :text, default: [].to_json
  end
end
