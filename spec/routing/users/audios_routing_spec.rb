require 'rails_helper'

RSpec.describe Users::AudiosController, type: :routing do
  describe 'routing' do
    it 'routes to #new' do
      expect(get: '/users/audios/new').to route_to('users/audios#new')
    end

    it 'routes to #edit' do
      expect(get: '/users/audios/1/edit').to route_to('users/audios#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/users/audios').to route_to('users/audios#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/users/audios/1').to route_to('users/audios#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/users/audios/1').to route_to('users/audios#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/users/audios/1').to route_to('users/audios#destroy', id: '1')
    end
  end
end
