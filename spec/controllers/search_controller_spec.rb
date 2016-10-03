require 'rails_helper'

RSpec.describe SearchController, type: :controller do
  describe 'GET #index' do
    it 'assigns all jingles as @jingles' do
      jingle = create(:jingle)
      process :jingles, method: :get, params: {}
      expect(assigns(:jingles)).to match_array([jingle])
    end
  end
end
