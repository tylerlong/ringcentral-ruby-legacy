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

# GET
response = rc.get('/restapi/v1.0/account/~/extension/~')
puts response

# POST
# response = rc.post('/restapi/v1.0/account/~/extension/~/sms', { to: [{ phoneNumber: receiver }], from: { phoneNumber: username }, text: 'Hello world' })
# puts response

# PUT
# response = rc.get('/restapi/v1.0/account/~/extension/~/message-store', { direction: 'Outbound' })
# messageId = JSON.parse(response)['records'][0]['id']
# response = rc.put("/restapi/v1.0/account/~/extension/~/message-store/#{messageId}", { readStatus: 'Read'})
# puts response

# DELETE
# response = rc.post('/restapi/v1.0/account/~/extension/~/sms', { to: [{ phoneNumber: receiver }], from: { phoneNumber: username }, text: 'Hello world' })
# messageId = JSON.parse(response)['id']
# response = rc.delete("/restapi/v1.0/account/~/extension/~/message-store/#{messageId}", { purge: false })
# puts response.code
