require 'dotenv'
Dotenv.load

require_relative './ringcentral'

production = ENV['production'] == 'true'
appKey = ENV['appKey']
appSecret = ENV['appSecret']
server = ENV['server']
username = ENV['username']
extension = ENV['extension']
password = ENV['password']
receiver = ENV['receiver']


rc = RingCentral.new(appKey, appSecret, server)
rc.authorize(username, extension, password)
# rc.get('/restapi/v1.0/account/~/extension/~')
rc.post('/restapi/v1.0/account/~/extension/~/sms', { to: [{ phoneNumber: receiver }], from: { phoneNumber: username }, text: 'Hello world' })
