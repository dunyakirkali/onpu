require 'webmock/rspec'

RSpec.configure do |config|
  WebMock.disable_net_connect!(allow_localhost: true)

  config.before(:each) do
    stub_request(:post, 'https://api.parasut.com/oauth/token?client_id&client_secret&grant_type=password&password&redirect_uri=urn:ietf:wg:oauth:2.0:oob&username')
      .to_return(status: 200, body: '', headers: {})
  end
end
