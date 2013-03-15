require 'spec_helper'

describe GameUser do

  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:game_id) }
  it { should belong_to(:user) }
  it { should belong_to(:game) }

  context "can not play against himself" do
    before { create :game_user }
    it { should validate_uniqueness_of(:game_id).scoped_to(:user_id) }
  end
end

