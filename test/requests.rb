require_relative './env'
require_relative '../src/ringcentral'

rc = RingCentral.new($app_key, $app_secret, $server)

puts rc.restapi().getResponse
puts rc.restapi('v1.0').getResponse

rc.authorize($username, $extesion, $password)

puts rc.restapi('v1.0').dictionary().country().getResponse
puts rc.restapi('v1.0').dictionary().country('46').getResponse
