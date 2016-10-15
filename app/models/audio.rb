# Audio
class Audio < ApplicationRecord
  # Includes
  include Disposable

  # Relations
  has_attached_file :file
  has_one :jingle

  # Validations
  validates_attachment_presence :file
  validates_attachment :file, content_type: { content_type: ['audio/mpeg', 'audio/mp3'] }

  # Processors
  process_in_background :file
end
