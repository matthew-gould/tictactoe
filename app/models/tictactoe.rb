class Tictactoe < ActiveRecord::Base
  belongs_to :users

  def take_turn (letter, place)
    if letter != "x" && letter != "o"
      false
    end
    if self.board[place-1] != "x" && self.board[place-1] != "o" && place > 0 && place < 10
      self.board[place-1] = letter
      self.turn += 1
    end
      self.save!
  end

  def over?
    #would like to do a check that the board has no numbers include?(1..9) or something
    if self.turn = 9 || winner?
      true
    end
  end

  def value_at place
      self.board[place-1]
    end

  def winner?
    lines = [
        [1,2,3],
        [4,5,6],
        [7,8,9],
        [1,5,9],
        [3,5,7],
        [1,4,7],
        [2,5,8],
        [3,6,9]
      ]
      lines.each do |line|
        if line.all? { |place| value_at(place) == value_at(line.first) }
          return value_at(line.first)
        end
      end
      nil
  end
end
