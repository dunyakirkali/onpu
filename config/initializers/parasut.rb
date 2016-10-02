require 'parasut'

Parasut.options do |option|
  option.client_id = ENV['PARASUT_CLIENT_ID']
  option.client_secret = ENV['PARASUT_CLIENT_SECRET']
  option.username = ENV['PARASUT_USERNAME']
  option.password = ENV['PARASUT_PASSWORD']
  option.company_id = ENV['PARASUT_COMPANY_ID']
end
