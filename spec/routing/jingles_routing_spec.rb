require 'rails_helper'

RSpec.describe JinglesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/jingles').to route_to('jingles#index')
    end

    it 'routes to #buy' do
      expect(get: '/jingles/1/buy').to route_to('jingles#buy', id: '1')
    end

    it 'routes to #show' do
      expect(get: '/jingles/1').to route_to('jingles#show', id: '1')
    end
  end
end
