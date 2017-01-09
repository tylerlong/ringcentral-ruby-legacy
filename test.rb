require 'dotenv'
Dotenv.load

require_relative './ringcentral'

production = ENV['production'] == 'true'
app_key = ENV['appKey']
app_secret = ENV['appSecret']
server = ENV['server']
username = ENV['username']
extension = ENV['extension']
password = ENV['password']
receiver = ENV['receiver']

rc = RingCentral.new(app_key, app_secret, server)
rc.authorize(username, extension, password)

# GET
response = rc.get('/restapi/v1.0/account/~/extension/~')
puts response

# POST
response = rc.post('/restapi/v1.0/account/~/extension/~/sms',
                   to: [{ phoneNumber: receiver }],
                   from: { phoneNumber: username },
                   text: 'Hello world')
puts response

# PUT
response = rc.get('/restapi/v1.0/account/~/extension/~/message-store',
                  direction: 'Outbound')
message_id = JSON.parse(response)['records'][0]['id']
response = rc.put("/restapi/v1.0/account/~/extension/~/message-store/#{message_id}",
                  readStatus: 'Read')
puts response

# DELETE
response = rc.post('/restapi/v1.0/account/~/extension/~/sms',
                   to: [{ phoneNumber: receiver }],
                   from: { phoneNumber: username },
                   text: 'Hello world')
message_id = JSON.parse(response)['id']
response = rc.delete("/restapi/v1.0/account/~/extension/~/message-store/#{message_id}",
                     purge: false)
puts response.code
