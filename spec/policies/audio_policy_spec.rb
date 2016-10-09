require 'rails_helper'

RSpec.describe AudioPolicy, type: :policy do
  subject { AudioPolicy.new(user, audio) }

  let(:audio) { create(:audio) }

  context 'being a visitor' do
    let(:user) { nil }

    it { should forbid_action(:new) }
    it { should forbid_action(:create) }
  end

  context 'being a user' do
    let(:user) { create(:user) }

    it { should permit_action(:new) }
    it { should permit_action(:create) }
  end
end
