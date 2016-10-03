require 'rails_helper'

RSpec.describe SearchController, type: :routing do
  describe 'routing' do
    it 'routes to #jingles' do
      expect(get: '/search/jingles').to route_to('search#jingles')
    end
  end
end
