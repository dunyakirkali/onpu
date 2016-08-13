class User < ApplicationRecord
  devise :database_authenticatable, :omniauthable, omniauth_providers: [:google_oauth2]

  # Relations
  has_many :jingles

  # A method nedeed by omniauth-google-oauth2 gem
  # User is being created if it does not exist
  def self.find_for_google_oauth2(access_token, _ = nil)
    data = access_token.info
    User.where(email: data['email']).first_or_create(
      refresh_token: access_token.credentials ? access_token.credentials.refresh_token : nil
   )
  end
end
