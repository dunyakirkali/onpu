require 'rails_helper'

RSpec.describe Users::OmniauthCallbacksController, type: :controller do
  let(:user) { build(:user) }

  before(:each) do
    stub_env_for_omniauth
  end

  describe '#annonymous user' do
    context "when google_oauth2 email doesn't exist in the system" do
      before(:each) do
        get :google_oauth2
        @user = User.find_by(email: user.email)
      end

      it { expect(@user).not_to be(nil) }
      it { should be_user_signed_in }
      it { expect(response).to redirect_to root_path }
    end

    context 'when google_oauth2 email already exist in the system' do
      before(:each) do
        create(:user, email: user.email)
        get :google_oauth2
        @user = User.find_by(email: user.email)
      end

      it { expect(flash[:notice]).to eq(I18n.t('devise.omniauth_callbacks.success', kind: 'Google')) }
      it { expect(response).to redirect_to root_path }
    end
  end

  describe '#logged in user' do
    before(:each) do
      @user = create(:user, email: user.email)
      sign_in @user
      get :google_oauth2
    end

    it { should be_user_signed_in }
    it { expect(response).to redirect_to root_path }
    it { expect(flash[:notice]).to eq(I18n.t('devise.omniauth_callbacks.success', kind: 'Google')) }
  end
end

def stub_env_for_omniauth
  request.env['devise.mapping'] = Devise.mappings[:user]
  request.env['omniauth.auth'] = omniauth_hash(user.email)
end
