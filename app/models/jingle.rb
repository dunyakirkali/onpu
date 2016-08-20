# Jingle
class Jingle < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  # Relations
  has_attached_file :audio
  belongs_to :user

  # Validations
  validates_attachment :audio, content_type: { content_type: ['audio/mpeg', 'audio/mp3'] }, file_name: { matches: [/mp3\Z/] }
  validates :user, presence: true
end
