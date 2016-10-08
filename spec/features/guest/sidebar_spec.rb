require 'rails_helper'

RSpec.describe 'Guest', type: :feature, js: true do
  before :each do
    visit root_path
  end

  describe 'can toggle sidebar' do
    context 'when already visible' do
      before :each do
        find('#sidebar').click
      end

      it 'via the bar' do
        find('#sidebar').click
        within '#sidebar' do
          expect(page).not_to have_css('.visible')
        end
      end

      it 'via body' do
        find('body').click
        within '#sidebar' do
          expect(page).not_to have_css('.visible')
        end
      end
    end

    context 'when not visible' do
      it 'via the logo' do
        find('#sidebar').click
        expect(page).to have_css('#sidebar.visible')
      end
    end
  end
end
