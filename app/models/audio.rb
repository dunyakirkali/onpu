# Audio
class Audio < ApplicationRecord
  # Relations
  has_attached_file :file
  has_one :jingle

  # Validations
  validates_attachment_presence :file
  validates_attachment :file, content_type: { content_type: ['audio/mpeg', 'audio/mp3'] }
end
