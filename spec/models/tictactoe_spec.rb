require 'rails_helper'

RSpec.describe Tictactoe, type: :model do

  it "board can be generated and updated" do
    user1 = FactoryGirl.create :user
    user2 = FactoryGirl.create :user

    game = Tictactoe.new(players: [user1.id, user2.id])

    board = game.board
    board[0] = "x"
    board[1] = "o"
    game.save!

    expect(game.board).to eq "xo3456789"
  end

  it "players can take turns and must stay within the bounds of the board" do
    user1 = FactoryGirl.create :user
    user2 = FactoryGirl.create :user

    game = Tictactoe.new(players: [user1.id, user2.id])

    game.take_turn "x", 5
    game.take_turn "o", 4

    expect(game.board).to eq "123ox6789"

    game.take_turn "x", 10
    game.take_turn "o", -1

    expect(game.board).to eq "123ox6789"
  end

  it "players cannot choose a spot that has already been chosen" do
    user1 = FactoryGirl.create :user
    user2 = FactoryGirl.create :user

    game = Tictactoe.new(players: [user1.id, user2.id])

    game.board = "1oxoxox89"

    game.take_turn "x", 2

    expect(game.board).to eq "1oxoxox89"

    game.take_turn "x", 3

    expect(game.board).to eq "1oxoxox89"

    game.take_turn "o", 7

    expect(game.board).to eq "1oxoxox89"

    game.take_turn "o", 6

    expect(game.board).to eq "1oxoxox89"

    game.take_turn "z", 5

    expect(game.board).to eq "1oxoxox89"
  end

  it "the game knows when it is over" do
    user1 = FactoryGirl.create :user
    user2 = FactoryGirl.create :user

    game = Tictactoe.new(players: [user1.id, user2.id])

    game.board = "xo3oxoxox"
    game.turn = 8

    game.take_turn "x", 3

    expect(game.over?).to eq true
  end

  it "the game ends after 9 turns" do
    user1 = FactoryGirl.create :user
    user2 = FactoryGirl.create :user

    game = Tictactoe.new(players: [user1.id, user2.id])

    game.take_turn "x", 1
    game.take_turn "x", 2
    game.take_turn "x", 3
    game.take_turn "x", 4
    game.take_turn "x", 5
    game.take_turn "x", 6
    game.take_turn "x", 7
    game.take_turn "x", 8
    game.take_turn "x", 9

    expect(game.over?).to eq true
    expect(game.board).to eq "xxxxxxxxx"
  end

  it "knows when there is a winner" do
    user1 = FactoryGirl.create :user
    user2 = FactoryGirl.create :user

    game = Tictactoe.new(players: [user1.id, user2.id])

    game.board = "xx3oxoxox"
    game.turn = 8
    game.take_turn "x", 3

    expect(game.board).to eq "xxxoxoxox"
    expect(game.over?).to eq true
    expect(game.winner?).to eq "x"

    game.board = "xoox5xoxo"
    game.turn = 8
    game.take_turn "x", 5

    expect(game.over?).to eq true
    expect(game.winner?).to eq "x"

    game.board = "xoxoxox8x"
    game.turn = 8
    game.take_turn "x", 8

    expect(game.over?).to eq true
    expect(game.winner?).to eq "x"

    game.board = "xoox5ooxx"
    game.turn = 8
    game.take_turn "x", 5

    expect(game.over?).to eq true
    expect(game.winner?).to eq "x"
  end

  describe Tictactoe do
  it "can lookup games from the database" do
    created = Tictactoe.create! players: [1,2]
    loaded  = Tictactoe.find_by(created.id)
    expect(created.id).to eq loaded.id
    expect(loaded.player_turn? 1).to eq true
  end

  it "can record a move" do
    g = Tictactoe.new players: [4,7]
    g.record_move 3
    expect(g.value_at 3).to eq "x"
  end

  it "knows whos turn it is" do
    g = Tictactoe.new players: [4,7]
    g.record_move 3
    g.record_move 5
    g.record_move 1
    expect(g.player_turn? 7).to eq true
  end
end
end