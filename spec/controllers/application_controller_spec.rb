require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  controller do
    def index
      render plain: 'index', status: 200
    end
  end

  describe 'Basic auth' do
    context "when ENV's set" do
      it 'deny' do
        ENV['AUTH_USERNAME'] = 'username'
        ENV['AUTH_PASSWORD'] = 'password'
        get :index
        expect(response).to have_http_status(401)
      end
    end

    context "when ENV's not set" do
      it 'allow' do
        get :index
        expect(response).to have_http_status(200)
      end
    end

    after :each do
      ENV['AUTH_USERNAME'] = nil
      ENV['AUTH_PASSWORD'] = nil
    end
  end
end
