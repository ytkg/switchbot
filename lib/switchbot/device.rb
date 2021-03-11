# frozen_string_literal: true

module Switchbot
  class Device
    attr_reader :client, :device_id

    def initialize(client:, device_id:)
      @client = client
      @device_id = device_id
    end

    def status
      client.status(device_id: device_id)
    end

    def commands(command:, parameter: 'default', command_type: 'command')
      client.commands(device_id: device_id, command: command, parameter: parameter, command_type: command_type)
    end

    def on
      client.commands(device_id: device_id, command: 'turnOn')
    end

    def off
      client.commands(device_id: device_id, command: 'turnOff')
    end

    def on?
      status[:body][:power] == 'on'
    end

    def off?
      !on?
    end
  end
end
