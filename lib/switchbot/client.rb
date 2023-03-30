# frozen_string_literal: true

module Switchbot
  class Client
    API_VERSION = 'v1.1'

    def initialize(token, secret)
      @request = Request.new(token, secret)
    end

    def devices
      @request.get("/#{API_VERSION}/devices")
    end

    def device(device_id)
      Device.new(client: self, device_id: device_id)
    end

    def status(device_id:)
      @request.get("/#{API_VERSION}/devices/#{device_id}/status")
    end

    def commands(device_id:, command:, parameter: 'default', command_type: 'command')
      @request.post("/#{API_VERSION}/devices/#{device_id}/commands",
                    params: { command: command, parameter: parameter, commandType: command_type })
    end

    def scenes
      @request.get("/#{API_VERSION}/scenes")
    end

    def scene(scene_id)
      Scene.new(client: self, scene_id: scene_id)
    end

    def execute(scene_id:)
      @request.post("/#{API_VERSION}/scenes/#{scene_id}/execute")
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
  end
end
