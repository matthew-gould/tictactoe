require 'rails_helper'

RSpec.describe Tictactoe, type: :model do

  it "board can be generated and updated" do
    user1 = FactoryGirl.create :user
    user2 = FactoryGirl.create :user

    game = Tictactoe.new(player_x: user1.id, player_o: user2.id)

    board = game.board
    board[0] = "x"
    board[1] = "o"
    game.save!

    expect(game.board).to eq "xo3456789"
  end

  it "players can take turns and must stay within the bounds of the board" do
    user1 = FactoryGirl.create :user
    user2 = FactoryGirl.create :user

    game = Tictactoe.new(player_x: user1.id, player_o: user2.id)

    game.take_turn "x", 5
    game.take_turn "o", 4

    expect(game.board).to eq "123ox6789"

    game.take_turn "x", 10
    game.take_turn "o", -1

    expect(game.board).to eq "123ox6789"
  end
end