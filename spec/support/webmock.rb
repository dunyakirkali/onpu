require 'webmock/rspec'

RSpec.configure do |config|
  WebMock.disable_net_connect!(allow_localhost: true)

  # config.before(:each) do
  #   stub_request(:post, "https://hni365.sharepoint.com/Projectentool-dev/_api/web/webinfos/add")
  #     .to_return(status: 200, body: "", headers: {})
  # end
end
