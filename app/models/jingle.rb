# Jingle
class Jingle < ApplicationRecord
  # FriendlyId
  extend FriendlyId
  friendly_id :title, use: :slugged

  # Money
  monetize :price_cents

  # Relations
  belongs_to :user
  belongs_to :audio
  belongs_to :image

  # Validations
  validates :user, :title, :audio, :image, presence: true

  # Filters
  after_create :create_parasut_product
  after_create :update_parasut_product
  before_destroy :destroy_parasut_product

  private

  def create_parasut_product
    parasut_product = Parasut::Product.create(parasut_product_attrs)
    update_column(:parasut_id, parasut_product.id)
  rescue
    Rails.logger.info '~~~ Error @ create_parasut_product'
  end

  def update_parasut_product
    Parasut::Product.save_existing(parasut_id, parasut_product_attrs)
  rescue
    Rails.logger.info '~~~ Error @ update_parasut_product'
  end

  def destroy_parasut_product
    parasut_product = Parasut::Product.find(parasut_id)
    parasut_product.destroy
  rescue
    Rails.logger.info '~~~ Error @ destroy_parasut_product'
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
end
