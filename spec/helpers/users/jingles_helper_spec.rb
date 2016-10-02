require 'rails_helper'

RSpec.describe Users::JinglesHelper, type: :helper do
  let!(:user) { create(:user, :with_jingels) }

  describe '#delete_user_jingle' do
    before :each do
      @href = users_jingle_path(user.jingles.first)
    end
    it 'returns delete path for users jingle' do
      expect(helper.delete_user_jingle(@href)).to match(/#{@href}/)
    end

    it 'returns a link with data delete attribute' do
      expect(helper.delete_user_jingle(@href)).to match(/data-method="delete"/)
    end
  end
end
