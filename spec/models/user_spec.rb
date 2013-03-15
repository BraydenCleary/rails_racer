require 'spec_helper'

describe User do
  it { should have_many(:game_users) }
  it { should have_many(:games).through(:game_users) } 

  context '#valid?' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:password_digest) }

    context 'when email is already in database' do
      before { create(:user) }
      it { should validate_uniqueness_of(:email) }
    end
  end
end
