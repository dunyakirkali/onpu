require 'rails_helper'
require 'pry'
RSpec.describe 'User', type: :feature, js: true do
  let(:jingle) { build(:jingle) }

  before :each do
    login_as(user)
  end

  context 'w/o a jingle' do
    let(:user) { create(:user) }

    describe 'can creaete a new jingle' do
      it 'via sidebar' do
        visit root_path
        find('#sidebar').click
        click_on 'New Jingle'
        fill_in 'jingle_title', with: jingle.title
        fill_in 'jingle_price', with: jingle.price
        click_on 'Create Jingle'
        expect(page).to have_content('Jingle was successfully created.')
      end
    end
  end

  context 'w a jingle' do
    let(:user) { create(:user, :with_jingels) }

    describe 'can delete a jingle' do
      fit 'via content' do
        visit root_path
        save_and_open_page
        click_on 'Delete'
        expect(page).to have_content('Jingle was successfully destroyed.')
      end
    end

    describe 'can edit a jingle' do
      it 'via content' do
        visit root_path
        click_on 'Edit'
        fill_in 'jingle_title', with: jingle.title
        click_on 'Update Jingle'
        expect(page).to have_content('Jingle was successfully updated.')
      end
    end
  end
end
