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
        url = File.join(@server, '/restapi/oauth/token')
        body = {
           'username': username,
           'extension': extension,
           'password': password,
           'grant_type': 'password',
         }
        header = {
            'Authorization': autorizationHeader
        }
        response = RestClient.post(url, body, header)
        @token = JSON.parse(response.body)
    end

    def get(endpoint, params = nil)
      url = File.join(@server, endpoint)
      headers = {
        'Authorization': autorizationHeader
      }
      headers['params'] = params if params
      response = RestClient.get(url, headers)
      response
    end

    def post(endpoint, body, params = nil)
      url = File.join(@server, endpoint)
      headers = {
        'Authorization': autorizationHeader,
        'Content-Type': 'application/json',
      }
      headers['params'] = params if params
      response = RestClient.post(url, body.to_json, headers)
      response
    end

    def put(endpoint, body, params = nil)
      url = File.join(@server, endpoint)
      headers = {
        'Authorization': autorizationHeader,
        'Content-Type': 'application/json',
      }
      headers['params'] = params if params
      response = RestClient.put(url, body.to_json, headers)
      response
    end

    private

    def basicKey
        Base64.encode64("#{@appKey}:#{@appSecret}").gsub(/\s/, '')
    end

    def autorizationHeader
      if @token
        "Bearer #{@token['access_token']}"
      else
        "Basic #{basicKey}"
      end
    end
end
