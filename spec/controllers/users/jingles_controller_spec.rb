require 'rails_helper'

RSpec.describe Users::JinglesController, type: :controller do
  login_user

  let(:valid_attributes) { attributes_for(:jingle) }
  let(:invalid_attributes) { attributes_for(:jingle, title: nil) }

  describe 'GET #new' do
    it 'assigns a new jingle as @jingle' do
      get :new, xhr: true, params: {}
      expect(assigns(:jingle)).to be_a_new(Jingle)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested jingle as @jingle' do
      jingle = create(:jingle, valid_attributes)
      @user.jingles << jingle
      process :edit, method: :get, params: { id: jingle.to_param }, format: :js
      expect(assigns(:jingle)).to eq(jingle)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      let!(:audio) { create(:audio) }
      let!(:image) { create(:image) }

      before :each do
        valid_attributes[:audio_id] = audio.id
        valid_attributes[:image_attributes] = attributes_for(:image)
      end

      it 'creates a new Jingle' do
        expect do
          post :create, xhr: true, params: { jingle: valid_attributes }
        end.to change(Jingle, :count).by(1)
      end

      it 'assigns a newly created jingle as @jingle' do
        post :create, xhr: true, params: { jingle: valid_attributes }
        expect(assigns(:jingle)).to be_a(Jingle)
        expect(assigns(:jingle)).to be_persisted
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved jingle as @jingle' do
        post :create, xhr: true, params: { jingle: invalid_attributes }, format: :js
        expect(assigns(:jingle)).to be_a_new(Jingle)
      end

      it "re-renders the 'new' template" do
        post :create, xhr: true, params: { jingle: invalid_attributes }, format: :js
        expect(response).to render_template('users/jingles/create')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) { attributes_for(:jingle) }
      let!(:jingle) { create(:jingle, valid_attributes.merge!(user: @user)) }

      it 'updates the requested jingle' do
        put :update, xhr: true, params: { id: jingle.to_param, jingle: new_attributes }
        jingle.reload
        expect(jingle.title).to eq(new_attributes[:title])
      end

      it 'assigns the requested jingle as @jingle' do
        put :update, xhr: true, params: { id: jingle.to_param, jingle: valid_attributes }
        expect(assigns(:jingle)).to eq(jingle)
      end

      it 'redirects to the jingle' do
        put :update, xhr: true, params: { id: jingle.to_param, jingle: valid_attributes }
        expect(response).to render_template('users/jingles/update')
      end

      it 'assigns jingles if format is js' do
        put :update, xhr: true, params: { id: jingle.to_param, jingle: valid_attributes }
        expect(assigns(:jingles)).to eq(@user.jingles)
      end
    end

    context 'with invalid params' do
      let(:jingle) { create(:jingle, valid_attributes.merge!(user: @user)) }

      it 'assigns the jingle as @jingle' do
        process :update, method: :put, params: { id: jingle.to_param, jingle: invalid_attributes }, format: :js
        expect(assigns(:jingle)).to eq(jingle)
      end

      it "re-renders the 'edit' template" do
        process :update, method: :put, params: { id: jingle.to_param, jingle: invalid_attributes }, format: :js
        expect(response).to render_template('users/jingles/update')
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:jingle) { create(:jingle, valid_attributes.merge!(user: @user)) }

    it 'destroys the requested jingle' do
      expect do
        delete :destroy, xhr: true, params: { id: jingle.to_param }
      end.to change(Jingle, :count).by(-1)
    end

    it 'redirects to the tags list' do
      delete :destroy, xhr: true, params: { id: jingle.to_param }
      expect(response).to render_template('users/jingles/destroy')
    end
  end
end
