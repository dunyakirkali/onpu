require 'rails_helper'

RSpec.describe 'User', type: :feature, js: true do
  let(:jingle) { build(:jingle) }

  context 'w/o a jingle' do
    describe 'can creaete a new jingle' do
      let!(:user) { create(:user) }

      before :each do
        login_as(user)
        visit root_path
        find('#sidebar').click
      end

      it 'via sidebar' do
        click_on 'New Jingle'
        attach_file 'audio_file', Rails.root.join('spec/fixtures/audio.mp3')
        fill_in 'jingle_title', with: jingle.title
        fill_in 'jingle_price', with: jingle.price_cents
        attach_file 'jingle_image_attributes_file', Rails.root.join('spec/fixtures/cover.png')
        click_on 'Jingle Ekle'
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
        click_on 'Jingle Güncelle'
        expect(page).to have_content('Jingle was successfully updated.')
      end
    end
  end
end
