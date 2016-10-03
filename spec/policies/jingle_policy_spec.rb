require 'rails_helper'

RSpec.describe JinglePolicy, type: :policy do
  subject { JinglePolicy.new(user, jingle) }

  let(:jingle) { create(:jingle) }

  context 'being a visitor' do
    let(:user) { nil }

    it { should permit_action(:buy) }
    it { should forbid_action(:edit) }
    it { should forbid_action(:destroy) }
  end

  context 'being a user' do
    let(:user) { create(:user) }

    it { should permit_action(:buy) }
    it { should forbid_action(:edit) }
    it { should forbid_action(:destroy) }
  end

  context 'being an owner' do
    let(:user) { create(:user) }

    before :each do
      user.jingles << jingle
    end

    it { should permit_action(:buy) }
    it { should permit_action(:edit) }
    it { should permit_action(:destroy) }
  end
end
