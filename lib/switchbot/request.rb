# frozen_string_literal: true

module Switchbot
  class Request
    API_ENDPOINT = 'https://api.switch-bot.com'

    def initialize(token, secret)
      @token = token
      @secret = secret
    end

    def get(endpoint)
      request(http_method: :get, endpoint: endpoint)
    end

    def post(endpoint, params: {})
      request(http_method: :post, endpoint: endpoint, params: params)
    end

    private

    def headers
      t = "#{Time.now.to_i}000"
      nonce = SecureRandom.alphanumeric
      sign = Base64.strict_encode64(OpenSSL::HMAC.digest('sha256', @secret, "#{@token}#{t}#{nonce}"))

      {
        'User-Agent' => "Switchbot v#{Switchbot::VERSION} (https://github.com/ytkg/switchbot)",
        'Authorization' => @token,
        'T' => t,
        'Sign' => sign,
        'Nonce' => nonce
      }
    end

    def connection
      Faraday.new(url: API_ENDPOINT, headers: headers) do |conn|
        conn.request :json
        conn.response :json
        conn.adapter :typhoeus, http_version: :httpv2_0 # rubocop:disable Naming/VariableNumber
      end
    end

    def request(http_method:, endpoint:, params: {})
      response = connection.public_send(http_method, endpoint, params)
      response.body.deep_transform_keys(&:underscore).deep_symbolize_keys
    end
  end
end
