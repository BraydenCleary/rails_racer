require 'spec_helper'

describe Game do


  
  it { should validate_presence_of(:p1_position) }
  it { should validate_presence_of(:p2_position) }
  it { should have_many(:users).through(:game_users) }
  it { should have_many(:game_users) }

  context 'default position' do

    let(:game) { create :game }

    it 'p1_position should default to 0' do
      game.p1_position.should eq(0)
    end

    it 'p2_position should default to 0' do
      game.p2_position.should eq(0)
    end
  end

  context 'advancing a player' do 

    let(:game) { create :game }
    let(:game_user) { create :game_user}

    it 'should increase players position by 1' do
      expect { 
        game.advance!(game_user)
      }.to change {game.p1_position}.by(1)
    end

    it 'accepts a GameUser object as an argument' do 
      expect { 
        game.advance!(game_user)
      }.to_not raise_error(ArgumentError) 
    end

    it 'errors when not given a GameUser object' do
      expect { 
        game.advance!
      }.to raise_error(ArgumentError) 
    end

  end

  context 'locating a game user' do

    let(:user) {create :user}
    let(:game) { create :game }
    let(:game_user) { create :game_user}
    

    it 'accepts one argument' do
      expect {
        game.locate_game_user(1)
      }.to_not raise_error(ArgumentError)
    end

    it 'raises an error with two arguments' do 
      expect {
        game.locate_game_user(1,1) 
      }.to raise_error(ArgumentError)
    end

    it 'should return a game user object' do #BUGBUG
      game.game_users << game_user
      game_user = game.locate_game_user(user.id)
      game_user.is_a?(GameUser).should be_true
    end

  end
end

