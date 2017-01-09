require_relative './env'
require_relative '../src/ringcentral'

rc = RingCentral.new($app_key, $app_secret, $server)

puts rc.restapi().getResponse
puts rc.restapi('v1.0').getResponse
puts rc.restapi().get
puts rc.restapi('v1.0').get

rc.authorize($username, $extesion, $password)

puts rc.restapi('v1.0').dictionary().country().getResponse
puts rc.restapi('v1.0').dictionary().country('46').getResponse

dictionary = rc.restapi('v1.0').dictionary()
country = dictionary.country('46').get
puts country['id']
puts country['name']
puts country['isoCode']
puts country.id
puts country.name
puts country.isoCode
