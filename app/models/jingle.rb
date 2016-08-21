# Jingle
class Jingle < ApplicationRecord
  # FriendlyId
  extend FriendlyId
  friendly_id :title, use: :slugged

  # Money
  monetize :price_cents

  # Relations
  has_attached_file :audio
  belongs_to :user

  # Validations
  validates_attachment_presence :audio
  validates_attachment :audio, content_type: { content_type: ['audio/mpeg', 'audio/mp3'] }, file_name: { matches: [/mp3\Z/] }
  validates :user, :title, presence: true
end
