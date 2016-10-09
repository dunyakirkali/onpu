require 'rails_helper'

RSpec.describe Users::AudiosController, type: :controller do
  login_user

  let(:valid_attributes) { attributes_for(:audio) }
  let(:invalid_attributes) { attributes_for(:audio, file: nil) }

  describe 'GET #new' do
    let(:jingle) { create(:jingle) }

    before :each do
      get :new, xhr: true, params: { jingle_id: jingle.id }
    end

    it 'assigns a new audio as @audio' do
      expect(assigns(:audio)).to be_a_new(Audio)
    end
  end

  describe 'POST #create' do
    let!(:jingle) { create(:jingle, user: @user) }

    context 'with valid params' do
      it 'creates a new audio' do
        expect do
          post :create, xhr: true, params: { jingle_id: jingle.to_param, audio: valid_attributes }
        end.to change(Audio, :count).by(1)
      end

      it 'assigns a newly created audio as @audio' do
        post :create, xhr: true, params: { jingle_id: jingle.to_param, audio: valid_attributes }
        expect(assigns(:audio)).to be_a(Audio)
        expect(assigns(:audio)).to be_persisted
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved audio as @audio' do
        post :create, xhr: true, params: { jingle_id: jingle.to_param, audio: invalid_attributes }, format: :js
        expect(assigns(:audio)).to be_a_new(Audio)
      end

      it "re-renders the 'new' template" do
        post :create, xhr: true, params: { jingle_id: jingle.to_param, audio: invalid_attributes }, format: :js
        expect(response).to render_template('users/audios/create')
      end
    end
  end
end
