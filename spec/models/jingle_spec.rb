require 'rails_helper'

RSpec.describe Jingle, type: :model do
  # Relations
  it { should belong_to(:user) }
  it { should belong_to(:audio) }
  it { should belong_to(:image) }

  # Validations
  it { should validate_presence_of(:audio) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:user) }

  # Money
  it { is_expected.to monetize(:price) }
end
