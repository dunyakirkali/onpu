require 'rails_helper'

RSpec.describe JinglesController, type: :controller do
  let(:valid_attributes) { attributes_for(:jingle) }

  describe 'GET #index' do
    xit 'assigns all jingles as @jingles' do
      jingle = create(:jingle, valid_attributes)
      process :index, method: :get, params: {}
      expect(assigns(:jingles)).to match_array([jingle])
    end
  end

  describe 'GET #buy' do
    it 'assigns jingle as @jingle' do
      jingle = create(:jingle, valid_attributes)
      process :buy, method: :get, params: { id: jingle.to_param }
      expect(assigns(:jingle)).to eq(jingle)
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
