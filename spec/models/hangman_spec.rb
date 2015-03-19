require 'rails_helper'

RSpec.describe Hangman, type: :model do
  it "can generate a board" do
    game = FactoryGirl.create :hangman

    game.board

    expect(game.board).to eq "______"
  end

  it "board knows when a letter has been guessed" do
    game = FactoryGirl.create :hangman

    game.guesses = ["b","a"]
    game.board

    expect(game.board).to eq "ba_a_a"
  end

  it "can collect guessed letters in guesses" do
    game = FactoryGirl.create :hangman

    game.take_move "x"
    game.take_move "t"
    game.take_move "r"

    expect(game.guesses).to eq ["x","t","r"]
  end

  it "puts correct leters into guesses as well" do
    game = FactoryGirl.create :hangman

    game.take_move "x"
    game.take_move "t"
    game.take_move "r"
    game.take_move "b"
    game.take_move "n"

    expect(game.guesses).to eq ["x","t","r","b","n"]
    expect(game.board).to eq "b_n_n_"
  end
end
