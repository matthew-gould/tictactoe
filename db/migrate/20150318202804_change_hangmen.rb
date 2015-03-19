class ChangeHangmen < ActiveRecord::Migration
  def change
    add_column :hangmen, :guesses, :text
  end
end
