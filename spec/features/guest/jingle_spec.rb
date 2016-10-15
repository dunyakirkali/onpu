require 'rails_helper'

RSpec.describe 'Guest', type: :feature, js: true do
  let!(:jingle) { create(:jingle) }

  before :each do
    visit root_path
  end

  it 'can view a jingle' do
    within '.jingle-header' do
      first('a').trigger('click')
    end
    expect(page).to have_css('#jingle-player')
  end
end
