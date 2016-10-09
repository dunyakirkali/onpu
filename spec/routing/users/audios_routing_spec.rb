require 'rails_helper'

RSpec.describe Users::AudiosController, type: :routing do
  describe 'routing' do
    it 'routes to #new' do
      expect(get: '/users/jingles/1/audio/new').to route_to('users/audios#new', jingle_id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/users/jingles/1/audio/edit').to route_to('users/audios#edit', jingle_id: '1')
    end

    it 'routes to #create' do
      expect(post: '/users/jingles/1/audio').to route_to('users/audios#create', jingle_id: '1')
    end

    it 'routes to #update via PUT' do
      expect(put: '/users/jingles/1/audio').to route_to('users/audios#update', jingle_id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/users/jingles/1/audio').to route_to('users/audios#update', jingle_id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/users/jingles/1/audio').to route_to('users/audios#destroy', jingle_id: '1')
    end
  end
end
