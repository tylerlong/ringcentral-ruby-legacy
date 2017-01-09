require_relative './env'
require_relative '../src/ringcentral'

rc = RingCentral.new($app_key, $app_secret, $server)

puts rc.restapi().endpoint
puts rc.restapi('v1.0').endpoint

puts rc.restapi('v1.0').dictionary().endpoint
