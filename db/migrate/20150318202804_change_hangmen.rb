class ChangeHangmen < ActiveRecord::Migration
  def change
    add_column :hangmen, :guesses, :text, default: [].to_json
  end
end
