require 'rails_helper'

RSpec.describe Jingle, type: :model do
  # Relations
  it { should have_attached_file(:audio) }
  it { should belong_to(:user) }

  # Validations
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:user) }
  it { should validate_attachment_presence(:audio) }
  it { should validate_attachment_content_type(:audio).allowing('audio/mpeg', 'audio/mp3').rejecting('text/plain', 'text/xml') }
  it { should validate_attachment_presence(:cover) }
  it { should validate_attachment_content_type(:cover).allowing('image/jpeg', 'image/png').rejecting('text/plain', 'text/xml') }

  # Money
  it { is_expected.to monetize(:price) }
end
