# Jingle
class Jingle < ApplicationRecord
  # FriendlyId
  extend FriendlyId
  friendly_id :title, use: :slugged

  # Money
  monetize :price_cents

  # Relations
  has_attached_file :audio
  has_attached_file :cover, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: '/images/:style/missing.png'

  belongs_to :user

  # Validations
  validates_attachment_presence :audio
  validates_attachment :audio, content_type: { content_type: ['audio/mpeg', 'audio/mp3'] }
  validates_attachment_presence :cover
  validates_attachment_content_type :cover, content_type: %r{\Aimage\/.*\z}
  validates :user, :title, presence: true

  # Filters
  # after_create :create_parasut_product
  # after_create :update_parasut_product
  # before_destroy :destroy_parasut_product

  private

  def create_parasut_product
    parasut_product = Parasut::Product.create(parasut_product_attrs)
    update_column(:parasut_id, parasut_product.id)
  end

  def update_parasut_product
    Parasut::Product.save_existing(parasut_id, parasut_product_attrs)
  end

  def parasut_product_attrs
    {
      code: nil,
      name: title,
      vat_rate: '18.0',
      currency: price.currency.iso_code,
      list_price: price.to_s,
      archived: false,
      category: parasut_product_category_attrs
    }
  end

  def parasut_product_category_attrs
    {
      id: 1,
      name: 'Jingle',
      bg_color: '5cbc68',
      text_color: 'f3f2f2'
    }
  end

  def destroy_parasut_product
    parasut_product = Parasut::Product.find(parasut_id)
    parasut_product.destroy
  end
end
