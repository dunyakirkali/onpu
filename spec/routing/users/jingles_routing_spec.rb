require 'rails_helper'

RSpec.describe Users::JinglesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/users/jingles').to route_to('users/jingles#index')
    end

    it 'routes to #new' do
      expect(get: '/users/jingles/new').to route_to('users/jingles#new')
    end

    it 'routes to #show' do
      expect(get: '/users/jingles/1').to route_to('users/jingles#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/users/jingles/1/edit').to route_to('users/jingles#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/users/jingles').to route_to('users/jingles#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/users/jingles/1').to route_to('users/jingles#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/users/jingles/1').to route_to('users/jingles#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/users/jingles/1').to route_to('users/jingles#destroy', id: '1')
    end
  end
end
