require 'rails_helper'

RSpec.describe Users::JinglesController, type: :controller do
  login_user

  let(:valid_attributes) { attributes_for(:jingle) }
  let(:invalid_attributes) { attributes_for(:jingle, name: nil) }
  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'assigns all categories as @categories' do
      jingle = create(:jingle, valid_attributes)
      process :index, method: :get, params: {}
      expect(assigns(:jingles)).to match_array([jingle])
    end
  end

  describe 'GET #new' do
    it 'assigns a new jingle as @jingle' do
      process :new, method: :get, params: {}
      expect(assigns(:jingle)).to be_a_new(Jingle)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested jingle as @jingle' do
      jingle = create(:jingle, valid_attributes)
      process :edit, method: :get, params: { id: jingle.to_param }
      expect(assigns(:jingle)).to eq(jingle)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Jingle' do
        expect do
          process :create, method: :post, params: { jingle: valid_attributes }
        end.to change(Jingle, :count).by(1)
      end

      it 'assigns a newly created catgory as @jingle' do
        process :create, method: :post, params: { jingle: valid_attributes }
        expect(assigns(:jingle)).to be_a(Jingle)
        expect(assigns(:jingle)).to be_persisted
      end

      it 'redirects to the created jingle' do
        process :create, method: :post, params: { jingle: valid_attributes }
        expect(response).to redirect_to(users_categories_path)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved jingle as @jingle' do
        process :create, method: :post, params: { jingle: invalid_attributes }
        expect(assigns(:jingle)).to be_a_new(Jingle)
      end

      it "re-renders the 'new' template" do
        process :create, method: :post, params: { jingle: invalid_attributes }
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) { attributes_for(:jingle) }

      it 'updates the requested jingle' do
        jingle = create(:jingle, valid_attributes)
        process :update, method: :put, params: { id: jingle.to_param, jingle: new_attributes }
        jingle.reload
        expect(jingle.name).to eq(new_attributes[:name])
      end

      it 'assigns the requested jingle as @jingle' do
        jingle = create(:jingle, valid_attributes)
        process :update, method: :put, params: { id: jingle.to_param, jingle: valid_attributes }
        expect(assigns(:jingle)).to eq(jingle)
      end

      it 'redirects to the jingle' do
        jingle = create(:jingle, valid_attributes)
        process :update, method: :put, params: { id: jingle.to_param, jingle: valid_attributes }
        expect(response).to redirect_to(users_categories_path)
      end
    end

    context 'with invalid params' do
      it 'assigns the jingle as @jingle' do
        jingle = create(:jingle, valid_attributes)
        process :update, method: :put, params: { id: jingle.to_param, jingle: invalid_attributes }
        expect(assigns(:jingle)).to eq(jingle)
      end

      it "re-renders the 'edit' template" do
        jingle = create(:jingle, valid_attributes)
        process :update, method: :put, params: { id: jingle.to_param, jingle: invalid_attributes }
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested jingle' do
      jingle = create(:jingle, valid_attributes)
      expect do
        process :destroy, method: :delete, params: { id: jingle.to_param }
      end.to change(Jingle, :count).by(-1)
    end

    it 'redirects to the tags list' do
      jingle = create(:jingle, valid_attributes)
      process :destroy, method: :delete, params: { id: jingle.to_param }
      expect(response).to redirect_to(users_categories_path)
    end
  end
end
