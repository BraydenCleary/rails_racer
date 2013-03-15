require 'spec_helper'

describe Game do
  let(:game) { Game.new  }
  
  it { should validate_presence_of(:p1_position) }
  it { should validate_presence_of(:p2_position) }
  it { should have_many(:users).through(:game_users) }
  it { should have_many(:game_users) }

  it 'p1_position should default to 0' do
    game.p1_position.should eq(0)
  end

  it 'p2_position should default to 0' do
    game.p2_position.should eq(0)
  end

  it 'p1_position should default to 0exit' do
    game.p1_position.should eq(0)
  end


end

