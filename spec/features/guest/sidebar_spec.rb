require 'rails_helper'

RSpec.describe 'Guest', type: :feature do
  describe 'can toggle sidebar' do
    context 'when already visible' do
      it 'via the logo' do
        within '#sidebar' do
          find('.logo').click
        end
        expect(page).not_to have_css('#sidebar.visible')
      end

      it 'via body' do
        within '#sidebar' do
          find('body').click
        end
        expect(page).not_to have_css('#sidebar.visible')
      end
    end
    
    context 'when not visible' do
      it 'via the logo' do
        within '#sidebar' do
          find('.logo').click
        end
        expect(page).to have_css('#sidebar.visible')
      end
    end
  end
end
