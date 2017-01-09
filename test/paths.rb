require 'dotenv'
Dotenv.load

require_relative '../src/ringcentral'

production = ENV['production'] == 'true'
app_key = ENV['appKey']
app_secret = ENV['appSecret']
server = ENV['server']
username = ENV['username']
extension = ENV['extension']
password = ENV['password']
receiver = ENV['receiver']

rc = RingCentral.new(app_key, app_secret, server)

require_relative '../src/paths/restapi'
require_relative '../src/paths/pathSegment'

restapi = Restapi.new(PathSegment.new(rc))
puts restapi.endpoint
restapi = Restapi.new(PathSegment.new(rc), 'v1.0')
puts restapi.endpoint

puts rc.restapi().endpoint
puts rc.restapi('v1.0').endpoint

puts rc.restapi().get
puts rc.restapi('v1.0').get
