# Jingle
class Jingle < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  # Relations
  has_attached_file :audio
  belongs_to :user

  # Validations
  validates_attachment_presence :audio
  validates_attachment :audio, content_type: { content_type: ['audio/mpeg', 'audio/mp3'] }, file_name: { matches: [/mp3\Z/] }
  validates :user, :title, presence: true

  # Filters
  after_create :create_parasut_product
  # TODO: (dunyakirkali) update
  before_destroy :destroy_parasut_product

  # Money
  monetize :price_cents

  private

  def create_parasut_product
    parasut_product = Parasut::Product.create(parasut_product_attrs)
    update_column(:parasut_id, parasut_product.id)
  end

  def parasut_product_attrs
    {
      code: nil,
      name: title,
      vat_rate: '18.0',
      currency: price.currency.iso_code,
      list_price: price.to_s,
      archived: false,
      category: {
        id: 1,
        name: 'Jingle',
        bg_color: '5cbc68',
        text_color: 'f3f2f2'
      }
    }
  end

  def destroy_parasut_product
    parasut_product = Parasut::Product.find(parasut_id)
    parasut_product.destroy
  end
end
