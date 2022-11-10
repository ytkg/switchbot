# frozen_string_literal: true

module Switchbot
  class ColorBulb
    extend Forwardable

    def_delegators :@device, :status, :commands, :on, :off, :on?, :off?

    def initialize(client:, device_id:)
      @device = Device.new(client: client, device_id: device_id)
    end

    def toggle
      commands(command: 'toggle')
    end

    def brightness(value)
      commands(command: 'setBrightness', parameter: value)
    end

    def color(value)
      commands(command: 'setColor', parameter: value)
    end

    def color_temperature(value)
      commands(command: 'setColorTemperature', parameter: value)
    end
  end
end
