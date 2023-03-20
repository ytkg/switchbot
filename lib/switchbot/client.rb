# frozen_string_literal: true

module Switchbot
  class Client
    API_ENDPOINT = 'https://api.switch-bot.com'
    API_VERSION = 'v1.1'

    def initialize(token, secret)
      @token = token
      @secret = secret
    end

    def devices
      request(
        http_method: :get,
        endpoint: "/#{API_VERSION}/devices"
      )
    end

    def device(device_id)
      Device.new(client: self, device_id: device_id)
    end

    def status(device_id:)
      request(
        http_method: :get,
        endpoint: "/#{API_VERSION}/devices/#{device_id}/status"
      )
    end

    def commands(device_id:, command:, parameter: 'default', command_type: 'command')
      request(
        http_method: :post,
        endpoint: "/#{API_VERSION}/devices/#{device_id}/commands",
        params: {
          command: command,
          parameter: parameter,
          commandType: command_type
        }
      )
    end

    def scenes
      request(
        http_method: :get,
        endpoint: "/#{API_VERSION}/scenes"
      )
    end

    def scene(scene_id)
      Scene.new(client: self, scene_id: scene_id)
    end

    def execute(scene_id:)
      request(
        http_method: :post,
        endpoint: "/#{API_VERSION}/scenes/#{scene_id}/execute"
      )
    end

    def bot(device_id)
      Bot.new(client: self, device_id: device_id)
    end

    def light(device_id)
      Light.new(client: self, device_id: device_id)
    end

    def humidifier(device_id)
      Humidifier.new(client: self, device_id: device_id)
    end

    def color_bulb(device_id)
      ColorBulb.new(client: self, device_id: device_id)
    end

    def lock(device_id)
      Lock.new(client: self, device_id: device_id)
    end

    def plug_mini(device_id)
      PlugMini.new(client: self, device_id: device_id)
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
