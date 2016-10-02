require 'webmock/rspec'

RSpec.configure do |config|
  WebMock.disable_net_connect!(allow_localhost: true)

  config.before(:each) do
    stub_request(:post, 'https://api.parasut.com/oauth/token?client_id&client_secret&grant_type=password&password&redirect_uri=urn:ietf:wg:oauth:2.0:oob&username')
      .to_return(status: 200, body: {}.to_json, headers: {})

    stub_request(:post, 'https://api.parasut.com/oauth/token?client_id&client_secret&grant_type=refresh_token&refresh_token')
      .to_return(status: 200, body: {}.to_json, headers: {})

    stub_request(:post, 'https://api.parasut.com/v1/products')
      .to_return(status: 200, body: {
        product: {
          id: 1,
          code: nil,
          name: 'Gazete - dergi insert',
          vat_rate: '18.0',
          currency: 'TRL',
          list_price: '1500.00',
          archived: false,
          category: {
            id: 5,
            name: 'Baskı',
            bg_color: '5cbc68',
            text_color: 'f3f2f2'
          }
        }
      }.to_json, headers: {})
  end
end
