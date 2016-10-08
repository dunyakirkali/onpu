require 'rails_helper'

RSpec.describe 'User', type: :feature, js: true do
  let(:jingle) { build(:jingle) }

  context 'w/o a jingle' do
    describe 'can creaete a new jingle' do
      it 'via sidebar' do
        user = create(:user)
        login_as(user)
        visit root_path
        find('#sidebar').click
        click_on 'New Jingle'
        fill_in 'jingle_title', with: jingle.title
        fill_in 'jingle_price', with: jingle.price
        attach_file 'jingle_audio', Rails.root.join('spec/fixtures/audio.mp3')
        attach_file 'jingle_cover', Rails.root.join('spec/fixtures/cover.jpg')
        click_on 'Create Jingle'
        expect(page).to have_content('Jingle was successfully created.')
      end
    end
  end

  context 'w a jingle' do
    describe 'can delete a jingle' do
      it 'via content' do
        user = create(:user, :with_jingels)
        login_as(user)
        visit root_path
        click_on 'Destroy'
        expect(page).to have_content('Jingle was successfully destroyed.')
      end
    end

    describe 'can edit a jingle' do
      it 'via content' do
        user = create(:user, :with_jingels)
        login_as(user)
        visit root_path
        click_on 'Edit'
        fill_in 'jingle_title', with: jingle.title
        click_on 'Update Jingle'
        expect(page).to have_content('Jingle was successfully updated.')
      end
    end
  end
end
