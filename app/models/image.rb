# Image
class Image < ApplicationRecord
  # Relations
  has_attached_file :file, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: '/images/:style/missing.png'
  has_one :jingle

  # Validations
  validates_attachment_presence :file
  validates_attachment_content_type :file, content_type: /\Aimage/
  validates_attachment_file_name :file, matches: [/png\z/, /jpe?g\z/]
  do_not_validate_attachment_file_type :file
end
