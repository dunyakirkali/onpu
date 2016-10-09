require 'rails_helper'

RSpec.describe Jingle, type: :model do
  # Relations
  it { should belong_to(:user) }
  it { should belong_to(:audio) }

  # Validations
  it { should validate_presence_of(:audio) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:user) }
  it { should validate_attachment_presence(:cover) }
  it { should validate_attachment_content_type(:cover).allowing('image/jpeg', 'image/png').rejecting('text/plain', 'text/xml') }

  # Money
  it { is_expected.to monetize(:price) }
end
