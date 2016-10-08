require 'rails_helper'

RSpec.describe 'User', type: :feature, js: true do
  before :each do
    visit root_path
  end

  describe 'can creaete a new jingle' do
    it 'via sidebar' do
      find('#sidebar').click
      click_on 'New Jingle'
      expect(page).to have_content('Jingle was successfully created.')
    end
  end

  describe 'can delete a jingle' do
    it 'via content' do
      click_on 'Delete'
      expect(page).to have_content('Jingle was successfully destroyed.')
    end
  end

  describe 'can edit a jingle' do
    it 'via content' do
      click_on 'Edit'
      expect(page).to have_content('Jingle was successfully updated.')
    end
  end
end
