require 'rest-client'
require 'base64'

class RingCentral
    def initialize(appKey, appSecret, server)
        @appKey = appKey
        @appSecret = appSecret
        @server = server
    end

    def authorize(username, extension, password)
        url = @server + '/restapi/oauth/token'
        body = {
           'username' => username,
           'extension' => extension,
           'password' => password,
           'grant_type' => "password",
         }
        header = {
            'Authorization': "Basic #{basicKey}"
        }
        response = RestClient.post(url, body, header)
        puts response
    end

    private

    def basicKey
        Base64.encode64("#{@appKey}:#{@appSecret}").gsub(/\s/, '')
    end
end
