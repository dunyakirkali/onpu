require 'rails_helper'

RSpec.describe JinglesController, type: :controller do
  let(:valid_attributes) { attributes_for(:jingle) }

  describe 'GET #index' do
    it 'assigns all jingles as @jingles' do
      jingle = create(:jingle, valid_attributes)
      process :index, method: :get, params: {}
      expect(assigns(:jingles)).to match_array([jingle])
    end
  end
end
