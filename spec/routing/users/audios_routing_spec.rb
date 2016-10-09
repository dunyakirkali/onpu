require 'rails_helper'

RSpec.describe Users::AudiosController, type: :routing do
  describe 'routing' do
    it 'routes to #new' do
      expect(get: '/users/audios/new').to route_to('users/audios#new')
    end

    it 'routes to #create' do
      expect(post: '/users/audios').to route_to('users/audios#create')
    end
  end
end
