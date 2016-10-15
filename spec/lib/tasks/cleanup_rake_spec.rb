require 'rails_helper'

RSpec.describe 'cleanup:images' do
  include_context 'rake'

  its(:prerequisites) { should include('environment') }

  it 'destroys unattached images created before equal yesterday' do
    create(:image, :old)
    expect { subject.invoke }.to change(Image, :count).by(-1)
  end
end

RSpec.describe 'cleanup:audios' do
  include_context 'rake'

  its(:prerequisites) { should include('environment') }

  it 'destroys unattached audios created before equal yesterday' do
    create(:audio, :old)
    expect { subject.invoke }.to change(Audio, :count).by(-1)
  end
end
