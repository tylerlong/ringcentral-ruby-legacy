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
        payload = {
           'username': username,
           'extension': extension,
           'password': password,
           'grant_type': 'password',
         }
        header = {
            'Authorization': autorizationHeader
        }
        response = RestClient.post(url, payload, header)
        @token = JSON.parse(response.body)
    end

    def get(endpoint, params = nil)
      return execute(:get, endpoint, nil, params)
    end

    def post(endpoint, payload, params = nil)
      url = File.join(@server, endpoint)
      headers = {
        'Authorization': autorizationHeader,
        'Content-Type': 'application/json',
      }
      headers['params'] = params if params
      response = RestClient.post(url, payload.to_json, headers)
      response
    end

    def put(endpoint, payload, params = nil)
      url = File.join(@server, endpoint)
      headers = {
        'Authorization': autorizationHeader,
        'Content-Type': 'application/json',
      }
      headers['params'] = params if params
      response = RestClient.put(url, payload.to_json, headers)
      response
    end

    def delete(endpoint, params = nil)
      return execute(:delete, endpoint, nil, params)
    end

    def execute(method, endpoint, payload = nil, params = nil)
      url = File.join(@server, endpoint)
      headers = {
        'Authorization': autorizationHeader
      }
      if method == :post || method == :put
        headers['Content-Type'] = 'application/json'
      end
      if params
        headers['params'] = params
      end
      return RestClient::Request.execute(method: method, url: url, payload: payload, headers: headers)
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
