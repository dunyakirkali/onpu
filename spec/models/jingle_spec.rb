require 'rails_helper'

RSpec.describe Jingle, type: :model do
  # Relations
  it { should belong_to(:user) }
  it { should belong_to(:audio).dependent(:destroy) }
  it { should belong_to(:image).dependent(:destroy) }

  # Validations
  it { should validate_presence_of(:audio) }
  it { should validate_presence_of(:image) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:user) }

  # Money
  it { is_expected.to monetize(:price) }

  # Nested Attrs
  it { should accept_nested_attributes_for(:image) }
end
