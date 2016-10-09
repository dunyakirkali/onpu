require 'rails_helper'

RSpec.describe JinglesController, type: :controller do
  let(:valid_attributes) { attributes_for(:jingle) }

  describe 'GET #buy' do
    it 'assigns jingle as @jingle' do
      jingle = create(:jingle, valid_attributes)
      get :buy, xhr: true, params: { id: jingle.to_param }, format: :js
      expect(assigns(:jingle)).to eq(jingle)
    end

    it "renders the 'buy' template" do
      get :buy, xhr: true, params: { id: jingle.to_param }, format: :js
      expect(response).to render_template('users/jingles/buy')
    end
  end

  describe 'GET #show' do
    it 'assigns jingle as @jingle' do
      jingle = create(:jingle, valid_attributes)
      process :show, method: :get, params: { id: jingle.to_param }
      expect(assigns(:jingle)).to eq(jingle)
    end
  end
end
