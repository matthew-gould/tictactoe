require 'rails_helper'

describe TictactoesController do
  render_views

  it "can let players choose a game" do
    user1 = FactoryGirl.create :user
    user2 = FactoryGirl.create :user

    get :index

    expect(response.code.to_i).to eq 302 # redirect
  end

  it "can let players choose an opponent" do

  end
end