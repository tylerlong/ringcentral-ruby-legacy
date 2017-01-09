require 'rest-client'
require 'base64'
require 'json'

class RingCentral
    def initialize(appKey, appSecret, server)
        @appKey = appKey
        @appSecret = appSecret
        @server = server
        @token = nil
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
        @token = JSON.parse(response.body)
    end

    def get(endpoint, params = nil)
      url = @server + endpoint
      headers = {}
      headers['params'] = params if params
      headers['Authorization'] = "Bearer #{@token['access_token']}" if @token
      response = RestClient.get(url, headers)
      puts response
    end

    private

    def basicKey
        Base64.encode64("#{@appKey}:#{@appSecret}").gsub(/\s/, '')
    end
end
