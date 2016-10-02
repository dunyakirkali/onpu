require 'rails_helper'

RSpec.describe User, type: :model do
  # Relations
  it { should have_many(:jingles).dependent(:destroy) }

  # Class methods
  describe '.' do
    describe 'find_for_google_oauth2' do
      it 'should create a new user if does not exist' do
        user = build(:user)
        expect do
          User.find_for_google_oauth2(omniauth_hash(user.email), nil)
        end.to change { User.count }.by(1)
      end

      it 'should return user if exists' do
        user = create(:user)
        expect(User.find_for_google_oauth2(omniauth_hash(user.email), nil)).to eq(user)
      end
    end
  end
end
