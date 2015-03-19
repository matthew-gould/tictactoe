class Hangman < ActiveRecord::Base

  serialize :guesses, JSON

  Words = File.
    read("/usr/share/dict/words").
    split("\n").
    select { |w| w.length < 8 && w.length > 1 }.
    map { |w| w.chomp }
 
  def guesses_array
    guesses
  end
 
  def board
    result = ""

    answer.split("").each do |letter|
      if guesses.include? letter
        result += letter
      else
        result += "_"
      end
    end
    result
  end
 
  def take_move guess
    guesses_array = (guesses << guess)
 
    unless answer.include? guess
      self.guesses_left -= 1
    end
    self.save!
  end
 
  def lost?
    self.guesses_left == 0
  end
 
  def won?
    board == answer
  end
 
  def current_player
    User.find player_id
  end
  
  def self.start_game player
    Hangman.create!(
      player_id: player.id,
      answer: Words.sample,
      guesses_left: 6,
    )
  end
 
  def self.saved_game id
    Hangman.find(id)
  end
end
 