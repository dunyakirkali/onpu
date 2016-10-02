# AuthHelpers
module AuthHelpers
  # mock omniauth hash
  def omniauth_hash(email)
    OmniAuth::AuthHash.new(
      provider: 'google',
      uid: '1337',
      info: {
        email: email,
        password: Faker::Internet.password,
        credentials: {
          refresh_token: 'TOKEN_STRING'
        }
      }
    )
  end
end
