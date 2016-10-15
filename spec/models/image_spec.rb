require 'rails_helper'

RSpec.describe Image, type: :model do
  # Includes
  it_behaves_like 'disposable'

  # Relations
  it { should have_attached_file(:file) }
  it { should have_one(:jingle) }

  # Validations
  it { should validate_attachment_presence(:file) }
  it { should validate_attachment_content_type(:file).allowing('image/jpeg', 'image/png').rejecting('text/plain', 'text/xml') }
end
