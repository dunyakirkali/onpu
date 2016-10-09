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

    it 'assigns the jingle as @jingle' do
      expect(assigns(:jingle)).to eq(jingle)
    end

    it 'assigns a new audio as @audio' do
      expect(assigns(:audio)).to be_a_new(Audio)
    end
  end

  describe 'GET #edit' do
    let(:jingle) { create(:jingle, user: @user) }

    before :each do
      process :edit, method: :get, params: { jingle_id: jingle.to_param }, format: :js
    end

    it 'assigns the jingle as @jingle' do
      expect(assigns(:jingle)).to eq(jingle)
    end

    it 'assigns the requested audio as @audio' do
      expect(assigns(:audio)).to eq(jingle.audio)
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
  #
  # describe 'PUT #update' do
  #   context 'with valid params' do
  #     let(:new_attributes) { attributes_for(:jingle) }
  #
  #     before :each do
  #       @jingle = create(:jingle, valid_attributes)
  #       @user.jingles << @jingle
  #     end
  #
  #     it 'updates the requested jingle' do
  #       put :update, xhr: true, params: { id: @jingle.to_param, jingle: new_attributes }
  #       @jingle.reload
  #       expect(@jingle.title).to eq(new_attributes[:title])
  #     end
  #
  #     it 'assigns the requested jingle as @jingle' do
  #       put :update, xhr: true, params: { id: @jingle.to_param, jingle: valid_attributes }
  #       expect(assigns(:jingle)).to eq(@jingle)
  #     end
  #
  #     it 'redirects to the jingle' do
  #       put :update, xhr: true, params: { id: @jingle.to_param, jingle: valid_attributes }
  #       expect(response).to render_template('users/jingles/update')
  #     end
  #
  #     it 'assigns jingles if format is js' do
  #       put :update, xhr: true, params: { id: @jingle.to_param, jingle: valid_attributes }
  #       expect(assigns(:jingles)).to eq(@user.jingles)
  #     end
  #   end
  #
  #   context 'with invalid params' do
  #     before :each do
  #       @jingle = create(:jingle, valid_attributes)
  #       @user.jingles << @jingle
  #     end
  #
  #     it 'assigns the jingle as @jingle' do
  #       process :update, method: :put, params: { id: @jingle.to_param, jingle: invalid_attributes }, format: :js
  #       expect(assigns(:jingle)).to eq(@jingle)
  #     end
  #
  #     it "re-renders the 'edit' template" do
  #       process :update, method: :put, params: { id: @jingle.to_param, jingle: invalid_attributes }, format: :js
  #       expect(response).to render_template('users/jingles/update')
  #     end
  #   end
  # end
end
