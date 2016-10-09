require 'rails_helper'

RSpec.describe Audio, type: :model do
  # Relations
  it { should have_attached_file(:file) }
  it { should have_one(:jingle) }

  # Validations
  it { should validate_attachment_presence(:file) }
  it { should validate_attachment_content_type(:file).allowing('audio/mpeg', 'audio/mp3').rejecting('text/plain', 'text/xml') }
end
