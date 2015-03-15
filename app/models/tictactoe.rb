class Tictactoe < ActiveRecord::Base
  belongs_to :users

  def take_turn (letter, place)
    if self.board[place-1] != "x" && self.board[place-1] != "o" && place > 0 && place < 10
      self.board[place-1] = letter
    end
      self.save!
  end

  
end
