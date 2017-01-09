require 'dotenv'
Dotenv.load

require_relative './ringcentral'

appKey = ENV['appKey']
appSecret = ENV['appSecret']
server = ENV['server']
username = ENV['username']
extension = ENV['extension']
password = ENV['password']


rc = RingCentral.new(appKey, appSecret, server)
rc.authorize(username, extension, password)
