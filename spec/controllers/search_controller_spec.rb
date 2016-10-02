require 'rails_helper'

RSpec.describe SearchController, type: :controller do

  describe "GET #jingles" do
    it "returns http success" do
      get :jingles
      expect(response).to have_http_status(:success)
    end
  end

end
