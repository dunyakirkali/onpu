require 'rails_helper'

RSpec.describe FactoryGirl do
  it 'lints factories successfully' do
    described_class.lint
  end
end
